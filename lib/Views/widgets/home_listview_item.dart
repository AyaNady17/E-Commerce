import 'package:flutter/material.dart';
import 'package:test/utils/app_assets.dart';

class ListViewHomeItem extends StatelessWidget {
  const ListViewHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
                  AppAssets.tempProductAsset1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          '-20%',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Casual',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 6.0),
          Text(
            'Cotton Pullover',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 6.0),
          Text(
            '20\$',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
