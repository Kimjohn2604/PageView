import 'package:app/App/component/colors.dart';
import 'package:app/App/component/styles.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstText;
  late String secondText;
  bool hiddenText = true;
  int textHeight = 300;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight);
      secondText = widget.text.substring(textHeight + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = "";
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondText.isEmpty
          ? Text(firstText,style: AppStyle.headlineStyle3,)
          : Column(
              children: [
                Text(hiddenText
                    ? (firstText + "...")
                    : (firstText + secondText),style: AppStyle.headlineStyle3,),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? "Show more" :"Hide",
                        style: AppStyle.headlineStyle3.copyWith(color: Appcolor.mainColor),
                      ),
                      Icon(
                        hiddenText? Icons.arrow_drop_down :Icons.arrow_drop_up,
                        color: Appcolor.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
