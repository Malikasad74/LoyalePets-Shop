import 'package:flutter/material.dart';

enum InputType { email, password, text }

class TextfieldInpute extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;
  final InputType inputType;

  const TextfieldInpute({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.icon,
    this.inputType = InputType.text,
  });

  @override
  State<TextfieldInpute> createState() => _TextfieldInputeState();
}

class _TextfieldInputeState extends State<TextfieldInpute> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: widget.isPass,
        controller: widget.textEditingController,
        onChanged: (value) {
          setState(() {
            if (widget.inputType == InputType.email) {
              isValid = value.contains('@');
            } else if (widget.inputType == InputType.password) {
              isValid = value.length >= 6;
            } else {
              isValid = true;
            }
          });
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black, fontSize: 18),
          prefixIcon: Icon(widget.icon, color: Colors.black45),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFedf0f8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: isValid ? Colors.blue : Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}