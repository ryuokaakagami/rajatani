part of '../extensions/gender_sheet_x.dart';

class _GenderSheetLayout extends StatelessWidget {
  final Gender? current;

  const new({this.current});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final scheme = context.scheme;

    return Padding(
      padding: const .symmetric(horizontal: SpacingSize.md),
      child: Column(
        mainAxisSize: .min,
        spacing: SpacingSize.lg,
        children: [
          Align(
            alignment: .topCenter,
            child: Column(
              mainAxisSize: .min,
              spacing: SpacingSize.sm,
              children: [
                Text(
                  'Select one',
                  style: textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: .3,
                  child: Divider(color: scheme.onSurfaceVariant),
                ),
              ],
            ),
          ),

          RadioGroup<Gender>(
            groupValue: current,
            onChanged: (g) => Navigator.of(context).pop((value: g)),
            child: Column(
              mainAxisSize: .min,
              children: [
                for (final gender in Gender.values)
                  RadioListTile<Gender>(
                    value: gender,
                    toggleable: true,
                    controlAffinity: .trailing,
                    secondary: Icon(gender.icon, color: gender.color),
                    title: Text(gender.label),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
