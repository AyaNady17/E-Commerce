import 'package:flutter/material.dart';
import 'package:test/Views/widgets/checkout/payment_component.dart';
import 'package:test/Views/widgets/checkout/shipping_address_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Checkout",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleWidget("Shipping Address", context),
                SizedBox(
                  height: 8,
                ),
                ShippingAddressCard(),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitleWidget("payment", context),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Change',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.redAccent,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                PaymentComponent(),
                const SizedBox(height: 24.0),
                _buildTitleWidget("Delivery Method", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTitleWidget(String title, BuildContext context) {
  return Text(
    title,
    style: Theme.of(context).textTheme.headlineMedium,
  );
}
