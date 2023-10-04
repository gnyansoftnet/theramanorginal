import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardKey;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String? value)? onChanged;
  final Function(String? value)? onFieldSubmitted;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    this.label,
    this.hint,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.keyboardKey,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      controller: controller,
      keyboardType: keyboardKey,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 10),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 12),
        fillColor: Theme.of(context).focusColor,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
    );
  }
}
