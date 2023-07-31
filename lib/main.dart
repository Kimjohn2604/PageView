import 'package:app/App/controller/popular_product_controller.dart';
import 'package:app/routes/pages.dart';
import 'package:app/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'App/controller/recommended_product_controller.dart';
import 'App/helper/dependencies.dart' as dep;

Future<void> main() async {
  await Global.init();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProDuctController>().getPopularProDuctList();
    Get.find<RecommendedProDuctController>().getRecommendedProDuctList();
    //ghi app chạy thì chạy method getPopularProDuctList => gửi yêu cầu đến server=> nếu nhận đc data
    //thì nó lưu trong list
    return MultiBlocProvider(
        providers: [
          ...AppPage.allBlocProviders(context),
        ],
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
          builder: (context, snap) => GetMaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              /* backgroundColor: Colors.white, */
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
