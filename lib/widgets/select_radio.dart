import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

enum Gender { female, male, other }

extension GenderX on Gender {
  String get subTitle {
    switch (this) {
      case Gender.male:
        return "I am male";
      case Gender.female:
        return "I am female";
      case Gender.other:
        return "Other";
    }
  }

  int get rawValue {
    switch (this) {
      case Gender.male:
        return 0;
      case Gender.female:
        return 1;
      case Gender.other:
        return 2;
    }
  }
}

class SelectGenderField extends StatelessWidget {
  const SelectGenderField({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  final Gender selectedGender;
  final Function(Gender?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: Gender.values
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      e.subTitle,
                      style: Theme.of(context).textTheme.titleMedium!.w600,
                    ),
                    value: e,
                    groupValue: selectedGender,
                    onChanged: onChanged,
                  ),
                  const Divider()
                ],
              ))
          .toList(),
    );
  }
}

class SelectRadioField<T> extends StatelessWidget {
  const SelectRadioField({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.list,
  });
  final List<T> list;
  final T selectedValue;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<T>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(e.toString(),
                        style: Theme.of(context).textTheme.titleMedium!.w600),
                    value: e,
                    groupValue: selectedValue,
                    onChanged: onChanged,
                  ),
                  const Divider()
                ],
              ))
          .toList(),
    );
  }
}

class SelectRadioYesNoField extends StatelessWidget {
  const SelectRadioYesNoField({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });
  final bool selectedValue;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ["Yes", "No"]
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<bool>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(e,
                        style: Theme.of(context).textTheme.titleMedium!.w600),
                    value: e == 'Yes',
                    groupValue: selectedValue,
                    onChanged: (value) {
                      if (selectedValue != value) {
                        onChanged?.call(value);
                      }
                    },
                  ),
                  const Divider()
                ],
              ))
          .toList(),
    );
  }
}
