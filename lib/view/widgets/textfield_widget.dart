import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function(String)? validator;
  final bool? readOnly;
  final Function()? onTap;
  final bool? enable;


  const TextFieldWidget(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller,
      this.onChange,
      this.validator, this.readOnly=false,this.onTap,this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.black),
        onChanged: (value) => onChange,
        readOnly: readOnly??false,
        validator: (v) => validator!(v!),
        controller: controller,
        onTap: onTap,
        enabled: enable,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(),
          fillColor: Color(0xffE1E1E1).withOpacity(0.2),
          filled: true,
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
