import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? textFieldIcon;
  final String hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool? pass;
  final bool? enabled;
  final int? maxLength;
  // final Function? onTap;

  const MyTextField(
      {Key? key,
      this.controller,
      this.textFieldIcon,
      required this.hintText,
      this.validator,
      this.inputType,
      this.maxLength,
      this.initialValue,
      this.enabled,
      // this.onTap,
      this.pass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        enabled: enabled,
        initialValue: initialValue,
        maxLength: maxLength,
        // onTap: onTap!(),
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        obscureText: pass!,
        decoration: InputDecoration(
            filled: true,
            suffixIcon: textFieldIcon,
            fillColor: Colors.grey[300],
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
