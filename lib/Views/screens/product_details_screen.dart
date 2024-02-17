import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test/Views/widgets/fav_circular_button_widget.dart';
import 'package:test/Views/widgets/main_button.dart';
import 'package:test/model/product_model.dart';

//!TODO:needs refactor
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              productTitle: productModel.title,
            ),
            ProductImage(
              ImageURL: productModel.imageUrl,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MenuOptions(
                        items: const ['S', 'M', 'L', 'XL', 'XXL'],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MenuOptions(
                        items: const ['S', 'M', 'L', 'XL', 'XXL'],
                      ),
                    ],
                  ),
                  FavCircularButton()
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ProductDetails(productModel: productModel),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MainButton(title: 'Add To Cart'),
            )
          ],
        ),
      )),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.brandName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                productModel.category,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black45, fontWeight: FontWeight.w400),
              ),
              const Text(
                  "cotton shirt in neutral colors with all sizes \n and good price best selling item mmm "),
            ],
          ),
          const Spacer(),
          Text("${productModel.price}\$",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ))
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.ImageURL});
  final String ImageURL;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.48,
      child: Image.network(
        ImageURL,
        fit: BoxFit.fill,
      ),
    );
  }
}

class MenuOptions extends StatefulWidget {
  MenuOptions({
    super.key,
    required this.items,
  });
  final List<String> items;
  String? selectedValue;
  @override
  State<MenuOptions> createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),

      // dropdown below..
      child: DropdownButton<String>(
        hint: Text(
          "Size     ",
        ),
        value: widget.selectedValue,
        onChanged: (newValue) {
          setState(() {
            widget.selectedValue = newValue!;
          });
        },
        items: widget.items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        iconSize: 35,
        underline: const SizedBox(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.productTitle});
  final String productTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          )),
      title: Text(
        productTitle,
        maxLines: 1,
      ),
      trailing: const Icon(Icons.share),
      titleAlignment: ListTileTitleAlignment.center,
      //horizontalTitleGap: 85,
      titleTextStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 19),
    );
  }
}
