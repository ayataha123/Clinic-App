import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap
  });
   final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
      child: Container(
       width: double.infinity,
       height: 55,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(4)),
         color: Color(0xff174068),
       ),
       child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
