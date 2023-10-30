import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

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
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? preFixIcon;
  final bool readOnly;
  // final TextStyle? hintStyle;

  const TextFieldWidget(
      {Key? key,
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
      this.onTap,
      this.maxLines,
      this.preFixIcon,
      // this.hintStyle,
      this.readOnly = false})
      : super(key: key);

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
      onTap: onTap,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: preFixIcon,
        hintText: hint,
        // hintStyle: hintStyle,
        hintStyle: const TextStyle(fontSize: 15),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 12),
        fillColor: Theme.of(context).focusColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      validator: validator,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
    );
  }
}
