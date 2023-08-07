import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../history_cart/history_cart.dart';
import '../home/cart_screen/cart_screen.dart';
import '../home/home.dart';
import '../settings_screen/setting_page.dart';
import 'app_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{
  /* int SelectedItems = 0;
  void Change(int index) {
    setState(() {
      SelectedItems = index;
    });
  } */
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _wigetItems = [
    const DisplayScreen(),
    const HisToryCart(),
    const CartPage(
      displayArrow: false,
    ),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("rerender");
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
            body: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: _wigetItems),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state
                    .index /* SelectedItems */, // Cho biết item nào được chọn
                type: BottomNavigationBarType.fixed, // cố định item
                onTap: (value) {
                  context.read<AppBloc>().add(TriggleAppEvent(value));
                  _pageController.jumpToPage(value);
                  /* BlocProvider.of<AppBloc>(context).add(TriggleAppEvent(value)); */
                },
                elevation: 20, // shadow
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.blue,
                /* unselectedItemColor: Colors.blue, */
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'person')
                ])

            /*  body: _wigetItems[state.index],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state
                  .index /* SelectedItems */, // Cho biết item nào được chọn
              type: BottomNavigationBarType.fixed, // cố định item
              onTap: (value) {
                context.read<AppBloc>().add(TriggleAppEvent(value));
                /* BlocProvider.of<AppBloc>(context).add(TriggleAppEvent(value)); */
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
              ]), */
            );
      },
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
