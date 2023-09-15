import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextfield extends StatelessWidget {
  const PrimaryTextfield({
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    required this.hint,
    super.key,
    this.textInputType = TextInputType.text,
    this.count,
    this.maxLine,
    this.onTap,
    this.readOnly = false,
    this.suffix,
    this.formatter,
    this.controller,
    this.widgetKey,
  });

  final Function(String) onChanged;
  final Function(String) onSaved;
  final Function(String) validator;
  final String hint;
  final TextInputType textInputType;
  final int? count;
  final int? maxLine;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? suffix;
  final List<TextInputFormatter>? formatter;
  final TextEditingController? controller;
  final String? widgetKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(widgetKey ?? DateTime.now().toIso8601String()),
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.red,
          ),
        ),
        hintText: hint,
        suffixIcon: suffix,
      ),
      maxLength: count,
      maxLines: maxLine,
      onChanged: onChanged,
      onSaved: (String? v) => onSaved(v ?? ''),
      validator: (String? v) => validator(v ?? ''),
      keyboardType: textInputType,
      inputFormatters: formatter,
    );
  }
}
