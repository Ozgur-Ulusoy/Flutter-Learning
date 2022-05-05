import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: Colors.pink,
        ),
        // ListView(
        //   children: [Lottie.network("")],
        // )

        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: const Text(
                    "Eşya Taşı !",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                child: Lottie.network(
                  "https://assets2.lottiefiles.com/packages/lf20_eop7ymay.json",
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
