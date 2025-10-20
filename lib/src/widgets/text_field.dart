import 'package:flutter/material.dart';

enum InputFieldType {name, email, password}




class CustomTextFormField extends StatefulWidget {
  final String? helperText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Icon prefIcon;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    this.helperText,
    this.textInputAction,
    this.onFieldSubmitted,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefIcon,
    required this.controller,
  });
  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Поле не может быть пустым";
    }
    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-я\s]+$');
        if (!reg.hasMatch(value)) {
          return "Имя должно содержать только буквы";
        }
        break;
      case InputFieldType.email:
        final reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!reg.hasMatch(value)) {
          return "Неверный формат email";
        }
        break;
      case InputFieldType.password:
        final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);

        final hasDigits = RegExp(r'[0-9]').hasMatch(value);

        final hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

        if (!(hasSpecial && hasDigits && hasLetters && value.length >= 6)) {
          return "Слабый пароль";
        }
        break;
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputFieldType.password;
    return TextFormField(
      controller: widget.controller,
      obscureText: isPassword && _hidePassword,
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: const TextStyle(
          color: Color(0xFF192252),
          fontWeight: FontWeight.w400
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: const Color(0xFF424F7B),
          fontSize: 16,
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefIcon,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() => _hidePassword = !_hidePassword);
          },
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF424F7B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF424F7B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: _validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
    );
  }
}