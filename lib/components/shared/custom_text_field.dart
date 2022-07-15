import 'package:dream_diary/provider_models/add_dream_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.read<AddDreamModel>();

    return TextField(
      maxLines: 7,
      controller: model.dreamTextController,
      textAlignVertical: TextAlignVertical.top,
      cursorColor: const Color.fromRGBO(237, 237, 237, 0.5),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 50, left: 20, top: 20, right: 20),
        hintText: "Опишите свою мечту",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(237, 237, 237, 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF111111),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF111111),
          ),
        ),

        filled: true,
        fillColor: const Color(0xFF111111),
      )
    );
  }
}
