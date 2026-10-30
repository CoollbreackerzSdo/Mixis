import '../repositories/event_repository.dart';
import '../entities/event.dart';

class CreateEvent {
  CreateEvent(this._repo);
  final EventRepository _repo;
  Future<void> call(Event event) => _repo.create(event);
}
