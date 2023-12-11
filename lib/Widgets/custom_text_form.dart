import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    this.isSecure,
   required this.hintText,
   this.controller,
  });
 final String hintText;
 TextEditingController ? controller;
 bool ?isSecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: TextFormField(
        obscureText: isSecure ??false,
        controller:controller ,
        validator: (value) {
                        if (controller!.text.isEmpty) {
                          return "$hintText is Required";
                        } else {
                          return null;
                        }},
       decoration: InputDecoration(
         enabledBorder: OutlineInputBorder(),
         hintText: hintText,
       ),
      ),
    );
  }
}
