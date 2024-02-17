import 'package:flutter/material.dart';
import 'package:test/Views/widgets/home_listview_item.dart';
import 'package:test/model/product_model.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key, required this.productsStream});
  final Stream<List<ProductModel>> productsStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
        stream: productsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print('stream connected');
            final products = snapshot.data;
            if (products == null || products.isEmpty) {
              return const Center(
                child: Text("No Products available"),
              );
            } else {
              return Container(
                  margin: const EdgeInsets.only(left: 22),
                  height: 300,
                  child: ListView.builder(
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ListViewHomeItem(productModel: products[index]);
                      }));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
