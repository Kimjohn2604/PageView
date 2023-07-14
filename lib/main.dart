import 'package:app/bloc/wellcom_bloc.dart';
import 'package:app/login/bloc/sign_in_bloc.dart';
import 'package:app/register/bloc/register_bloc.dart';
import 'package:app/wellcom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc2/bloc/counter_bloc.dart';
import 'sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
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
        ],
        child: ScreenUtilInit(
          builder: (context, snap) => MaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color:Colors.black),
                    elevation: 0, 
                    backgroundColor: Colors.white,
                    )),
            debugShowCheckedModeBanner: false,
            home: const Wellcome(),
            routes: {
              "myhome": (context) => Myhome(),
              /* "register": (context) => Register(), */
              "signin": (context) => SignIn()
            },
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
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Tang());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
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
