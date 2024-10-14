import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const routeName = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackbar = SnackBar(
      content: Text("This is a Snackbar"),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¿Estás seguro?"),
            content: const Text(
                "Aquí se van a mostrar las licencias usadas en este proyecto, ya sean las instaladas por nostros mismos o directamente las propias de Flutter"),
            actions: [
              TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("Cancelar")),
              FilledButton(
                  onPressed: () => showLicensePage(context: context),
                  child: const Text("Aceptar")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and Dialogs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(context: context, children: [
                const Text(
                "Aquí se van a mostrar las licencias usadas en este proyecto, ya sean las instaladas por nostros mismos o directamente las propias de Flutter"),

              ]),
              child: const Text("Licencias Usadas"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar dialogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showSnackBar(context),
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
