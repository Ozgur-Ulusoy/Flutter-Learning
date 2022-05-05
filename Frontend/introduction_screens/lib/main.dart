import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screens/Introduction%20Screens/introduction_screen1.dart';
import 'package:introduction_screens/Introduction%20Screens/introduction_screen2.dart';
import 'package:introduction_screens/Introduction%20Screens/introduction_screen3.dart';
import 'package:introduction_screens/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final PageController _pageController =
      PageController(); //* en aşağıdaki indikatörü yönetmesi için -sayfa geçişlerini-
  bool sonsayfami =
      false; //* son sayfa mı değil mi onu öğrenmek için yaptığım değişken
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              //* her sayfa indexi değiştiğinde çalışır
              setState(() {
                sonsayfami = (index ==
                    2); //? her sayfa değiştiğinde index 2 mi diye ( sonsayfa mı ) bakar, sonsayfaysa (2'yse) değişken true olur
              });
            },
            children: const [
              //* sayfalar
              IntroPage1(),
              IntroPage2(),
              IntroPage3()
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: const Alignment(0, 0.9),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(
                          const GidilecekSayfa()); //? basıldığında bütün aşamaları kapatıp direkt sayfaya gider
                    },
                    child: const Text(
                      "Aşamaları Atla",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, 0.9),
                  child: SmoothPageIndicator(
                      controller:
                          _pageController, //* başta belirttiğimiz kontrollerımız
                      count: 3 //* 3 sayfa olacak
                      ),
                ),
                //? index son sayfadaysa sonraki sayfa yazısı ve fonksiyonu değişir - tamamla/gidilecek sayfaya git - olur
                sonsayfami == false
                    ? Container(
                        alignment: const Alignment(0, 0.9),
                        child: GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                //? sonraki sayfaya gider - animasyonlu bir şekilde -
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            "Sonraki Aşama",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      )
                    : Container(
                        alignment: const Alignment(0, 0.9),
                        child: GestureDetector(
                          onTap: () {
                            Get.offAll(
                                const GidilecekSayfa()); //? son sayfaya geldiğinde gidilecek sayfaya atar - herşeyi kapatıp -
                          },
                          child: const Text(
                            "Tamamla",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
