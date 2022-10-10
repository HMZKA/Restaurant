import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/constants.dart';
import 'package:flutter_restaurant/cubit&states/states.dart';
import 'package:flutter_restaurant/models/categoriesmodel.dart';
import 'package:flutter_restaurant/models/homemodel.dart';
import 'package:flutter_restaurant/service/dio.dart';
import 'package:flutter_restaurant/widgets&screens/homescreen.dart';
import 'package:flutter_restaurant/widgets&screens/menuscreen.dart';
import 'package:flutter_restaurant/widgets&screens/reservationscreen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  AppCubit get(context) => BlocProvider.of(context);

  List screens = [HomeScreen(), MenuScreen(), ReserveScreen()];

  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeIndexState());
  }

  framePostCallBack(context) =>
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        loadData(context);
      });
  Future loadData(context) async {
    emit(AppLoadingDataState());
    Future.wait(images.map((e) => cacheImage(context, e)).toList());
    Future.wait(topOrder.map((e) => cacheImage(context, e)).toList());
    emit(AppLoadingDataSucceedState());
  }

  Future cacheImage(context, urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage), context);

  viewMenu() {
    currentIndex = 1;
    emit(AppShowMenuScreenState());
  }

  HomeModel? homeModel;
  getHome() {
    emit(AppLoadingHomeModelState());
    DioHelper.getData('/home').then((value) {
      print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      emit(AppGetHomeModelState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorHomeModelState());
    });
  }

  CategoriesModel? categoriesModel;
  getCategories() {
    emit(AppLoadingCategoriesModelState());
    DioHelper.getData('/categories').then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel?.categories);
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCategoriesModelState());
    });
  }

  bookTable({
    required String name,
    required int phone,
    required String email,
    required int chairs,
    required String date,
    required String firstHour,
    required String lastHour,
  }) {
    emit(AppLoadingTableState());
    DioHelper.postData('/book', data: {
      'name': name,
      'phone': phone,
      'email': email,
      'person_count': chairs,
      'date': date,
      'first_hour': firstHour,
      'last_hour': lastHour
    }).then((value) {
      print(value.data);
      emit(AppBookTableState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorTableState());
    });
  }
}
