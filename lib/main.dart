
import 'package:app/routes/pages.dart';
import 'package:app/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'counter/bloc/counter_bloc.dart';

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
            onGenerateRoute: AppPage.GenerateRouteSettings,
            /* routes: {
              "myhome": (context) => Myhome(),
              "register": (context) => Register(),
              "signin": (context) => SignIn()
            }, */
          ),
        ));
  }
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
                "${BlocProvider.of<CounterBloc>(context).state.counter}");
            /* Text("${state.counter}"); */
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Tang());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Giam());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
