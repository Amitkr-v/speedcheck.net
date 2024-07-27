import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:speedcheck_net/Pages/check.dart';
import 'dart:io';

class SpeedCheckNet extends StatefulWidget {
  const SpeedCheckNet({Key? key}) : super(key: key);

  @override
  _SpeedCheckNetState createState() => _SpeedCheckNetState();
}

class _SpeedCheckNetState extends State<SpeedCheckNet> {
  final FlutterInternetSpeedTest speedTest = FlutterInternetSpeedTest();
  bool _isTesting = false;
  double _currentSpeed = 0.0;
  bool _isDownloadTest = true;
  List<double> _speedData = [];
  String _ipAddress = '';

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _getIpAddress();
    _startSpeedTest();
  }

  Future<void> _initConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    print("Connectivity Status: $result");
  }

  Future<void> _getIpAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          setState(() {
            _ipAddress = addr.address;
          });
          return;
        }
      }
    }
  }

  void _startSpeedTest() {
    setState(() {
      _isTesting = true;
      _currentSpeed = 0.0;
      _isDownloadTest = true;
      _speedData.clear();
    });

    speedTest.startTesting(
      useFastApi: true,
      onStarted: () {
        print("Speed test started");
      },
      onCompleted: (TestResult download, TestResult upload) {
        setState(() {
          _isTesting = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SpeedTestResultScreen(
              downloadSpeed: download.transferRate,
              uploadSpeed: upload.transferRate,
            ),
          ),
        );
      },
      onProgress: (double percent, TestResult data) {
        setState(() {
          _currentSpeed = data.transferRate;
          _speedData.add(data.transferRate);
        });
      },
      onError: (String errorMessage, String speedTestError) {
        print("Error: $errorMessage - $speedTestError");
        setState(() {
          _isTesting = false;
        });
      },
      onDefaultServerSelectionInProgress: () {
        print("Default server selection in progress");
      },
      onDefaultServerSelectionDone: (Client? client) {
        print("Default server selection done");
      },
      onDownloadComplete: (TestResult data) {
        setState(() {
          _isDownloadTest = false;
        });
        print("Download test complete");
      },
      onUploadComplete: (TestResult data) {
        print("Upload test complete");
      },
    );
  }

  String _formatSpeed(double speed) {
    if (speed < 1.0) {
      return "${(speed * 1000).toStringAsFixed(2)} kbps";
    } else {
      return "${speed.toStringAsFixed(2)} Mbps";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => check()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: _isTesting
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/speedchecklogo.png',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _formatSpeed(_currentSpeed).split(' ')[0],
                              style: TextStyle(
                                fontSize: 60,
                                color: Color(0xFF102C57),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _formatSpeed(_currentSpeed).split(' ')[1],
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF102C57),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          _isDownloadTest ? "Download speed" : "Upload speed",
                          style: TextStyle(
                             color: Color.fromARGB(255, 93, 105, 120),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "IP Address: $_ipAddress",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 93, 105, 120),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: CustomPaint(
                        painter: SpeedGraphPainter(_speedData),
                      ),
                    ),
                    SizedBox(height: 60)
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}

class SpeedGraphPainter extends CustomPainter {
  final List<double> speedData;

  SpeedGraphPainter(this.speedData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF102C57)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    if (speedData.isEmpty) return;

    double maxSpeed = speedData.reduce((a, b) => a > b ? a : b);
    double minSpeed = speedData.reduce((a, b) => a < b ? a : b);
    double range = maxSpeed - minSpeed;
    range = range == 0 ? 1 : range;

    final path = Path();
    for (int i = 0; i < speedData.length; i++) {
      double x = (i / (speedData.length - 1)) * size.width;
      double y =
          size.height - ((speedData[i] - minSpeed) / range) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SpeedTestResultScreen extends StatelessWidget {
  final double downloadSpeed;
  final double uploadSpeed;

  const SpeedTestResultScreen({
    Key? key,
    required this.downloadSpeed,
    required this.uploadSpeed,
  }) : super(key: key);

  String _formatSpeed(double speed) {
    if (speed < 1.0) {
      return "${(speed * 1000).toStringAsFixed(2)} kbps";
    } else {
      return "${speed.toStringAsFixed(2)} Mbps";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => check()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Speed Result',
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF102C57),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatSpeed(downloadSpeed).split(' ')[0],
                    style: TextStyle(
                      fontSize: 60,
                      color: Color(0xFF102C57),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatSpeed(downloadSpeed).split(' ')[1],
                    style: TextStyle(fontSize: 14, color: Color(0xFF102C57)),
                  ),
                ],
              ),
              Text('Download speed',
                  style: TextStyle(fontSize: 14,  color: Color.fromARGB(255, 93, 105, 120),
                            fontWeight: FontWeight.w600)),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatSpeed(uploadSpeed).split(' ')[0],
                    style: TextStyle(
                      fontSize: 60,
                      color: Color(0xFF102C57),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatSpeed(uploadSpeed).split(' ')[1],
                    style: TextStyle(fontSize: 14, color: Color(0xFF102C57)),
                  ),
                ],
              ),
              Text('Upload speed',
                  style: TextStyle(fontSize: 14,  color: Color.fromARGB(255, 93, 105, 120),
                            fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 40,
                            ),
              Image.asset(
                'assets/images/SResult.png',
                width: MediaQuery.of(context).size.width*0.6,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => check()),
                    );
                  },
                  child: Text(
                    "Check Speed Again",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF102C57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
