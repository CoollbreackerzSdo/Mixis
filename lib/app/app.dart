import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'localization/app_localizations.dart';
import 'theme/cozy_theme.dart';
import '../core/storage/preferences_service.dart';
import '../features/events/data/datasources/event_local_datasource.dart';
import '../features/events/data/repositories/event_repository_impl.dart';
import '../features/events/domain/usecases/create_event.dart';
import '../features/events/domain/usecases/delete_event.dart';
import '../features/events/domain/usecases/get_events.dart';
import '../features/events/domain/usecases/update_event.dart';
import '../features/events/presentation/pages/events_list_page.dart';
import '../features/events/presentation/providers/event_provider.dart';
import '../features/settings/presentation/providers/locale_provider.dart';
import '../features/settings/presentation/providers/theme_provider.dart';


class MixisApp extends StatelessWidget {
  const MixisApp({super.key, required this.prefs});
  final PreferencesService prefs;

  @override
  Widget build(BuildContext context) {
    final ds = EventLocalDataSource();
    final repo = EventRepositoryImpl(ds);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider(prefs)),
        ChangeNotifierProvider(create: (_) => ThemeProvider(prefs)),
        ChangeNotifierProvider(
          create: (_) => EventProvider(
            getEvents: GetEvents(repo),
            createEvent: CreateEvent(repo),
            updateEvent: UpdateEvent(repo),
            deleteEvent: DeleteEvent(repo),
          )..load(),
        ),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, locale, theme, _) {
          return MaterialApp(
            title: 'Mixis',
            debugShowCheckedModeBanner: false,
            theme: CozyTheme.light(),
            darkTheme: CozyTheme.dark(),
            themeMode: theme.mode,
            locale: locale.locale,
            supportedLocales: const [Locale('es'), Locale('en')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const EventsListPage(),
          );
        },
      ),
    );
  }
}
