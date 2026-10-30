import 'package:flutter/material.dart';

class CodeBadge extends StatelessWidget {
  const CodeBadge({super.key, required this.code, this.compact = false});
  final String code;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 6 : 10, vertical: compact ? 2 : 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        code,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: compact ? 10 : 12,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
