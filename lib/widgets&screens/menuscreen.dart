import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/constants.dart';
import 'package:flutter_restaurant/cubit&states/cubit.dart';
import 'package:flutter_restaurant/cubit&states/states.dart';
import 'package:flutter_restaurant/service/dio.dart';
import 'package:flutter_restaurant/widgets&screens/itemsscreen.dart';
import 'package:hexcolor/hexcolor.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return ListView.builder(
          itemBuilder: (context, index) => buildCate(context),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildCate(context) => InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ItemsScreen()));
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: HexColor('#fab43e'),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(70)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 7,
                ),
              ]),
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 3.2 / 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cate1.jpg'),
              ),
              Center(
                child: Text(
                  'Burgers',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
}
