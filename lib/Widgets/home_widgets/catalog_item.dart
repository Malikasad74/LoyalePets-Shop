import 'package:flutter/material.dart';
import 'package:LoyalePets/Widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/Catalog.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFCFBF4), // List Card Color
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(Colors.black).bold.make(),
                catalog.desc.text.color(Colors.black87).sm.make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .bold
                        .color(const Color(0xFF47456D)) // Price Color
                        .xl
                        .make(),
                    AddToCart(catalog:catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ).p(context.isMobile ? 0 : 16),
          )
        ],
      ),
    );
  }
}