import 'package:uuid/uuid.dart';

enum EventState { complete, process, canceled }

extension EventStateX on EventState {
  String get key => name; // complete | process | canceled
  static EventState fromIndex(int index) => EventState.values[index.clamp(0, EventState.values.length - 1)];
  static EventState fromKey(String key) =>
      EventState.values.firstWhere((e) => e.name == key, orElse: () => EventState.process);
}

class Event {
  final String code;
  final String name;
  final String description;
  final DateTime creation;
  final EventState state;

  Event({
    String? code,
    required this.name,
    required this.description,
    DateTime? creation,
    required this.state,
  })  : code = code ?? const Uuid().v4(),
        creation = creation ?? DateTime.now();

  Event copyWith({
    String? code,
    String? name,
    String? description,
    DateTime? creation,
    EventState? state,
  }) {
    return Event(
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      creation: creation ?? this.creation,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'name': name,
        'description': description,
        'creation': creation.toIso8601String(),
        'state': state.index,
      };

  factory Event.fromMap(Map<String, dynamic> map) => Event(
        code: map['code'] as String,
        name: map['name'] as String,
        description: (map['description'] ?? '') as String,
        creation: DateTime.parse(map['creation'] as String),
        state: EventStateX.fromIndex(map['state'] as int),
      );
}
