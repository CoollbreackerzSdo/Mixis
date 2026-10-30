import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mixis/app/localization/app_localizations.dart';
import '../providers/theme_provider.dart';

class ThemeMenu extends StatelessWidget {
  const ThemeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tp = context.watch<ThemeProvider>();
    return PopupMenuButton<ThemeMode>(
      tooltip: l.theme,
      icon: Icon(tp.mode == ThemeMode.dark
          ? Icons.dark_mode
          : tp.mode == ThemeMode.light
              ? Icons.light_mode
              : Icons.brightness_auto),
      onSelected: tp.setMode,
      itemBuilder: (ctx) => [
        PopupMenuItem(value: ThemeMode.system, child: Text(l.themeSystem)),
        PopupMenuItem(value: ThemeMode.light, child: Text(l.themeLight)),
        PopupMenuItem(value: ThemeMode.dark, child: Text(l.themeDark)),
      ],
    );
  }
}
