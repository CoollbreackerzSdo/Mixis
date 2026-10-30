import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/localization/app_localizations.dart';
import '../../domain/entities/event.dart';
import '../providers/event_provider.dart';

class EventFormPage extends StatefulWidget {
  const EventFormPage({super.key, this.event});
  final Event? event;

  @override
  State<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;
  late EventState _state;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.event?.name ?? '');
    _descCtrl = TextEditingController(text: widget.event?.description ?? '');
    _state = widget.event?.state ?? EventState.process;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final provider = context.read<EventProvider>();
    final event = Event(
      code: widget.event?.code,
      name: _nameCtrl.text.trim(),
      description: _descCtrl.text.trim(),
      creation: widget.event?.creation,
      state: _state,
    );
    if (widget.event == null) {
      await provider.add(event);
    } else {
      await provider.edit(event);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event == null ? l.newEvent : l.editEvent),
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.check),
            tooltip: l.save,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<EventState>(
                initialValue: _state,
                decoration: InputDecoration(labelText: l.state),
                items: EventState.values
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(_stateLabel(l, s)),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _state = v ?? _state),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: l.name),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? l.requiredField : null,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TextFormField(
                  controller: _descCtrl,
                  expands: true,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(labelText: l.description),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stateLabel(AppLocalizations l, EventState s) {
    switch (s) {
      case EventState.complete:
        return l.stateComplete;
      case EventState.process:
        return l.stateProcess;
      case EventState.canceled:
        return l.stateCanceled;
    }
  }
}
