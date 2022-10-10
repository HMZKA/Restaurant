import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/cubit&states/blocobserver.dart';
import 'package:flutter_restaurant/service/dio.dart';
import 'package:flutter_restaurant/widgets&screens/itemsscreen.dart';
import 'package:flutter_restaurant/widgets&screens/mainscreen.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
