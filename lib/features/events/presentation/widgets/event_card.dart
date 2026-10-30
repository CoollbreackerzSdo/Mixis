import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import 'package:mixis/app/theme/pixel_decorations.dart';

import '../../domain/entities/event.dart';
import 'state_chip.dart';
import 'code_badge.dart';

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
                Icon(
                  Icons.calendar_month,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(event.creation),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const Spacer(),
                CodeBadge(code: event.code.substring(0, 8), compact: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
