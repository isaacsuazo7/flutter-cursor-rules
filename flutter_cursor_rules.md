# Flutter Cursor Rules 🎯

Reglas de Cursor para desarrollo Flutter con mejores prácticas y convenciones.

## 📋 Reglas Principales

### 1. **Uso de `const` Obligatorio**
- SIEMPRE usar `const` cuando sea posible para mejorar el rendimiento
- Aplicar `const` en constructores de widgets que no cambian
- Usar `const` en listas, mapas y objetos inmutables

```dart
// ✅ CORRECTO
const Text('Hello World')
const SizedBox(height: 16)
const EdgeInsets.all(8.0)

// ❌ INCORRECTO
Text('Hello World')
SizedBox(height: 16)
EdgeInsets.all(8.0)
```

### 2. **StatelessWidget vs Funciones Widget**
- SIEMPRE usar `StatelessWidget` o `StatefulWidget` en lugar de funciones que retornan widgets
- Las funciones widget no se optimizan correctamente en el árbol de widgets

```dart
// ✅ CORRECTO
class MyButton extends StatelessWidget {
  const MyButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text('Button'));
  }
}

// ❌ INCORRECTO
Widget myButton() {
  return ElevatedButton(onPressed: () {}, child: const Text('Button'));
}
```

### 3. **Naming Conventions**
- Clases: `PascalCase` (ej: `MyHomePage`)
- Variables y funciones: `camelCase` (ej: `userName`, `fetchData()`)
- Archivos: `snake_case` (ej: `home_page.dart`)
- Constantes: `lowerCamelCase` (ej: `defaultPadding`)

### 4. **Estructura de Archivos**
- Un widget por archivo cuando sea complejo
- Agrupar widgets relacionados en el mismo archivo si son simples
- Usar barrel exports para organizar imports

```dart
// lib/
//   ├── screens/
//   ├── widgets/
//   ├── models/
//   ├── services/
//   └── utils/
```

### 5. **Import Optimization**
- Usar imports relativos para archivos internos
- Agrupar imports: dart core, flutter, packages, internos
- Usar barrel exports para simplificar imports

```dart
// ✅ CORRECTO
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../widgets/custom_button.dart';
```

### 6. **Key Usage**
- Usar `super.key` en constructores de widgets
- Implementar keys cuando sea necesario para performance

```dart
// ✅ CORRECTO
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
}
```

### 7. **BuildContext Best Practices**
- No almacenar BuildContext en variables de instancia
- Usar context solo en el método build o callbacks inmediatos

```dart
// ✅ CORRECTO
void _showDialog() {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(title: Text('Alert')),
  );
}
```

### 8. **State Management**
- Preferir StatelessWidget cuando sea posible
- Usar setState() solo para cambios locales simples
- Implementar Provider, Bloc, o Riverpod para state complejo

### 9. **Performance Optimizations**
- Usar `const` constructors
- Implementar `ListView.builder` para listas largas
- Evitar rebuilds innecesarios con `const` widgets
- Usar `RepaintBoundary` para widgets costosos

```dart
// ✅ CORRECTO
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(items[index].title),
  ),
)
```

### 10. **Error Handling**
- SIEMPRE manejar errores en operaciones async
- Usar try-catch para operaciones que pueden fallar
- Mostrar estados de loading y error apropiados

```dart
// ✅ CORRECTO
Future<void> fetchData() async {
  try {
    setState(() => isLoading = true);
    final data = await apiService.getData();
    setState(() {
      this.data = data;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      error = e.toString();
      isLoading = false;
    });
  }
}
```

### 11. **Widget Composition**
- Favorecer composición sobre herencia
- Crear widgets pequeños y reutilizables
- Extraer widgets complejos a clases separadas

### 12. **Responsive Design**
- Usar `MediaQuery` para obtener dimensiones de pantalla
- Implementar `LayoutBuilder` para layouts adaptativos
- Usar `Flexible` y `Expanded` apropiadamente

```dart
// ✅ CORRECTO
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  
  return screenWidth > 600 
    ? const TabletLayout()
    : const MobileLayout();
}
```

### 13. **Asset Management**
- Definir assets en `pubspec.yaml`
- Usar const para asset paths
- Organizar assets en carpetas lógicas

```dart
// ✅ CORRECTO
class AppImages {
  static const String logo = 'assets/images/logo.png';
  static const String background = 'assets/images/background.jpg';
}
```

### 14. **Theme Usage**
- Usar `Theme.of(context)` para acceder al tema
- Definir colores y estilos en el tema de la app
- Evitar hardcodear colores y estilos

```dart
// ✅ CORRECTO
Text(
  'Hello',
  style: Theme.of(context).textTheme.headlineMedium,
)

Container(
  color: Theme.of(context).primaryColor,
)
```

### 15. **Documentation**
- Documentar widgets públicos con `///`
- Usar comentarios explicativos para lógica compleja
- Mantener README actualizado

```dart
/// A custom button widget that follows Material Design principles.
/// 
/// This button provides consistent styling and behavior across the app.
class CustomButton extends StatelessWidget {
  /// Creates a [CustomButton] with the given [text] and [onPressed] callback.
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
}
```

## 🚀 Comandos Útiles

```bash
# Análisis de código
flutter analyze

# Formateo automático
dart format .

# Generar código
flutter packages pub run build_runner build

# Tests
flutter test
```

## 📚 Referencias

- [Flutter Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Best Practices](https://flutter.dev/docs/testing)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

---

**Creado por:** [Isaac Suazo](https://github.com/isaacsuazo7) • **Fecha:** Junio 2025
