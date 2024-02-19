import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Controllers/database_controller.dart';
import 'package:test/Views/widgets/fav_circular_button_widget.dart';
import 'package:test/model/product_model.dart';
import 'package:test/utils/app_router.dart';

class ListViewHomeItem extends StatelessWidget {
  const ListViewHomeItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(AppRouter.productPage, arguments: {
          'product': productModel,
          'database': Provider.of<DataBase>(context, listen: false)
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    productModel.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 50,
                      height: 25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "${productModel.discount}%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              productModel.category,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 6.0),
            Text(
              productModel.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 6.0),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${productModel.price}\$",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  TextSpan(
                    text:
                        " ${(productModel.price) - (productModel.discount! / 100) * (productModel.price)}\$",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.red,
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
