import 'package:flutter/material.dart';
import 'package:LoyalePets/Login_Signup/login.dart';
import 'package:LoyalePets/Services/authentication.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "LoyalePets 🐾"
                  .text
                  .xl4
                  .bold
                  .color(const Color(0xFF47456D)) // Header Color
                  .make(),
              "Trending products".text.color(Colors.black87).lg.make(),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.logout_outlined, color: Colors.black),
          onPressed: () async {
            await AuthServices().signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ],
    ).p16();
  }
}