import 'package:flutter/material.dart';
import 'package:elearn/utils/custom_style.dart';

class ListDataWidget extends StatelessWidget {

  final String icon;
  final String title;
  final GestureTapCallback onTap;

  const ListDataWidget({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20
      ),
      child: ListTile(
        leading: Image.asset(
            icon
        ),
        title: Text(
          title,
          style: CustomStyle.listStyle,
        ),
        onTap: onTap,
      ),
    );
  }
}