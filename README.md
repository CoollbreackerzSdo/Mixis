# Mixis

Aplicación móvil de gestión de eventos desarrollada con Flutter.

## Características

- Crear, editar, eliminar y listar eventos.
- Estados de evento: `Complete`, `Process`, `Canceled`.
- Persistencia local con SQLite.
- Filtro por estado en la lista principal.
- Soporte de tema claro/oscuro (reactivo al sistema) y selección manual.
- Internacionalización (español/inglés) con cambio en caliente.
- UI estilo cozy + pixel art con tipografía Rubik.

## Estructura de datos

```json
{
  "code": "uuid",
  "name": "string",
  "description": "string",
  "creation": "datetime",
  "state": "Complete | Process | Canceled"
}
```

## Arquitectura

Vertical Slice + por features:

```
lib/
  app/            # app, theme, localization
  core/           # database, storage
  features/
    events/       # data / domain / presentation
    settings/     # locale & theme providers + widgets
```

Gestión de estado con `provider`.

## Dependencias principales

- provider
- sqflite, path_provider
- uuid
- intl
- shared_preferences
- google_fonts
- flutter_localizations

## Ejecutar

```bash
flutter pub get
flutter run
```

## Licencia

Proyecto personal.