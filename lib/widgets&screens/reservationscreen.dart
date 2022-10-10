import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/cubit&states/cubit.dart';
import 'package:flutter_restaurant/cubit&states/states.dart';

import 'package:intl/intl.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var date = DateTime.now();
        var nameController = TextEditingController();
        var emailController = TextEditingController();
        var phoneController = TextEditingController();
        var chairsController = TextEditingController();
        var dateController = TextEditingController();
        var firstController = TextEditingController();
        var lastController = TextEditingController();
        var formkey = GlobalKey<FormState>();
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/hero-bg.jpg'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1 / 11,
                      child: Center(
                        child: Text(
                          'Book your table',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Caveat'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.orange,
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'name',
                          label: Text(
                            'name',
                            style: TextStyle(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is required';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            label: Text(
                              'email',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintText: 'ex@mple.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            label: Text(
                              'phone',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintText: '+963 xxx-xxx-xxx',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: chairsController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            hintText: 'Between 2 and 5',
                            label: Text(
                              'chairs',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Count of chairs is required';
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: dateController,
                          keyboardType: TextInputType.none,
                          cursorColor: Colors.orange,
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onTap: () => showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: date,
                                lastDate: date.add(Duration(days: 2)),
                                builder: (context, child) => Theme(
                                    data: ThemeData().copyWith(
                                        dialogBackgroundColor: Colors.black,
                                        colorScheme: ColorScheme.dark(
                                            primary: Colors.amber)),
                                    child: child as Widget),
                              ).then((value) {
                                print(DateFormat('yyyy-MM-dd')
                                    .format(value as DateTime));
                                dateController.text =
                                    DateFormat('yyyy-MM-dd').format(value);
                              }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Date is required';
                            }
                          }),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.5),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    controller: firstController,
                                    keyboardType: TextInputType.none,
                                    cursorColor: Colors.orange,
                                    decoration: InputDecoration(
                                      hintText: 'From',
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    onTap: () => showTimePicker(
                                          context: context,
                                          initialEntryMode:
                                              TimePickerEntryMode.input,
                                          initialTime: TimeOfDay.now(),
                                          builder: (context, child) => Theme(
                                              data: ThemeData().copyWith(
                                                  colorScheme: ColorScheme.dark(
                                                      primary: Colors.amber)),
                                              child: child as Widget),
                                        ).then((value) => firstController.text =
                                            value!.format(context)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time is required';
                                      }
                                    }),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.5),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    controller: lastController,
                                    keyboardType: TextInputType.none,
                                    cursorColor: Colors.orange,
                                    decoration: InputDecoration(
                                      hintText: 'To',
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    onTap: () => showTimePicker(
                                          context: context,
                                          initialEntryMode:
                                              TimePickerEntryMode.input,
                                          initialTime: TimeOfDay.now(),
                                          builder: (context, child) => Theme(
                                              data: ThemeData().copyWith(
                                                  colorScheme: ColorScheme.dark(
                                                      primary: Colors.amber)),
                                              child: child as Widget),
                                        ).then((value) {
                                          print(value?.format(context));
                                          lastController.text =
                                              value!.format(context);
                                        }),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time is required';
                                      }
                                    }),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: TextButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              // AppCubit().get(context).bookTable(
                              //     name: nameController.text,
                              //     phone: int.parse(phoneController.text),
                              //     email: emailController.text,
                              //     chairs: int.parse(chairsController.text),
                              //     date: dateController.text,
                              //     firstHour: firstController.text,
                              //     lastHour: lastController.text);

                            }
                          },
                          child: Text(
                            'Book now',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.yellow),
                            elevation: MaterialStateProperty.all(1),
                            minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width / 2, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.amber),
                                    borderRadius: BorderRadius.circular(25))),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
