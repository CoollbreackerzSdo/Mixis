import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../app/localization/app_localizations.dart';
import '../../../../app/theme/pixel_decorations.dart';
import '../../domain/entities/event.dart';
import '../providers/event_provider.dart';
import '../widgets/state_chip.dart';
import 'event_form_page.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.events)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: PixelCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 16, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(event.creation),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => EventFormPage(event: event)),
                    ),
                    icon: const Icon(Icons.edit),
                    tooltip: l.editEvent,
                  ),
                  IconButton(
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
                    tooltip: l.delete,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              StateChip(state: event.state),
              const SizedBox(height: 8),
              Text(event.name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Text(event.description.isEmpty ? '—' : event.description,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Text('${l.code}: ${event.code}', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace')),
            ],
          ),
        ),
      ),
    );
  }
}
