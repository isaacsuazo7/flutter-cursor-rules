// 🎯 Flutter Cursor Rules - Ejemplo Práctico
// Este archivo muestra la implementación correcta de las reglas

import 'package:flutter/material.dart';

// ✅ CORRECTO: StatelessWidget con const constructor
class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        // ✅ CORRECTO: Usar Theme.of(context) en lugar de colores hardcodeados
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              // ✅ CORRECTO: Usar estilos del tema
              style: Theme.of(context).textTheme.labelLarge,
            ),
    );
  }
}

// ✅ CORRECTO: Clase para manejar constantes
class AppConstants {
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  
  static const Duration animationDuration = Duration(milliseconds: 300);
}

// ✅ CORRECTO: Clase para rutas de assets
class AppAssets {
  static const String logo = 'assets/images/logo.png';
  static const String placeholder = 'assets/images/placeholder.png';
}

// ✅ CORRECTO: Widget responsivo con MediaQuery
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isTablet ? AppConstants.largePadding : AppConstants.defaultPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 800 : double.infinity,
          ),
          child: child,
        ),
      ),
    );
  }
}

// ✅ CORRECTO: StatefulWidget con manejo de errores
class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  bool _isLoading = false;
  String? _error;
  List<String> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // ✅ CORRECTO: Manejo de errores async con try-catch
  Future<void> _loadData() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Simular carga de datos
      await Future.delayed(const Duration(seconds: 1));
      
      if (!mounted) return;
      
      setState(() {
        _data = ['Item 1', 'Item 2', 'Item 3'];
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      
      setState(() {
        _error = 'Error loading data: $error';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ExampleButton(
              text: 'Retry',
              onPressed: _loadData,
            ),
          ],
        ),
      );
    }

    // ✅ CORRECTO: ListView.builder para listas dinámicas
    return ListView.builder(
      itemCount: _data.length,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: AppConstants.smallPadding),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(_data[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // ✅ CORRECTO: Usar context inmediatamente
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tapped on ${_data[index]}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ❌ EJEMPLOS INCORRECTOS (NO HACER):

// ❌ INCORRECTO: Función que retorna widget
/*
Widget incorrectButton(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text), // Sin const
  );
}
*/

// ❌ INCORRECTO: Sin const en constructor
/*
class IncorrectWidget extends StatelessWidget {
  IncorrectWidget({Key? key}) : super(key: key); // Sin const ni super.key
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), // Sin const
      child: Text('Hello'), // Sin const
    );
  }
}
*/

// ❌ INCORRECTO: Colores hardcodeados
/*
Container(
  color: Colors.blue, // Debería usar Theme.of(context)
  child: Text(
    'Text',
    style: TextStyle(color: Colors.white), // Debería usar tema
  ),
)
*/
