part of '../extensions/birthday_sheet_x.dart';

class BirthdaySheetLayout extends StatelessWidget {
  final DateTime? current;

  const new({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final initial = current ?? DateTime(now.year - 18, now.month, now.day);
    DateTime? selected = current;

    return Padding(
      padding: const .fromLTRB(
        SpacingSize.xl,
        .0,
        SpacingSize.xl,
        SpacingSize.xl,
      ),
      child: Column(
        mainAxisSize: .min,
        spacing: SpacingSize.lg,
        children: [
          SizedBox(
            height: 300.0,
            child: CalendarDatePicker(
              initialDate: initial,
              firstDate: DateTime(1900),
              lastDate: now,
              initialCalendarMode: .year,
              onDateChanged: (date) => selected = date,
            ),
          ),

          AppButton(
            onPressed: () => Navigator.of(context).pop(selected),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
