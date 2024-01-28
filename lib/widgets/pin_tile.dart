import 'package:flutter/material.dart';

class PinTile extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final bool isPinned;
  final ValueChanged<bool> onPinChanged;
  final void Function()? onTap;

  const PinTile({
    Key? key,
    required this.index,
    required this.title,
    required this.icon,
    required this.isPinned,
    required this.onPinChanged,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: IconButton(
        icon: Icon(isPinned ? Icons.push_pin : Icons.push_pin_outlined),
        onPressed: () {
          onPinChanged(!isPinned);
        },
      ),
      onTap: onTap,
    );
  }
}
