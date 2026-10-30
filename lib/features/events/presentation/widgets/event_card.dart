import 'package:flutter/material.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import 'package:mixis/app/theme/pixel_decorations.dart';
import '../../domain/entities/event.dart';
import 'state_chip.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.onTap});
  final Event event;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: PixelCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    event.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                StateChip(state: event.state, compact: true),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              event.description.isEmpty ? '—' : event.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 12, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
                const SizedBox(width: 4),
                Text(
                  '${event.creation.day}/${event.creation.month}/${event.creation.year}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  '${l.code}: ${event.code.substring(0, 8)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
