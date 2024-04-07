import 'package:codeland/res/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.isPasswordField,
  });
  final String label;
  final TextEditingController controller;
  final bool isPasswordField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPasswordField ? !_isPassVisible : false,
      controller: widget.controller,
      validator: (value) =>
          value!.trim().isEmpty ? 'Enter a ${widget.label}' : null,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Color(0xff635C5C),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPasswordField
            ? widget.controller.text.isEmpty
                ? const SizedBox(width: 0)
                : IconButton(
                    icon: _isPassVisible
                        ? const Icon(
                            Icons.visibility_off,
                            color: Color(0xff887E7E),
                          )
                        : const Icon(Icons.visibility,
                            color: Color(0xff887E7E)),
                    onPressed: () => setState(() {
                      _isPassVisible = !_isPassVisible;
                    }),
                  )
            : null,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: accentColor,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff887E7E),
            width: 1,
          ),
        ),
      ),
    );
  }
}
