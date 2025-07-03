import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  final String label;
  final IconData? leadingIcon;
  final VoidCallback? onTap;

  const AppListItem({
    required this.label,
    required this.onTap,
    this.leadingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
