import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  String txt;
  TabPage({@required this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          txt,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
