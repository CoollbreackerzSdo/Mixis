import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import 'package:mixis/app/theme/pixel_decorations.dart';

import '../../domain/entities/event.dart';
import '../providers/event_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/event_card.dart';
import '../widgets/state_chip.dart';
import 'event_detail_page.dart';
import 'event_form_page.dart';

import 'package:mixis/features/settings/presentation/widgets/language_menu.dart';
import 'package:mixis/features/settings/presentation/widgets/theme_menu.dart';

class EventsListPage extends StatefulWidget {
  const EventsListPage({super.key});

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventProvider>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<EventProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l.events),
        actions: const [LanguageMenu(), ThemeMenu()],
      ),
      body: CheckerboardBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: l.filterAll,
                      selected: provider.filter == null,
                      onTap: () => provider.setFilter(null),
                    ),
                    const SizedBox(width: 8),
                    ...EventState.values.map(
                      (s) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _StateFilterChip(
                          state: s,
                          selected: provider.filter == s,
                          onTap: () => provider.setFilter(s),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: provider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.filteredEvents.isEmpty
                  ? const EmptyState()
                  : RefreshIndicator(
                      onRefresh: provider.load,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: provider.filteredEvents.length,
                        itemBuilder: (ctx, i) {
                          final e = provider.filteredEvents[i];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: EventCard(
                              event: e,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => EventDetailPage(event: e),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () =>
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const EventFormPage())),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).cardColor,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }
}

class _StateFilterChip extends StatelessWidget {
  const _StateFilterChip({
    required this.state,
    required this.selected,
    required this.onTap,
  });
  final EventState state;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: selected ? 1 : 0.6,
        child: StateChip(state: state),
      ),
    );
  }
}
