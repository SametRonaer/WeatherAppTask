// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  String label;
  Function() buttonFunction;
  AppButton({
    Key? key,
    required this.label,
    required this.buttonFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white38, borderRadius: BorderRadius.circular(40)),
        height: 40,
        width: 250,
        child: Text(label,
            style: GoogleFonts.lobster(
              color: Colors.black54,
              fontSize: 26,
            )),
      ),
    );
  }
}
