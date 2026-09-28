part of 'dialog.dart';

class AppDialog {
  const AppDialog._();

  static AlertDialog build({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    required List<Widget> actions,
  }) {
    return AlertDialog(
      icon: Icon(icon, color: iconColor, size: IconSize.lg),
      title: Text(title),
      content: Text(message, textAlign: .center),
      actionsAlignment: .end,
      actions: actions,
    );
  }
}
