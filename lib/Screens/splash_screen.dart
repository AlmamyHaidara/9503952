import 'package:depence_manager/Screens/depance_Screen.dart';
import 'package:depence_manager/Screens/home_screen.dart';
import 'package:depence_manager/Screens/login_screen.dart';
import 'package:depence_manager/utils/share_preferences.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    load();
  }

  load() async {
    var isConnected = await SharedPreferenceService.getValue("token");
    Future.delayed(Duration(seconds: 4), () {
      if (isConnected == "") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DepanceScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,

                strokeWidth: 4.0,
                // pathBackgroundColor:
                //     showPathBackground ? Colors.black45 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
