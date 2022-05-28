import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key? key,
    this.fontSize,
    this.color = Colors.white,
    this.underLine = false,
    this.textAlign,
    this.height,
    this.fontWeight = FontWeight.w400,
    this.handleOverflow = false,
    this.textDirection,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? underLine;
  final TextDirection? textDirection;
  final bool handleOverflow;
  final TextAlign? textAlign;
  final double? height;
  @override
  Text build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      overflow: handleOverflow ? TextOverflow.ellipsis : TextOverflow.fade,
      style: GoogleFonts.roboto(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          decoration:
              underLine! ? TextDecoration.underline : TextDecoration.none),
    );
  }
}
