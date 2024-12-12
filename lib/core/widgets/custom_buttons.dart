import 'package:flutter/material.dart';
import 'package:task/core/utils/size_config.dart';
import 'package:task/core/widgets/space_widget.dart';

class CustomGeneralButton extends StatelessWidget {
   CustomGeneralButton({super.key, this.text, this.onTap});
   String? text;
   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: const Color(0XFF9F35EC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 20,
              color:  Colors.white70,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

