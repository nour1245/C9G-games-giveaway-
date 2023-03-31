import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_games/shared/network/remote/diohelper.dart';
import '../../models/giveaways_model.dart';
import 'giveaway_state.dart';

class GiveawayCubit extends Cubit<GiveawayStates> {
  GiveawayCubit() : super(GiveawayInitial());
  static GiveawayCubit get(context) => BlocProvider.of(context);

  late List<Giveaways> model;
  List<Giveaways> allGiveaways = [];
  getGiveaways() async {
    emit(GiveawaysLoading());
    await DioHelper.getData(url: 'giveaways').then((value) {
      List<dynamic> data = value.data;
      model = List<Giveaways>.from(
          data.map((e) => Giveaways.fromJson(e as Map<String, dynamic>)));

      for (var element in model) {
        allGiveaways.add(element);
      }

      emit(GiveawaysSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GiveawaysError(error));
    });
  }

  late List<Giveaways> aModel;
  List<Giveaways> platformGiveaways = [];
  getGiveawayByPlatform(String platform) async {
    emit(PlatformGiveawaysLoading());
    await DioHelper.getData(url: 'giveaways', query: {'platform': platform})
        .then((value) {
      List<dynamic> data = value.data;
      aModel = List<Giveaways>.from(
          data.map((e) => Giveaways.fromJson(e as Map<String, dynamic>)));

      for (var element in aModel) {
        platformGiveaways.add(element);
      }
      emit(PlatformGiveawaysSuccess());
    }).catchError((error) {
      emit(PlatformGiveawaysError(error));
    });
  }
}
