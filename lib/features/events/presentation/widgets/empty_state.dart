import 'package:flutter/material.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import 'package:mixis/app/theme/pixel_decorations.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Center(
      child: PixelCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event_note, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(l.noEvents, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(l.noEventsHint, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
