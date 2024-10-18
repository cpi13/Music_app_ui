import 'package:flutter/material.dart';
class SectionHeader extends StatelessWidget {
  final String title;
  final String action;
  const SectionHeader({
    required this.title,
    this.action = "View More",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text(action,style: Theme.of(context).textTheme!.bodyLarge,)
      ],);
  }
}