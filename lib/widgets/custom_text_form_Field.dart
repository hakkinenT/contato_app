import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField(
      {required this.labelText,
      this.initialValue,
      this.validator,
      this.controller,
      this.autofocus = false,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType,
      this.onSaved,
      this.onChanged,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: initialValue,
        obscureText: obscureText,
        controller: controller,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            filled: true,
            fillColor: Colors.black.withAlpha(20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide.none)),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
