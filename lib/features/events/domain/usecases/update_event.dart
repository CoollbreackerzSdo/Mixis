import '../repositories/event_repository.dart';
import '../entities/event.dart';

class UpdateEvent {
  UpdateEvent(this._repo);
  final EventRepository _repo;
  Future<void> call(Event event) => _repo.update(event);
}
