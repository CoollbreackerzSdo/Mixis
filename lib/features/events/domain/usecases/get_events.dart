import '../repositories/event_repository.dart';
import '../entities/event.dart';

class GetEvents {
  GetEvents(this._repo);
  final EventRepository _repo;
  Future<List<Event>> call() => _repo.getAll();
}
