import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home.dart';

import '../home/navigator/recommend_foot_page.dart';
import '../settings_screen/setting_page.dart';
import 'app_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  /* int SelectedItems = 0;
  void Change(int index) {
    setState(() {
      SelectedItems = index;
    });
  } */
  @override
  bool get wantKeepAlive => true;
  static final List<Widget> _wigetItems = <Widget>[
    const DisplayScreen(),
    /* const PopularFoodPage(), */
    const Text("data"),
    const Text("data"),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("rerender");
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(children: [_wigetItems[state.index]]),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state
                  .index /* SelectedItems */, // Cho biết item nào được chọn
              type: BottomNavigationBarType.fixed, // cố định item
              onTap: (value) {
                context.read<AppBloc>().add(TriggleAppEvent(value));
              },
              elevation: 20, // shadow
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.blue,
              /* unselectedItemColor: Colors.blue, */
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'person')
              ]),
        );
      },
    );
  }
}
