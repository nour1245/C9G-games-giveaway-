import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games/cubit/cubit/giveaway_cubit.dart';
import 'package:free_games/cubit/cubit/giveaway_state.dart';
import 'package:free_games/modules/details_screen.dart';
import 'package:free_games/modules/platform_screen.dart';
import 'package:free_games/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GiveawayCubit()..getGiveaways(),
      child: BlocConsumer<GiveawayCubit, GiveawayStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: GiveawayCubit.get(context).allGiveaways.isNotEmpty,
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'C9G',
                  style: TextStyle(fontSize: 25),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: GiveawayCubit.get(context).allGiveaways.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            navigatTO(
                                context,
                                DetailsScreen(
                                    giveaway: GiveawayCubit.get(context)
                                        .allGiveaways[index]));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              elevation: 15,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl:
                                          '${GiveawayCubit.get(context).allGiveaways[index].thumbnail}'),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${GiveawayCubit.get(context).allGiveaways[index].title}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${GiveawayCubit.get(context).allGiveaways[index].worth}',
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        225, 255, 211, 0),
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ),
                                              // const SizedBox(
                                              //   width: 3,
                                              // ),
                                              Expanded(
                                                child: Text(
                                                  'End Date: ${GiveawayCubit.get(context).allGiveaways[index].endDate}',
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        225, 255, 211, 0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              //Drawer Start
              drawer: Drawer(
                child: Container(
                  color: const Color.fromARGB(255, 51, 51, 51),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Text(
                          'Platforms',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 211, 0)),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'PC',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'pc'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Steam',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'steam'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Epic Games Store',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context,
                              const PlatformScreen(
                                  Platform: 'epic-games-store'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Ubisoft',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'ubisoft'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'GOG',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'gog'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'itch.io',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'itchio'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'PS4',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'ps4'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'PS5',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'ps5'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Xbox One',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'xbox-one'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Xbox Series X/S',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'xbox-series-xs'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Nintendo Switch',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'switch'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Android',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'android'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'iOS',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'ios'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'VR',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context, const PlatformScreen(Platform: 'vr'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Battle.net',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'battlenet'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Origin',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'origin'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'DRM-free',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(
                              context,
                              const PlatformScreen(
                                  Platform: 'Platform:drm-free'));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Xbox 360',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          navigatTO(context,
                              const PlatformScreen(Platform: 'xbox-360'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
