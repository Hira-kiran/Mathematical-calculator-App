import 'package:flutter/material.dart';

class CalculaorBtn extends StatelessWidget {
  final String text;
  final Color colorr;
  final VoidCallback onpress;

  const CalculaorBtn(
      {super.key,
      required this.text,
      this.colorr = Colors.grey,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: colorr,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
