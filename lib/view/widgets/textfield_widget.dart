import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function(String)? validator;

  const TextFieldWidget(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller,
      this.onChange,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.black),
        onChanged: (value) => onChange,
        validator: (v)=>validator!(v!),
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(),
          hintText: hint,
          enabledBorder: _outlineBorder(Color(0xFF9A9A9A)),
          focusedBorder: _outlineBorder(Color(0xFf7834F4)),
          errorBorder: _outlineBorder(Colors.red),
          focusedErrorBorder: _outlineBorder(Colors.red),
        ));
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
