import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/Views/widgets/main_button.dart';
import 'package:test/model/add_to_cart_model.dart';
import 'package:test/utils/app_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              _buildAppBar(),
              _buildPageTitle(context),
              const SizedBox(
                height: 10,
              ),
              CartListView(),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              MainButton(
                title: 'CheckOut',
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRouter.checkoutPage);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}

//TODO: enhance total amount section
// class TotalAmount extends StatefulWidget {
//   const TotalAmount({super.key});

//   @override
//   State<TotalAmount> createState() => _TotalAmountState();
// }

// class _TotalAmountState extends State<TotalAmount> {
//   int total = 0;
//   @override
//   void didChangeDependencies() async {
//     final myProducts =
//         await Provider.of<DataBase>(context).myProductsCart().first;
//     setState(() {
//       myProducts.forEach((element) {
//         total += (element.price) * (element.quantity);
//       });
//     });
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           "Total Amount:",
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         const Spacer(),
//         Text(
//           "${total}\$",
//           style: Theme.of(context).textTheme.titleMedium,
//         )
//       ],
//     );
//   }
// }

class CartListView extends StatefulWidget {
  CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  int total = 0;

  @override
  void didChangeDependencies() async {
    final myProducts =
        await Provider.of<DataBase>(context).myProductsCart().first;
    setState(() {
      myProducts.forEach((element) {
        total += (element.price) * (element.quantity);
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<DataBase>().myProductsCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print('cart stream connected');
            final cartItems = snapshot.data;
            if (cartItems == null || cartItems.isEmpty) {
              return const Center(
                child: Text("No Products available"),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, Index) {
                          Provider.of<DataBase>(context).updateCartTotalAmount(
                              cartItems[Index].price *
                                  cartItems[Index].quantity);
                          return CartListViewItem(
                            addToCartModel: cartItems[Index],
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Amount:",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      Text(
                        "470\$",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

Widget _buildPageTitle(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "My Cart",
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 33),
      )
    ],
  );
}

Widget _buildAppBar() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Icon(
        Icons.search,
        size: 30,
      )
    ],
  );
}

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.addToCartModel});
  final AddToCartModel addToCartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            addToCartModel.imageUrl,
            fit: BoxFit.cover,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  addToCartModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Color:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      addToCartModel.color,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Size:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      addToCartModel.size,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4.8, horizontal: 5),
                      width: 37,
                      decoration: const BoxDecoration(
                        color: Color(0xf9f9f9f9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          iconSize: 23,
                          style: const ButtonStyle(),
                          color: Colors.black54,
                          onPressed: () {
                            context.read<DataBase>().updateCartItemQuantity(
                                addToCartModel.id, addToCartModel.quantity++);
                          },
                          icon: const Icon(Icons.add)),
                    ),
                    Text(
                      "${addToCartModel.quantity}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      width: 37,
                      decoration: const BoxDecoration(
                        color: Color(0xf9f9f9f9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          iconSize: 23,
                          style: const ButtonStyle(),
                          color: Colors.black54,
                          onPressed: () {
                            context.read<DataBase>().updateCartItemQuantity(
                                addToCartModel.id, addToCartModel.quantity--);
                          },
                          icon: const Icon(Icons.remove)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, top: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    context.read<DataBase>().deleteCartItem(addToCartModel.id);
                  },
                  child: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "${addToCartModel.price * addToCartModel.quantity}\$",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
