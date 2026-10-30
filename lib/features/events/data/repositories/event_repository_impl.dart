import '../../domain/repositories/event_repository.dart';
import '../../domain/entities/event.dart';
import '../datasources/event_local_datasource.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl(this._ds);
  final EventLocalDataSource _ds;

  @override
  Future<List<Event>> getAll() => _ds.getAll();

  @override
  Future<Event?> getByCode(String code) => _ds.getByCode(code);

  @override
  Future<void> create(Event event) => _ds.insert(event);

  @override
  Future<void> update(Event event) => _ds.update(event);

  @override
  Future<void> delete(String code) => _ds.delete(code);
}
