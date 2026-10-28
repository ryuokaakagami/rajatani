part of 'dialog_x.dart';

class AppDialog {
  const AppDialog._();

  static AlertDialog build({
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

  static AlertDialog buildLoading({String? title, String? message}) {
    return AlertDialog(
      title: Text(title ?? 'Please wait'),
      content: IntrinsicHeight(
        child: AppLoading.withLabel(label: message, spacing: SpacingSize.lg),
      ),
    );
  }
}
