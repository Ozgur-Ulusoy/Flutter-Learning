import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(const MyApp());
  //! Emailjs
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            sendEmail(
                //! daha çok özellik elenebilir
                email: "", //! Gönderilecek email'in adresi
                subject: "", //! email başlığı
                message: ""); //! email içeriği
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text("Email Gönder"),
            ),
          ),
        ),
      ),
    );
  }
}

Future sendEmail(
    {required String email,
    required String subject,
    required String message}) async {
  const serviceId = ""; //! emailjs deki service id si
  const templateId = ""; //! kullandığımız templatenin id si
  const userId = ""; //! public-keyimiz
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: json.encode(
      {
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          //! template de kullandığımız parametriler
          "user_email": email,
          "user_subject": subject,
          "user_message": message,
        }
      },
    ),
  );
  print(response.body); //! sonucu yazdırdık - OK diyorsa emaili göndermiştir -
}
