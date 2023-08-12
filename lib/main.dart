import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newss_app/layout/news_layout/home_layout.dart';
import 'package:newss_app/network/remote/dio_helper.dart';
import 'package:newss_app/shared/bloc_observer.dart';
import 'package:newss_app/shared/cubit/AppStates.dart';
import 'package:newss_app/shared/cubit/Appcubit.dart';
import 'package:newss_app/shared/cubit/cubit.dart';
// import 'package:window_manager/window_manager.dart';
import 'network/local/cache_helper.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // if(Platform.isWindows) {
  //   await DesktopWindow.setMinWindowSize(
  //    const Size(350.0,650.0
  //   )
  // );
  // }


  //   await windowManager.ensureInitialized();
  // WindowOptions windowOptions = const WindowOptions(
  //   size: Size(350, 650),
  //   center: true,
  //   minimumSize: Size(350, 650),
  // );
  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   await windowManager.show();
  //   await windowManager.focus();
  // });

  Bloc.observer= MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getBoolData(key: "isDark");

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark,{super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (BuildContext context)=> AppCubit()..changeAppMode(
          fromShared: isDark,
        ),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates states){},
        builder: (BuildContext context,AppStates states){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme:
              const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                  iconTheme: IconThemeData(
                    color: Colors.deepOrange,

                  ),
                  titleTextStyle:TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ) ,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.deepOrange,
                      statusBarIconBrightness: Brightness.light
                  )

              ),
              bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 30.0,
              ),
              textTheme: const TextTheme(
                bodySmall: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ) ,
              ),

            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor("212121"),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:HexColor("212121") ,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor("212121"),
                elevation: 0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
                iconTheme: const IconThemeData(
                    color: Colors.white
                ),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 30.0,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor("212121"),
              ),
              textTheme: const TextTheme(
                bodySmall: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ) ,
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsApp(),
          );
        }
      ),
    );
  }
}

// flutter run -d chrome --web-renderer html
