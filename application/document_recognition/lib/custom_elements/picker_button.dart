import 'package:flutter/material.dart';

class PickerButton extends StatelessWidget {
  const PickerButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  // final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.upload_sharp),
      label: const Text(
        'Upload image',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
