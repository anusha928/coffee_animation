import 'package:coffee_animation/constansts.dart';
import 'package:coffee_animation/main.dart';
import 'package:coffee_animation/screens/splash/ui/widget/splash_bottom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _coffeecontroller;
  bool copanimated = false;
  bool animatecafetext = false;

  @override
  void initState() {
    super.initState();
    _coffeecontroller = AnimationController(vsync: this);
    _coffeecontroller.addListener(() {
      if (_coffeecontroller.value > 0.7) {
        _coffeecontroller.stop();
        copanimated = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 500));
        animatecafetext = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    print("screenHeight: $screenheight");
    return Scaffold(
      backgroundColor: cafeBrown,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: copanimated ? screenheight / 1.8 : screenheight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(copanimated?40:0), color: Colors.white),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !copanimated,
                    child: Lottie.asset("assets/coffeesplash.json",
                        controller: _coffeecontroller, onLoaded: (composition) {
             
                      _coffeecontroller
                        ..duration = composition.duration
                        ..forward();
                    }),
                  ),
                  Visibility(
                    visible: copanimated,
                    child: Image.asset("assets/coffee1.jpg",
                    height: 200,
                    width: 200,)),
                  AnimatedOpacity(
                    opacity: animatecafetext ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      "C A F E",
                      style: TextStyle(
                        color: cafeBrown,
                        fontSize: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(visible: copanimated, child: const SplashBottom())
        ],
      ),
    );
  }
}
