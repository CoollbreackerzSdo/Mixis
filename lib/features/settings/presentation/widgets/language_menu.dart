import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import '../providers/locale_provider.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final localeProvider = context.watch<LocaleProvider>();
    return PopupMenuButton<String>(
      tooltip: l.language,
      icon: const Icon(Icons.language),
      onSelected: (code) => localeProvider.setLocale(Locale(code)),
      itemBuilder: (ctx) => [
        PopupMenuItem(value: 'es', child: Text('Español')),
        PopupMenuItem(value: 'en', child: Text('English')),
      ],
    );
  }
}
