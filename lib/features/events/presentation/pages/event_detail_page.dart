import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import 'package:mixis/app/theme/pixel_decorations.dart';
import '../../domain/entities/event.dart';
import 'event_form_page.dart';
import '../providers/event_provider.dart';
import '../widgets/state_chip.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.events)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PixelCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.name, style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 8),
              StateChip(state: event.state),
              const SizedBox(height: 16),
              Text(event.description.isEmpty ? '—' : event.description,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Theme.of(context).colorScheme.onSurface),
                  const SizedBox(width: 6),
                  Text('${event.creation}', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 8),
              Text('${l.code}: ${event.code}', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace')),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => EventFormPage(event: event)),
                      ),
                      icon: const Icon(Icons.edit),
                      label: Text(l.editEvent),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(l.confirmDelete),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
                              TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.delete)),
                            ],
                          ),
                        );
                        if (ok == true && context.mounted) {
                          await context.read<EventProvider>().remove(event.code);
                          if (context.mounted) Navigator.of(context).pop();
                        }
                      },
                      icon: const Icon(Icons.delete),
                      label: Text(l.delete),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
