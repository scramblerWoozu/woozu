import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
 const TextArea(
      {Key? key,
      required TextEditingController controller,
      required this.icon,
      required this.isObscure,
})
      : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  final String icon;
  final bool isObscure;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: _controller,
      cursorColor: Colors.grey,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          isDense: true),
      keyboardType: TextInputType.text,
      onChanged: (String text) {},
    );
  }
}
