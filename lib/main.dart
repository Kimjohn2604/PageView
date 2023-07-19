
import 'package:app/routes/pages.dart';
import 'package:app/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[... AppPage.allBlocProviders(context),],
        /* providers: [
          BlocProvider(
            lazy: false,
            create: (context) => WellcomBloc(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
        ], */
        child: ScreenUtilInit(
          builder: (context, snap) => MaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color:Colors.black),
                    elevation: 0, 
                    backgroundColor: Colors.white,
                    )),
            debugShowCheckedModeBanner: false,
            /* home: const Wellcome(), */
            onGenerateRoute: AppPage.generateRouteSettings,
            /* routes: {
              "myhome": (context) => Myhome(),
              "register": (context) => Register(),
              "signin": (context) => SignIn()
            }, */
          ),
        ));
  }
}