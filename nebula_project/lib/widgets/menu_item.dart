import 'package:flutter/material.dart';

import '../../../constant.dart';

class MenuItemC extends StatefulWidget {
  final String title;
  final Function press;

  const MenuItemC({required this.title, required this.press, super.key});

  @override
  State<MenuItemC> createState() => _MenuItemCState(title: title, press: press);
}

class _MenuItemCState extends State<MenuItemC> {
  final String title;
  final Function press;
  Color color = kTextcolor.withOpacity(0.3);
  _MenuItemCState({required this.title, required this.press});
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onHover: (value) => {
        if (value)
          {
            setState(() {
              color = (Colors.blue[300])!;
            })
          }
        else
          {
            setState(() {
              color = kTextcolor.withOpacity(0.3);
            })
            }
      },
      onTap: (() {
        press();
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 23,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
