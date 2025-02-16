import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LoyalePets/Core/store.dart';
import 'package:LoyalePets/Models/Catalog.dart';
import 'package:LoyalePets/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/home_widgets/catalog_header.dart';
import '../Widgets/home_widgets/catalog_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading time
    final catalogJson = await rootBundle
        .loadString("assets/files/catalog.json"); // Load the JSON data
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>(
            (item) => Item.fromMap(item)) // Parse the items from JSON to object
        .toList();
    setState(() {}); // Update UI after data is loaded
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Color(0xFFEDEADE),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Navigating to Cart Screen");
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: const Color(0xFF47456D),
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty) // Check if data has been loaded
                Expanded(
                    child: CatalogList()
                        .py16()
                        .expand()) // Display the list if data is available
              else
                const Center(
                  child: CircularProgressIndicator(), // Show loading spinner
                ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}