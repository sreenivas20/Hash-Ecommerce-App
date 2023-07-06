import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegTextField extends StatefulWidget {
  const RegTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      required this.validator});
  final controller;
  final hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?) validator;

  @override
  State<RegTextField> createState() => _RegTextFieldState();
}

class _RegTextFieldState extends State<RegTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2000.w,
      height: 80.h,
      child: TextFormField(
        mouseCursor: MouseCursor.uncontrolled,
        obscureText: widget.obscureText,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: const Color.fromARGB(255, 134, 188, 228),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color.fromARGB(255, 183, 232, 239).withOpacity(0.4),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
