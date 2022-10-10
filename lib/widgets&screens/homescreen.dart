import 'dart:math';

import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_restaurant/constants.dart';
import 'package:flutter_restaurant/cubit&states/cubit.dart';
import 'package:flutter_restaurant/cubit&states/states.dart';
import 'package:flutter_restaurant/service/dio.dart';
import 'package:lottie/lottie.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2500),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.75, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        int index = Random().nextInt(images.length - 1);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: images.map((element) {
                    return Image(
                      image: CachedNetworkImageProvider(element),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress != null
                              ? LottieBuilder.asset('assets/images/load.json')
                              : child,
                      width: double.infinity,
                    );
                  }).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      initialPage: index,
                      autoPlayAnimationDuration: Duration(seconds: 1))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.viewMenu();
                        },
                        child: Text(
                          'view all',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: AnimatedList(
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                        position: _offsetAnimation,
                        child: buildCategory(index));
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  initialItemCount: menu.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Text(
                  'Top order',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Caveat',
                      fontWeight: FontWeight.w700),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => buildItem(index),
                itemCount: topOrder.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildCategory(index) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 185,
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: HexColor('#fab43e'),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 5,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Burgers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'All types of burgers',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            height: 150,
            width: 120,
          ),
        ),
        Image.asset(
          '${menu[index]}',
          width: 70,
        )
      ],
    );
  }

  Widget buildItem(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.white),
      child: Row(
        children: [
          Image(
            image: CachedNetworkImageProvider('${topOrder[index]}'),
            width: 120,
          ),
          SizedBox(
            width: 6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Turkey',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Chicken, lemon, onion, ori...',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RatingStars(
                starCount: 4,
                maxValue: 4,
                value: 3,
                valueLabelVisibility: false,
                starSpacing: 3.5,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '15\$',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
