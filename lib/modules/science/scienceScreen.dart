import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/compoents/compoents.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
import 'package:newss_app/shared/cubit/states.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
       listener:(BuildContext context,NewsStates states){},
      builder: (BuildContext context,NewsStates states){
         var list=NewsCubit.get(context).science;
             return ConditionlBuildArticle(list,context);
      });
  }
    
}