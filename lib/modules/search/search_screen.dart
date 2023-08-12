import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/compoents/compoents.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
import 'package:newss_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();


   SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context,state){

        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    labelText: "Search",suffixStyle: TextStyle(
                    color: Colors.grey
                  ),
                    prefixIcon: Icon(Icons.search),
                  ),
                  style: const TextStyle(color: Colors.grey),
                  controller:searchController ,
                  keyboardType:TextInputType.text ,
                  validator:(String? value){
                    if(value!.isEmpty){
                      return "Search must not be empty";
                    }
                    return null;
                  } ,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },


                ),
              ),
              Expanded(
                  child:
                  ConditionlBuildArticle(list, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
