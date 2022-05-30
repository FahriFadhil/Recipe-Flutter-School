import 'package:flutter/material.dart';
import 'package:submission/screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Recipe App",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black87,
              fontSize: 48,
            ),
          ),
          const Text(
            "Made By Flutter",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}