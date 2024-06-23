import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  
  const Customtextfield({super.key , required this.controller , required this.hintText});
final TextEditingController controller;
  final  hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      decoration:  InputDecoration(
          hintText: hintText, border: const OutlineInputBorder()),
    );
  }
}
