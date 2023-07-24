import 'package:app/App/settings_screen/widget.dart';
import 'package:flutter/material.dart';

import '../../login/component/widget_login.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: buildAppBarProfile(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AvatarIcons(path: "user.png",height: 80,width: 80),
              BuildBottomContainerView(),
              buildListView(context)
            ],
          ),
        ),
      ),
    );
  }
}