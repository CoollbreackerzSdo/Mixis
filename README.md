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

## Tutorial para principiantes (paso a paso)

### 1. Instalar Flutter
1. Descarga Flutter SDK desde https://docs.flutter.dev/get-started/install
2. Extrae en una carpeta (ej. `C:\src\flutter`).
3. Agrega `flutter\bin` al `PATH` del sistema.
4. Verifica con:
   ```bash
   flutter --version
   ```

### 2. Instalar Android Studio y SDK
1. Descarga Android Studio: https://developer.android.com/studio
2. Instala el SDK de Android (API 34 o superior).
3. Acepta licencias:
   ```bash
   flutter doctor --android-licenses
   ```
4. Verifica:
   ```bash
   flutter doctor
   ```

### 3. Clonar el proyecto
```bash
git clone <URL_DEL_REPO>
cd mixis
```

### 4. Instalar dependencias
```bash
flutter pub get
```

### 5. Ejecutar la app
Con un emulador o dispositivo conectado:
```bash
flutter run
```

### 6. (Opcional) Compilar APK release
```bash
flutter build apk --release
```
El APK quedará en `build/app/outputs/flutter-apk/app-release.apk`.

## Ejecutar rápido (para quien ya tiene Flutter)

```bash
flutter pub get
flutter run
```

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).