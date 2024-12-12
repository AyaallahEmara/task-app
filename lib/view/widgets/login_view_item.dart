import 'package:flutter/material.dart';
import 'package:task/core/widgets/custom_text_field.dart';
import 'package:task/core/widgets/space_widget.dart';

class LoginViewItem extends StatelessWidget {
   LoginViewItem({super.key, required this.text, required this.hintText,this.onChanged,this.obscureText = false });
   bool? obscureText;
   String text;
   String hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: const Color(0xff0c0b0b),
            fontWeight: FontWeight.w600,
            height: 1.5625,
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        VerticalSpace(0.5),
        CustomTextFormField(
          hintText: hintText,
          obscureText: obscureText,
          onChanged: onChanged,
        )
      ],
    );
  }
}
