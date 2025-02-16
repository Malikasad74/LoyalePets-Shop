import 'package:flutter/material.dart';
import 'package:LoyalePets/Login_Signup/Widget/button.dart';
import 'package:LoyalePets/Login_Signup/Widget/snackbar.dart';
import 'package:LoyalePets/Login_Signup/Widget/textfield.dart';
import 'package:LoyalePets/Login_Signup/sign_up.dart';
import 'package:LoyalePets/Screens/home_screen.dart';
import 'package:LoyalePets/Services/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                child: Image.asset("assets/images/login.png"),
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 20),
              MyButton(
                onTap: loginUser,
                text: "Login",
              ),
              SizedBox(height: height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}