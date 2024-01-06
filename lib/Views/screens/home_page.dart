import 'package:flutter/material.dart';
import 'package:test/Views/widgets/home_photo_cover.dart';
import 'package:test/Views/widgets/listview_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeCoverPhoto(),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildHeaderOfList(
                  context,
                  title: 'Sale',
                  description: 'Super Summer Sale!!',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListViewHome(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildHeaderOfList(
                  context,
                  title: 'New',
                  description: 'You\'ve never seen it before !!',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListViewHome(),
        ],
      ),
    );
  }
}

/// TODO: Temp code till refactor to a separate class with a separate context
Widget _buildHeaderOfList(
  BuildContext context, {
  required String title,
  VoidCallback? onTap,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      Text(
        description,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.grey,
            ),
      ),
    ],
  );
}
