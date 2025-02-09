import 'package:bookly/features/home/presentation/widgets/custome_app_bar.dart';
import 'package:bookly/features/home/presentation/widgets/featured_book_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                CustomAppBar(),
                FeaturedBookListViewBlocBuilder(),
                Text(
                  'Newsed Books',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
