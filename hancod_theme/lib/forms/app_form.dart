part of '../forms.dart';

class AppForm<T> extends StatefulWidget {
  const AppForm({
    required this.name,
    super.key,
    this.label,
    this.secondaryLabel,
    this.fieldKey,
    this.initialValue,
    this.validator,
    this.enabled = true,
    this.autovalidateMode,
    this.labelSpacing = 12,
    this.labelStyle,
  });
  final String name;
  final String? secondaryLabel;
  final String? label;
  final dynamic initialValue;
  final bool enabled;
  final double labelSpacing;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? labelStyle;
  // ignore: strict_raw_type
  final GlobalKey<FormBuilderFieldState>? fieldKey;

  Widget buildContainer(BuildContext context, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(label!, style: labelStyle),
          SizedBox(height: labelSpacing),
        ],
        child,
      ],
    );
  }

  @override
  State<AppForm<T>> createState() => _AppFormState();
}

class _AppFormState<T> extends State<AppForm<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.buildContainer(context, const SizedBox());
  }
}
