import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games/cubit/cubit/giveaway_cubit.dart';
import 'package:free_games/cubit/cubit/giveaway_state.dart';

import '../shared/components/components.dart';
import 'details_screen.dart';

class PlatformScreen extends StatelessWidget {
  final String Platform;

  const PlatformScreen({super.key, required this.Platform});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GiveawayCubit()..getGiveawayByPlatform(Platform),
      child: BlocConsumer<GiveawayCubit, GiveawayStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is PlatformGiveawaysSuccess,
            fallback: (context) => state is PlatformGiveawaysError
                ? Scaffold(
                    appBar: AppBar(
                      title: Text(
                        Platform,
                        style: const TextStyle(fontSize: 25),
                      ),
                      centerTitle: true,
                    ),
                    body: const Center(
                      child: Text(
                        'There is No Free Games For This Platform for now !',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(
                  Platform,
                  style: const TextStyle(fontSize: 25),
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
                      itemCount:
                          GiveawayCubit.get(context).platformGiveaways.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            navigatTO(
                                context,
                                DetailsScreen(
                                    giveaway: GiveawayCubit.get(context)
                                        .platformGiveaways[index]));
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
                                          '${GiveawayCubit.get(context).platformGiveaways[index].thumbnail}'),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${GiveawayCubit.get(context).platformGiveaways[index].title}',
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
                                                  '${GiveawayCubit.get(context).platformGiveaways[index].worth}',
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
                                                  'End Date: ${GiveawayCubit.get(context).platformGiveaways[index].endDate}',
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
            ),
          );
        },
      ),
    );
  }
}
