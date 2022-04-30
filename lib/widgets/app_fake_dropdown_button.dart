// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFakeDropdownButton extends StatelessWidget {
  Widget? title;

  String? initialValue;
  void Function() pressedFunction;
  Widget? suffixIcon;

  AppFakeDropdownButton({
    Key? key,
    this.title,
    this.initialValue,
    required this.pressedFunction,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getDropdownButton(context);
  }

  Widget _getDropdownButton(BuildContext context) {
    return GestureDetector(
      onTap: pressedFunction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) title!,
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(initialValue ?? "-select-",
                    style: GoogleFonts.lobster(
                        fontSize: 20, color: Colors.black54)),
                Row(
                  children: [
                    if (suffixIcon != null) suffixIcon!,
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                )
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
        ],
      ),
    );
  }
}
