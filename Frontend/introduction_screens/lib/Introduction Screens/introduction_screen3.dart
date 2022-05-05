import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: Colors.green,
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
                    "Para Kazan !",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                child: Lottie.network(
                  "https://assets7.lottiefiles.com/private_files/lf30_f0fhps6k.json",
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
