import 'package:flutter/material.dart';
import 'package:LoyalePets/Models/Catalog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:LoyalePets/Widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEADE),
      body: SafeArea(
        child: Column(
          children: [
            // Hero Image with Rounded Corners & Margins
            Hero(
              tag: Key(catalog.id.toString()),
              child: Container(
                margin: const EdgeInsets.all(16), // Adding margin around the image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(2, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: catalog.image,
                    width: context.screenWidth - 32, // Adjusting width to fit margins
                    height: context.percentHeight * 35, // Covering 35% of screen height
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
            ),

            // Product Details Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    catalog.name.text.xl4.bold.color(const Color(0xFF47456D)).make(),

                    const SizedBox(height: 10),

                    // Subtitle (More detailed description)
                    getSubtitle(catalog.name)
                        .text
                        .color(Colors.black54)
                        .lg
                        .make(),

                    const Spacer(),

                    // Price & Buy Button Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "\$${catalog.price}"
                            .text
                            .bold
                            .xl3
                            .color(const Color(0xFF47456D))
                            .make(),
                        AddToCart(catalog: catalog).wh(120, 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to return a detailed subtitle based on the product name
  String getSubtitle(String productName) {
    switch (productName) {
      case "Golden Retriever":
        return "A friendly and intelligent breed, perfect for families. "
            "Highly trainable, loves outdoor activities, and bonds deeply with owners.";
      case "Labrador Retriever":
        return "Known for their loyalty and gentle nature. "
            "Excellent companions, playful, and great with kids.";
      case "German Shepherd":
        return "A smart and courageous working dog. "
            "Highly protective, often serving in police and rescue teams.";
      case "Bulldog":
        return "Despite their tough look, Bulldogs are affectionate. "
            "They adapt well to apartments and are great companions.";
      case "Poodle":
        return "A highly intelligent breed with a hypoallergenic coat. "
            "Easy to train, playful, and affectionate.";
      case "Persian Cat":
        return "Quiet, gentle, and loves a relaxed home. "
            "Has luxurious long fur and enjoys being pampered.";
      case "Maine Coon":
        return "Large and affectionate with a thick coat. "
            "They are playful, intelligent, and great with families.";
      case "Siamese Cat":
        return "A social and vocal breed with striking blue eyes. "
            "Loves human interaction and attention.";
      case "Bengal Cat":
        return "Energetic, playful, and loves climbing. "
            "Their coat resembles a leopard, making them unique.";
      case "Holland Lop Rabbit":
        return "Adorable floppy ears and a friendly nature. "
            "Small-sized, easy to handle, and great for homes.";
      case "Netherland Dwarf Rabbit":
        return "A tiny and energetic breed. "
            "Loves to play and requires gentle handling.";
      case "Mini Rex Rabbit":
        return "Soft velvety fur and a calm nature. "
            "Loves being petted and is easy to care for.";
      case "Midas Cichlid":
        return "A bright-colored fish from Central America. "
            "Best suited for experienced fish keepers.";
      case "Goldfish":
        return "Perfect for beginners, hardy, and easy to care for. "
            "Comes in various colors and thrives in tanks or ponds.";
      case "Guppy":
        return "A colorful and peaceful freshwater fish. "
            "Ideal for community aquariums.";
      case "Angelfish":
        return "Elegant and graceful, a great centerpiece fish. "
            "Thrives in warm and clean water.";
      case "Parrot":
        return "Intelligent, talkative, and forms deep bonds. "
            "Can mimic human speech and loves interaction.";
      case "Canary":
        return "A small bird known for its cheerful songs. "
            "Easy to care for and brightens any home.";
      case "Budgerigar":
        return "Playful, friendly, and loves human interaction. "
            "Easy to train and enjoys toys.";
      case "Cockatiel":
        return "A loving and affectionate companion. "
            "Known for whistling and enjoys learning tunes.";
      default:
        return "A wonderful pet with unique traits. "
            "Brings joy and companionship to any home.";
    }
  }
}