import 'package:bookly/core/constants/image_assets.dart';
import 'package:bookly/features/home/presentation/widgets/FeaturedBookWidgets/featured_book_list_view_bloc_builder.dart';
import 'package:bookly/features/home/presentation/widgets/NewestBookWidgets/newest_book_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0xff404066),
          pinned: true,
          title: Image.asset(
            Assets.logo,
            width: 100,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // GoRouter.of(context).push(AppRouter.KSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FeaturedBookListViewBlocBuilder(),
                SizedBox(height: 10),
                Text(
                  'Newest Books',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                NewestBookBlocBuilder()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
