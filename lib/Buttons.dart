import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
   Buttons({required this.text,required this.color,required this.ontap });
  final Color color;
  final String text;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(

            child: Text(text,style: GoogleFonts.inriaSans(
              fontSize: 20,
            ),),
          ),
      ),
    );
  }
}
