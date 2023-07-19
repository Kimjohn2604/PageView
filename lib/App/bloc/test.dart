
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home.dart';
import 'app_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* int SelectedItems = 0;
  void Change(int index) {
    setState(() {
      SelectedItems = index;
    });
  } */

  static final List<Widget> _wigetItems = <Widget>[
    DisplayScreen(),
    const Center(child:  Text("data")),
    const Center(child:  Text("data")),
    const Center(child:  Text("data")),
  ];
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: _wigetItems[state.index],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index /* SelectedItems */, // Cho biết item nào được chọn
              type: BottomNavigationBarType.fixed, // cố định item
              onTap: (value){context.read<AppBloc>().add(TriggleAppEvent(value));},
              elevation: 20, // shadow
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.blue,
              /* unselectedItemColor: Colors.blue, */
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Action'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.airplane_ticket), label: 'Ticket'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'person')
              ]),
          /* body: Container(
            child: ListView.builder(itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(snap[index].id);
                },
                child: Container(
                  child: Text("ticket 1 "),
                ),
              );
            }),
          ) */
        );
      },
    );
  }
}
