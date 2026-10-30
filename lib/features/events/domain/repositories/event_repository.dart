import '../entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getAll();
  Future<Event?> getByCode(String code);
  Future<void> create(Event event);
  Future<void> update(Event event);
  Future<void> delete(String code);
}
