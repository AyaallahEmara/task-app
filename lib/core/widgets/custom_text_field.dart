import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({this.onChanged,this.hintText,this.obscureText=false }) ;
  final String? hintText;
  final bool? obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText!,
      validator: (data)
      {
        if(data!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black54
        ),
      ),
    );
  }
}