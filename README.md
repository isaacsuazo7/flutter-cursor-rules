# Flutter Cursor Rules 🎯

Un conjunto completo de reglas y mejores prácticas para desarrollo Flutter usando Cursor IDE.

## 📋 Contenido

- **[`.cursorrules`](.cursorrules)** - Archivo de configuración para Cursor IDE
- **[`flutter_cursor_rules.md`](flutter_cursor_rules.md)** - Documentación completa de reglas y ejemplos
- **[`example_implementations.dart`](example_implementations.dart)** - Ejemplos prácticos de código correcto e incorrecto

## 🚀 Uso Rápido

### 1. Copia el archivo `.cursorrules` a tu proyecto Flutter
```bash
# Copia directamente desde este repositorio
curl -o .cursorrules https://raw.githubusercontent.com/isaacsuazo7/flutter-cursor-rules/main/.cursorrules
```

### 2. O descarga las reglas manualmente
- Descarga [`.cursorrules`](.cursorrules) y colócalo en la raíz de tu proyecto Flutter
- Cursor automáticamente aplicará estas reglas a tu código

## 🎯 Reglas Principales

### ✅ Lo que DEBES hacer:
- Usar `const` constructors siempre que sea posible
- Preferir `StatelessWidget` sobre funciones que retornan widgets
- Seguir las convenciones de nombres de Dart
- Usar `Theme.of(context)` para colores y estilos
- Implementar manejo de errores apropiado
- Crear widgets pequeños y reutilizables

### ❌ Lo que NO debes hacer:
- Crear funciones que retornan widgets
- Omitir `const` en constructors inmutables
- Hardcodear colores y estilos
- Ignorar el manejo de errores en operaciones async
- Crear widgets monolíticos

## 📁 Estructura de Archivos

```
your_flutter_project/
├── .cursorrules          # ← Coloca este archivo aquí
├── lib/
│   ├── screens/
│   ├── widgets/
│   ├── models/
│   ├── services/
│   └── utils/
└── ...
```

## 🔧 Integración con Cursor

1. **Automática**: Cursor detecta el archivo `.cursorrules` automáticamente
2. **Manual**: Puedes referir a estas reglas en prompts específicos
3. **Personalización**: Edita `.cursorrules` según las necesidades de tu proyecto

## 📚 Recursos Adicionales

- [Documentación completa de reglas](flutter_cursor_rules.md)
- [Ejemplos de código](example_implementations.dart)
- [Guía de estilo de Dart](https://dart.dev/guides/language/effective-dart/style)
- [Mejores prácticas de Flutter](https://flutter.dev/docs/testing)

## 🤝 Contribuir

¿Tienes sugerencias para mejorar estas reglas? 
1. Abre un issue
2. Crea un pull request
3. Comparte tus mejores prácticas

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Úsalo libremente en tus proyectos.

---

**Creado por:** [Isaac Suazo](https://github.com/isaacsuazo7)  
**Repositorio:** https://github.com/isaacsuazo7/flutter-cursor-rules  
**Fecha:** Junio 2025

### 🌟 Si te resulta útil, ¡dale una estrella al repositorio!
