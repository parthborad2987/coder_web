import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'webviewscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {

 late final AnimationController _controller = AnimationController(
      vsync: this,
    duration:  const Duration(seconds: 2),
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut);

  @override
  void initState() {
   whereToGo();
   super.initState();
  }

 void whereToGo() async {
   Timer(const Duration(seconds: 7),() {
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WebviewScreen()),(route) => false);
   });
 }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
   var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(92, 91, 119, 10),
                  Color.fromRGBO(239, 130, 130, 1),
                  Color.fromRGBO(84, 89, 118, 10)
                ]),
          ),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                  turns: _animation,
              child: Image.asset('assets/icon.png',scale: 3,),),

              const SizedBox(height: 20,),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ), child: AnimatedTextKit(totalRepeatCount: 25,
                animatedTexts: [
                  ColorizeAnimatedText('Coder Web', colors: [const Color.fromRGBO(92, 91, 119, 10),Colors.blue,Colors.yellow,Colors.red], textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 45)),
                  ColorizeAnimatedText('Coder Web', colors: [Colors.purple,Colors.blue,Colors.yellow,Colors.red], textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),
                ],
               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
