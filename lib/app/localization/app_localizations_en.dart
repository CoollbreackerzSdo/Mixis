// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Mixis Events';

  @override
  String get events => 'Events';

  @override
  String get newEvent => 'New event';

  @override
  String get editEvent => 'Edit event';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get state => 'State';

  @override
  String get creation => 'Creation';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get confirmDelete => 'Delete this event?';

  @override
  String get noEvents => 'No events yet';

  @override
  String get noEventsHint => 'Create your first event with the + button';

  @override
  String get filterAll => 'All';

  @override
  String get stateComplete => 'Complete';

  @override
  String get stateProcess => 'In progress';

  @override
  String get stateCanceled => 'Canceled';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get requiredField => 'Required field';

  @override
  String get code => 'Code';
}
