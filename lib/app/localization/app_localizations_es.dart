// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mixis Eventos';

  @override
  String get events => 'Eventos';

  @override
  String get newEvent => 'Nuevo evento';

  @override
  String get editEvent => 'Editar evento';

  @override
  String get name => 'Nombre';

  @override
  String get description => 'Descripción';

  @override
  String get state => 'Estado';

  @override
  String get creation => 'Creación';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirmDelete => '¿Eliminar este evento?';

  @override
  String get noEvents => 'Aún no hay eventos';

  @override
  String get noEventsHint => 'Crea tu primer evento con el botón +';

  @override
  String get filterAll => 'Todos';

  @override
  String get stateComplete => 'Completado';

  @override
  String get stateProcess => 'En proceso';

  @override
  String get stateCanceled => 'Cancelado';

  @override
  String get language => 'Idioma';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get requiredField => 'Campo requerido';

  @override
  String get code => 'Código';
}
