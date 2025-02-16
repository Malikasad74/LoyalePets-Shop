import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:LoyalePets/Core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/Catalog.dart';
import '../../Models/cart.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const StadiumBorder(),
      ),
      child: isInCart ? Icon(Icons.done,color: Colors.white,) :
          Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,),
    );
  }
}