import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                  child: Text(
                'You Will recive an email to \n      reset the password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.done,
                controller: emailForController,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                    label: Text('Email',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {
                  restPassword(context);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Send Mail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> restPassword(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailForController.text.trim());

      final snackBar = SnackBar(
        content: Text('An Email is sent to this $emailForController.text'),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    }
  }
}

TextEditingController emailForController = TextEditingController();
