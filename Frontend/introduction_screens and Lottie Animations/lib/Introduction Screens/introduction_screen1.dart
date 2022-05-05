import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: Colors.blue,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: const Text(
                    "BAGAJAPP'e Hoşgeldin !",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                child: Lottie.network(
                  //* animasyon
                  "https://assets10.lottiefiles.com/packages/lf20_M9p23l.json",
                  // width: Get.width * 0.8,
                  // height: Get.height * 0.8,
                  // fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
