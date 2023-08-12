
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
import '../network/web_view/web_view_screen.dart';

Widget BuildArticleItem(article,context,index)=> Container(
      color: NewsCubit.get(context).selectedBusinessItem==index &&  NewsCubit.get(context).isDesktop?  Colors.grey : null,
  child:   InkWell(
        onTap: () {
              NewsCubit.get(context).selectBusinessItem(index);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder:(context)=>WebViewScreen(article["url"])));
              },
    child:Padding(

          padding: const EdgeInsets.all(20.0),

          child: Row(

          children: [

          Container(

          height: 140,

          width: 140,

          decoration: BoxDecoration(

          borderRadius:

          BorderRadius.circular(10.0,),

          image: DecorationImage(

          image: NetworkImage(

          "${article["image"]}"),

          fit: BoxFit.cover)),),

          const SizedBox(

          width: 20.0,

          ),

          Expanded(

          child: SizedBox(

          height: 140,

          child: Column(

          // mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.start,

          children: [

          Expanded(

          child: Text("${article["title"]}",

          maxLines: 3,

          overflow: TextOverflow.ellipsis,

          style:

          Theme.of(context).textTheme.bodySmall,),

          ),

          Text("${article["publishedAt"]}",

          style: TextStyle(

          color: Colors.grey,

          ),)

          ],

          ),

          ),

          )

          ],

          ),

          ),
  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
      start: 20.0
  ),
  child: Container(
    width: double.infinity,
    height: 0.1,
    color: Colors.grey[500],
  ),
);

Widget ConditionlBuildArticle(list,context,{isSearch=false}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context)=> ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => BuildArticleItem(list[index],context,index),
      separatorBuilder: (BuildContext context, int index) => myDivider(),
      itemCount: 10,),
      fallback: (context)=>isSearch? Container() : const Center(child: CircularProgressIndicator())
);


