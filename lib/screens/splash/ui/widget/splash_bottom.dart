import 'package:coffee_animation/constansts.dart';
import 'package:flutter/material.dart';

class SplashBottom extends StatelessWidget {
  const SplashBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Find The Best Coffee For You",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: screenheight / 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16),
              ),
              const SizedBox(
                height: screenheight / 20,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: screenheight / 15,
              ),
            ],
          ),
        ));
  }
}
