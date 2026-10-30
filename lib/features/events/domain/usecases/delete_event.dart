import '../repositories/event_repository.dart';

class DeleteEvent {
  DeleteEvent(this._repo);
  final EventRepository _repo;
  Future<void> call(String code) => _repo.delete(code);
}
