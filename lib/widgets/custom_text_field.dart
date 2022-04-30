import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.controller, this.isPassword = false})
      : super(key: key);
  bool isPassword;

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade700)),
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: TextFormField(
                obscureText: isPassword,
                controller: controller,
                decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 11),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ))),
          ),
        ],
      ),
    );
  }
}
