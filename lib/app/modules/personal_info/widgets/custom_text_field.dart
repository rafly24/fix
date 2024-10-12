// lib/features/personal_info/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}