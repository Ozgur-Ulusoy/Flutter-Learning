import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth/screens/homepage.dart';
import 'package:phone_auth/screens/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //! Firebase başlangıcı
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: InitializerWidget(),
    );
  }
}

//!
//* FIREABASE YI UYGULAMAYA KUR
//! Firebase için SHA1 ve SHA256 kodunu alma
//* android studiodan projeyi aç terminale cd android yaz sonra da cd gradlew signinReport yaz
//? https://instructivetech.com/how-to-get-sha1-key-in-flutter-for-firebase-sha-1-or-sha-256-flutter/

//!
//* KURDUKTAN SONRA FIREBASE  => AUTHENTICATION DAN PHONE U AÇ
//* SHA-256 YI DA PROJE AYARLARINDAN FINGERPRINT OLARAK EKLE

//! kullanıcı zaten giriş yapmışmı diye bakar yapmışşa homepageye yapmamıssa login pageye atar
class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;
  User? _user;

  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _auth?.currentUser != null ? _user = _auth?.currentUser : _user = null;
    print(_auth);
    print(_user);
    isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? const LoginPage()
            : const HomePage();
  }
}
