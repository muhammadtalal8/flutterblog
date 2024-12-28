
import 'package:flutter/material.dart';
import 'package:flutter_blog/core/theme/app_pallete.dart';
import 'package:flutter_blog/pages/Signup_pages.dart';
import 'package:flutter_blog/widgets/auth_field.dart';
import 'package:flutter_blog/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 10),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 15),
              const AuthGradientButton(
                buttonText: 'Sign In',
              ),
              const SizedBox(height: 159),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, SignUpPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                        text: "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppPallete.gradient2,
                                fontWeight: FontWeight.bold),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
