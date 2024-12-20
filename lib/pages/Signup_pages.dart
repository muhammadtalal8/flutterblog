import 'package:flutter/material.dart';
import 'package:flutter_blog/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          AuthField(hintText: "Email")


        ],
      ),
    );
  }
}
