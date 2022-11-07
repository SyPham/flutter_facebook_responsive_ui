import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomTabBar({Key key, this.icons, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
