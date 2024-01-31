import 'package:flutter/material.dart';
import 'package:test/Views/widgets/home_listview_item.dart';
import 'package:test/model/product_model.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 22),
        height: 300,
        child: ListView.builder(
            itemCount: dummyProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListViewHomeItem(productModel: dummyProducts[index]);
            }));
  }
}
