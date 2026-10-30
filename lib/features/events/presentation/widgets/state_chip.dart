import 'package:flutter/material.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import '../../domain/entities/event.dart';

class StateChip extends StatelessWidget {
  const StateChip({super.key, required this.state, this.compact = false});
  final EventState state;
  final bool compact;

  Color _color(BuildContext ctx) {
    final dark = Theme.of(ctx).brightness == Brightness.dark;
    switch (state) {
      case EventState.complete:
        return dark ? const Color(0xFF9BC496) : const Color(0xFF7FA67A);
      case EventState.process:
        return dark ? const Color(0xFFE8C46A) : const Color(0xFFD9A441);
      case EventState.canceled:
        return dark ? const Color(0xFFE08A6B) : const Color(0xFFC96B4A);
    }
  }

  String _label(BuildContext ctx) {
    final l = AppLocalizations.of(ctx)!;
    switch (state) {
      case EventState.complete:
        return l.stateComplete;
      case EventState.process:
        return l.stateProcess;
      case EventState.canceled:
        return l.stateCanceled;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 6 : 10, vertical: compact ? 2 : 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.25),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _label(context),
        style: TextStyle(
          color: color,
          fontSize: compact ? 10 : 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
