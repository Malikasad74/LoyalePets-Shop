import 'package:flutter/material.dart';
import 'package:LoyalePets/Login_Signup/Widget/button.dart';
import 'package:LoyalePets/Login_Signup/Widget/snackbar.dart';
import 'package:LoyalePets/Login_Signup/Widget/textfield.dart';
import 'package:LoyalePets/Screens/home_screen.dart';
import 'package:LoyalePets/Services/authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthServices().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showSnackBar(context, res);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.8,
                child: Image.asset("assets/images/signup.png"),
              ),
              TextfieldInpute(
                textEditingController: nameController,
                hintText: "Enter your name",
                icon: Icons.person,
              ),
              TextfieldInpute(
                textEditingController: emailController,
                hintText: "Enter your email",
                icon: Icons.email,
                inputType: InputType.email,
              ),
              TextfieldInpute(
                textEditingController: passwordController,
                hintText: "Enter your password",
                isPass: true,
                icon: Icons.lock,
                inputType: InputType.password,
              ),
              MyButton(
                onTap: signUpUser,
                text: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}