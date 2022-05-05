import 'package:flutter/material.dart';
import 'package:passbase_flutter/passbase_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! dashboardda kullanıcıya ait bütün datalar gözüküyor - konum - video - döküman - giriş yapma saati vb.
    PassbaseSDK.initialize(
        publishableApiKey:
            ""); //! passbasede olan kod bu - sayfadan al - publishableApiKey
    PassbaseSDK.prefillUserEmail = ""; // optional //! kullanıcının emaili
    PassbaseSDK.prefillCountry =
        "tr"; //! başlangıç ülkesi - döküman için default ülke değeri bu oluyor
    // PassbaseSDK.metaData = //! metaData
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: PassbaseButton(
                //! passbasenin kendi butonu
                onFinish: (identityAccessKey) {
                  //* do stuff in case of success
                  print(identityAccessKey);
                },
                onError: (errorCode) {
                  //* do stuff in case of cancel
                  print(errorCode);
                },
                onStart: () {
                  //* do stuff in case of start
                  print("start");
                },
                width: 300,
                height: 60,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text("Giriş Yap"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
