import 'package:flutter/material.dart';

class Coffeetype extends StatelessWidget {
  final String coffeetype;
  final bool isselected;
  final VoidCallback onTap;
  const Coffeetype(
      {Key? key, required this.coffeetype, required this.isselected, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeetype,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: isselected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
