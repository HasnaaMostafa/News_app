
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/modules/search/search_screen.dart';
import 'package:newss_app/network/remote/dio_helper.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
import 'package:newss_app/shared/cubit/states.dart';

import '../../shared/cubit/Appcubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var cubit =NewsCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          appBar: AppBar(
            title:const Text(
                "News App"),
            actions: [IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                          builder:(BuildContext context)=>SearchScreen()));
                },
                icon: const Icon(Icons.search) ),
            IconButton(
                onPressed:(){
                  AppCubit.get(context).changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_rounded))],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
