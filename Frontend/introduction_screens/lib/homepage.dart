import 'package:flutter/material.dart';

class GidilecekSayfa extends StatelessWidget {
  const GidilecekSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: const Center(
        child: Text(
          "Ana Sayfa",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }
}
