import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/compoents/compoents.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
import 'package:newss_app/shared/cubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state) {
        var list = NewsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: Builder(
            builder: (BuildContext context){

              NewsCubit.get(context).setDesktop(false);

              return ConditionlBuildArticle(list,context);
            },
          ),
          desktop: Builder(
            builder: (BuildContext context){
              NewsCubit.get(context).setDesktop(true);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ConditionlBuildArticle(list,context)),
                  if(list.isNotEmpty)
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "${list[NewsCubit.get(context).selectedBusinessItem]["description"]}",
                            style: const TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          breakpoints: const ScreenBreakpoints(
            desktop: 850,
            tablet: 600,
            watch: 300),);}

    );
  }
}
