import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/Views/widgets/fav_circular_button_widget.dart';
import 'package:test/Views/widgets/main_button.dart';
import 'package:test/model/add_to_cart_model.dart';
import 'package:test/model/product_model.dart';
import 'package:test/utils/constants.dart';

//!TODO:needs refactor
class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(
      {super.key, required this.productModel, required this.dataBase});
  final ProductModel productModel;
  final DataBase dataBase;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedColor;

  String? selectedSize;

  //TODo: handel null size& color exception
  void _addToCart(DataBase dataBase) {
    try {
      AddToCartModel addToCartModel = AddToCartModel(
          id: documentIdFromLocalData(),
          productId: widget.productModel.id,
          title: widget.productModel.title,
          price: widget.productModel.price,
          imageUrl: widget.productModel.imageUrl,
          color: selectedColor!,
          size: selectedSize!,
          quantity: 1);
      dataBase.addToCart(addToCartModel);
      Fluttertoast.showToast(
          msg: "Product Added to Cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              productTitle: widget.productModel.title,
            ),
            ProductImage(
              ImageURL: widget.productModel.imageUrl,
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
                        hint: "Sizes   ",
                        onChanged: (String? newSize) {
                          setState(() {
                            selectedSize = newSize!;
                          });
                        },
                        selectedValue: selectedSize,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      //!Fix : selected value not appear in drop down menu
                      MenuOptions(
                        selectedValue: selectedColor,
                        items: const ['Black', 'White', 'Red'],
                        hint: "Colors  ",
                        onChanged: (newColor) {
                          setState(() {
                            selectedColor = newColor!;
                          });
                        },
                      ),
                    ],
                  ),
                  FavCircularButton()
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ProductDetails(productModel: widget.productModel),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MainButton(
                title: 'Add To Cart',
                onTap: () {
                  _addToCart(widget.dataBase);
                },
              ),
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

class MenuOptions extends StatelessWidget {
  MenuOptions({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.selectedValue,
  });
  final List<String> items;
  final String? selectedValue;
  final String hint;
  void Function(String?)? onChanged;
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
        hint: Text(hint),
        value: selectedValue,
        onChanged: onChanged,
        items: items
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
