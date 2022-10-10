import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/constants.dart';
import 'package:flutter_restaurant/cubit&states/cubit.dart';
import 'package:flutter_restaurant/cubit&states/states.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..framePostCallBack(context)
        ..getHome()
        ..getCategories(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit().get(context);
            return SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: cubit.currentIndex == 0 ? true : false,
                appBar: AppBar(
                  backgroundColor:
                      cubit.currentIndex == 0 ? Colors.black38 : Colors.black,
                  title: Text(
                    '${screenTitle[cubit.currentIndex]}',
                    style: TextStyle(
                      fontFamily: 'Satisfy',
                      color: Colors.amber,
                      fontSize: 30,
                    ),
                  ),
                  centerTitle: true,
                ),
                bottomNavigationBar: CurvedNavigationBar(
                  color: Colors.black,
                  buttonBackgroundColor: Colors.black,
                  backgroundColor: HexColor('#fab43e'),
                  index: cubit.currentIndex,
                  onTap: (value) {
                    cubit.changeIndex(value);
                  },
                  items: [
                    Icon(
                      CupertinoIcons.home,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.restaurant_menu,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.restaurant_rounded,
                      color: Colors.white,
                    )
                  ],
                  height: 70,
                ),
                body: cubit.screens[cubit.currentIndex],
              ),
            );
          }),
    );
  }
}
