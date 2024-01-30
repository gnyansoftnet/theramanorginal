import 'package:flutter/material.dart';

class DropDownButtonFormFieldWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final T? value;
  final Widget? hintText;
  final String? Function(T?)? validator;
  const DropDownButtonFormFieldWidget({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      hint: hintText,
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(0)),
        fillColor: Theme.of(context).focusColor,
      ),
      validator: validator,
    );
  }
}
