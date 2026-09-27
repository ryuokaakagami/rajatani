part of '../field.dart';

class _OtpField extends StatelessWidget {
  final bool isLoading;
  final ValueChanged<String?>? onSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const new({required this.isLoading, this.onSubmitted, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    void handleSubmit(String? value) {
      if (!isLoading) {
        onSubmitted?.call(value);
      }
    }

    return Pinput(
      length: 6,
      onCompleted: handleSubmit,
      onSubmitted: handleSubmit,
      validator: validator,
      controller: controller,
      keyboardType: .number,
      defaultPinTheme: PinTheme(
        width: 56.0,
        height: 56.0,
        textStyle: context.textTheme.bodyLarge,
        decoration: BoxDecoration(
          border: .all(color: context.scheme.stroke),
          borderRadius: .circular(RadiusSize.sm),
          color: context.scheme.surface,
        ),
      ),
    );
  }
}
