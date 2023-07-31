import 'package:app/App/bloc/app_bloc.dart';
import 'package:app/App/home/home.dart';
import 'package:app/App/home/navigator/foodpage_details.dart';
import 'package:app/App/home/navigator/recommend_foot_page.dart';
import 'package:app/Wellcom/bloc/screen_wellcom.dart';
import 'package:app/Wellcom/bloc/wellcom_bloc.dart';
import 'package:app/login/bloc/sign_in_bloc.dart';
import 'package:app/login/screen_sign_in.dart';
import 'package:app/register/bloc/register_bloc.dart';
import 'package:app/register/screen_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../App/bloc/test.dart';
import '../service/global.dart';
import 'names.dart';

class AppPage {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: Approutes.INITIAL,
          page: const Wellcome(),
          bloc: BlocProvider(create: (_) => WellcomBloc())),
      PageEntity(
          route: Approutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: Approutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: Approutes.HOMESCREEN,
          page:  HomeScreen(),
          bloc: BlocProvider(create: (_) => AppBloc())),
    ];
  }
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocprovider = <dynamic>[];
    for (var bloc in routes()) {
      blocprovider.add(bloc.bloc);
    }
    return blocprovider;
  }//trả về các Blocprovider

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstopen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == Approutes.INITIAL && deviceFirstopen) {
          bool isLoggedin = Global.storageService.getIsLogged();
          if(isLoggedin){
            return MaterialPageRoute(
              builder: (_) =>  HomeScreen(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
// set trả về cái nào trước

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}
