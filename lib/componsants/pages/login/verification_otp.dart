//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationOtp extends StatefulWidget {
  bool deja;
  String numero;
  String code;
  VerificationOtp(this.deja, this.numero, this.code);

  @override
  State<StatefulWidget> createState() {
    return _VerificationOtp();
  }
}

class _VerificationOtp extends State<VerificationOtp> {
  String load = "load";
  String codeV = "";
  sendOtp() async {
    //
    // FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: "+243815381693",
    //   timeout: const Duration(minutes: 2),
    //   verificationCompleted: (v) {
    //     print("auth: verificationCompleted: $v");
    //   },
    //   verificationFailed: (v) {
    //     load = "erreur";
    //     print("auth: verificationFailed: $v");
    //     Get.snackbar("Echec", "$v");
    //     //Get.to(Inscription());
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     load = "envoyer";
    //     print("auth: codeSent: $verificationId :--: $resendToken");
    //     codeV = verificationId;
    //   },
    //   codeAutoRetrievalTimeout: (c) {
    //     load = "erreur";
    //     print("auth: codeAutoRetrievalTimeout: $c");
    //   },
    // );
    //
  }

  //
  @override
  void initState() {
    //
    sendOtp();
    //
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: load == "load"
          ? const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : load == "erreur"
              ? const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(""),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 150,
                    child: AlertDialog(
                      title: Text("Tape votre code"),
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: Text(widget.code),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Text(widget.numero),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              child: OTPTextField(
                                length: 6,
                                width: Get.size.width / 1.5,
                                fieldWidth: 30,
                                style: TextStyle(fontSize: 17),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (co) async {
                                  print("code1 $co == $codeV");
                                  // FirebaseAuth auth = FirebaseAuth.instance;
                                  // var _credential =
                                  //     PhoneAuthProvider.credential(
                                  //         verificationId: codeV, smsCode: co);
                                  // auth
                                  //     .signInWithCredential(_credential)
                                  //     .then((result) {
                                  //   //
                                  //   if (widget.deja) {
                                  //     //Get.to(Inscription(number, code)); //
                                  //   } else {
                                  //     //Get.to(MdpOublie(number)); //
                                  //   }
                                  //   //
                                  // }).catchError((e) {
                                  //   print("auth: $e");
                                  //   Get.snackbar("Erreur", "Code non valide!");
                                  //   print(e);
                                  // });
                                },
                                onChanged: (pin) {
                                  String c = pin;
                                  print("code2 $c");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
