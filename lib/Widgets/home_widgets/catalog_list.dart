import 'package:flutter/material.dart';
import 'package:LoyalePets/Models/Catalog.dart';
import 'package:LoyalePets/Screens/home_detail.dart';
import 'package:LoyalePets/Widgets/home_widgets/catalog_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetail(catalog: catalog),
                      ),
                    );
                  },
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetail(catalog: catalog),
                      ),
                    );
                  },
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}
