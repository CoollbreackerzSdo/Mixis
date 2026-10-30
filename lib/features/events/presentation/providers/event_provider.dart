import 'package:flutter/foundation.dart';

import '../../domain/entities/event.dart';
import '../../domain/usecases/get_events.dart';
import '../../domain/usecases/create_event.dart';
import '../../domain/usecases/update_event.dart';
import '../../domain/usecases/delete_event.dart';

class EventProvider extends ChangeNotifier {
  EventProvider({
    required GetEvents getEvents,
    required CreateEvent createEvent,
    required UpdateEvent updateEvent,
    required DeleteEvent deleteEvent,
  })  : _getEvents = getEvents,
        _createEvent = createEvent,
        _updateEvent = updateEvent,
        _deleteEvent = deleteEvent;

  final GetEvents _getEvents;
  final CreateEvent _createEvent;
  final UpdateEvent _updateEvent;
  final DeleteEvent _deleteEvent;

  List<Event> _events = [];
  bool _loading = false;
  String? _error;
  EventState? _filter;

  List<Event> get events => _events;
  bool get loading => _loading;
  String? get error => _error;
  EventState? get filter => _filter;

  List<Event> get filteredEvents {
    if (_filter == null) return _events;
    return _events.where((e) => e.state == _filter).toList();
  }

  Future<void> load() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _events = await _getEvents();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void setFilter(EventState? state) {
    _filter = state;
    notifyListeners();
  }

  Future<void> add(Event event) async {
    await _createEvent(event);
    await load();
  }

  Future<void> edit(Event event) async {
    await _updateEvent(event);
    await load();
  }

  Future<void> remove(String code) async {
    await _deleteEvent(code);
    await load();
  }
}
