part of '../field.dart';

class _DefaultField extends StatelessWidget {
  final ValueChanged<String?>? onSubmitted;
  final VoidCallback? onTap;
  final bool isLoading, isDisabled, readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction? inputAction;
  final TextInputType? type;
  final String? hintText, label;
  final int? minLines, maxLines, maxLength;
  final Widget? prefixIcon, suffixIcon;
  final List<TextInputFormatter>? formatters;

  const new({
    this.onSubmitted,
    this.onTap,
    required this.isLoading,
    required this.isDisabled,
    required this.readOnly,
    this.controller,
    this.focusNode,
    this.validator,
    this.inputAction,
    this.type,
    this.hintText,
    this.label,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.formatters,
  });

  @override
  Widget build(BuildContext context) {
    void handleSubmit(String? value) {
      if (!isLoading && !isDisabled) {
        onSubmitted?.call(value);
      }
    }

    final textField = TextFormField(
      onFieldSubmitted: handleSubmit,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      textInputAction: inputAction,
      keyboardType: type,
      style: context.textTheme.bodyLarge,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      readOnly: readOnly,
      inputFormatters: formatters,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: isLoading
            ? SizedBox(width: IconSize.xs, child: AppLoading())
            : suffixIcon,
      ),
    );

    if (label != null) {
      return Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: SpacingSize.md,
        children: [Text(label!), textField],
      );
    }

    return textField;
  }
}
