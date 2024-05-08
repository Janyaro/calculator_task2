import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  final VoidCallback onpress;
  const MyButton(
      {super.key,
      this.title = '',
      this.btnColor = const Color(0xffa5a5a5),
      required this.onpress});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.02),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.099,
            decoration: BoxDecoration(shape: BoxShape.circle, color: btnColor),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
