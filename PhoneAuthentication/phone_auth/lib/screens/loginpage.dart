import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth/screens/homepage.dart';

enum MobileVertificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }
//! doğrulama adımları - telefon numarası - kod girme

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MobileVertificationState currentState =
      MobileVertificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController(); //! telefon-textfield
  final otpController = TextEditingController(); //! otp-textfield
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;
  bool showLoading = false; //! veri yüklenme kısımlarında yükleme ekranı gelir

  void SignInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final AuthCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (AuthCredential.user != null) {
        Get.to(const HomePage());
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldkey.currentState?.showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  getOtpFormWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: const InputDecoration(hintText: "OTP Kod"),
            controller: otpController,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId!,
                    smsCode: otpController.text);
            SignInWithPhoneAuthCredential(phoneAuthCredential);
          },
          color: Colors.blue,
          child: const Text("Doğrula"),
          textColor: Colors.green,
        )
      ],
    );
  }

  getMobileFormWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: const InputDecoration(hintText: "Telefon Numarası"),
            controller: phoneController,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });
            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text.trim(),
              verificationCompleted: (PhoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                  // Get.to(const HomePage());
                });
              },
              verificationFailed: (FirebaseAuthException) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldkey.currentState?.showSnackBar(
                  const SnackBar(
                    content: Text("HATA"),
                  ),
                );
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  print(resendingToken);
                  print(verificationId);
                  showLoading = false;
                  currentState = MobileVertificationState
                      .SHOW_OTP_FORM_STATE; //!form kısmına geçer
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          color: Colors.blue,
          child: const Text("Doğrula"),
          textColor: Colors.green,
        )
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey =
      GlobalKey(); //! böylece bu scaffold keyi kullanarak bu sayfayı istediğimiz yerden setstate yapabiliriz (?)

  @override
  Widget build(BuildContext context) {
    _auth.setLanguageCode("tr");
    return Scaffold(
      body: Container(
        child: showLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVertificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
      ),
    );
  }
}
