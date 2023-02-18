import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final void Function() onClick;
  const Field({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 0.4),
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, 0.4),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "Change",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
