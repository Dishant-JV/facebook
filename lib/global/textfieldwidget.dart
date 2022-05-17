import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final AutovalidateMode? autovalidatemode;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? labelText;
  final Color? labelTextColor;
  final bool? isDense;
  final Color enableBordersideColor;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;

  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.autovalidatemode,
      this.validator,
      this.focusNode,
      this.obscureText = false,
      this.suffixIcon,
      this.labelText,
      this.labelTextColor,
      this.isDense = true,
      this.enableBordersideColor = Colors.grey,
      this.onEditingComplete,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      controller: controller,
      autovalidateMode: autovalidatemode,
      validator: validator,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(color: labelTextColor),
          isDense: isDense,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: enableBordersideColor))),
    );
  }
}
