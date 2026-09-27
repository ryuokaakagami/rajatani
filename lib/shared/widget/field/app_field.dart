part of 'field.dart';

class AppField extends StatelessWidget {
  final ValueChanged<String?>? onSubmitted;
  final VoidCallback? onTap;
  final bool isLoading, readOnly, isDefault;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction? inputAction;
  final TextInputType? type;
  final String? hintText, label;
  final int? minLines, maxLines;
  final Widget? prefixIcon, suffixIcon;
  final List<TextInputFormatter>? formatters;

  const new({
    super.key,
    this.onSubmitted,
    this.onTap,
    this.isLoading = false,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.validator,
    this.inputAction,
    this.type,
    this.hintText,
    this.label,
    this.minLines,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.formatters,
  }) : isDefault = true;

  const new otp({
    super.key,
    this.onSubmitted,
    this.isLoading = false,
    this.controller,
    this.validator,
  }) : isDefault = false,
       readOnly = false,
       onTap = null,
       focusNode = null,
       inputAction = null,
       type = null,
       hintText = null,
       label = null,
       minLines = null,
       maxLines = null,
       prefixIcon = null,
       suffixIcon = null,
       formatters = null;

  @override
  Widget build(BuildContext context) {
    if (isDefault) {
      return _DefaultField(
        onSubmitted: onSubmitted,
        onTap: onTap,
        isLoading: isLoading,
        readOnly: readOnly,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        inputAction: inputAction,
        type: type,
        hintText: hintText,
        label: label,
        minLines: minLines,
        maxLines: maxLines,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        formatters: formatters,
      );
    }

    return _OtpField(
      isLoading: isLoading,
      onSubmitted: onSubmitted,
      controller: controller,
      validator: validator,
    );
  }
}
