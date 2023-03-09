import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      // required this.controller,
      required this.hintText,
      required this.keybord,
      required this.controls,
      this.validator})
      : super(key: key);
  final TextEditingController controls;

  final TextInputType keybord;
  // final LoginController controller;
  final String hintText;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 19, right: 19, bottom: 10),
      width: MediaQuery.of(context).size.width,
      // height: 50,
      decoration: BoxDecoration(
        color: Color(0xffebebeb),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: validator,
        controller: controls,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        keyboardType: keybord,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 67, 65, 65), fontSize: 14),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 18),
        ),
      ),
    );
  }
}
