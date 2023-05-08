import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../common/theme/colors.dart';

const kTextFieldHeight = 46.0;

class BasicTextField extends StatelessWidget {
  const BasicTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.label,
      this.labelWidget,
      this.desc,
      this.prefix,
      this.obscureText,
      this.multiline = false,
      this.keyboardType = TextInputType.text,
      this.onFieldSubmitted,
      this.initialValue,
      this.onChanged,
      this.enabled,
      this.mandatory,
      this.readOnly,
      this.suffixIcon,
      this.hintText,
      this.hintStyle,
      this.textStyle,
      this.focusNode,
      this.fillColor,
      this.border,
      this.prefixIcon,
      this.contentPadding,
      this.onClear,
      this.filled = false})
      : super(key: key);
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? label;
  final Widget? labelWidget;
  final String? desc;
  final String? prefix;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool? obscureText;
  final bool filled;
  final bool multiline;
  final FocusNode? focusNode;
  final Color? fillColor;
  final InputBorder? border;
  final TextInputType keyboardType;
  final Function()? onClear;
  final ValueChanged<String>? onFieldSubmitted;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool? mandatory;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label?.isNotEmpty ?? false)
          Row(
            children: [
              Text(
                label!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (mandatory ?? false) const SizedBox(width: 1),
              if (mandatory ?? false)
                Text('*',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.red)),
              if (desc?.isNotEmpty ?? false) const SizedBox(width: 5),
              if (desc?.isNotEmpty ?? false)
                Text(desc!,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: kGreyColor))
            ],
          ),
        if (labelWidget != null) labelWidget!,
        if ((label?.isNotEmpty ?? false) || (labelWidget != null))
          const SizedBox(height: 10.0),
        SizedBox(
          height: multiline ? 150 : null,
          child: TextFormField(
            controller: controller,
            cursorColor: kGray900,
            validator: validator,
            focusNode: focusNode,
            obscureText: obscureText ?? false,
            keyboardType: multiline ? TextInputType.multiline : keyboardType,
            initialValue: initialValue,
            maxLines: multiline ? null : 1,
            readOnly: readOnly ?? false,
            expands: multiline,
            style: textStyle ?? Theme.of(context).textTheme.headlineSmall,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  contentPadding ?? const EdgeInsets.symmetric(vertical: 8),
              suffixIcon: suffixIcon ??
                  (onClear != null
                      ? GestureDetector(
                          onTap: onClear,
                          child: const SizedBox(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.close_rounded,
                              color: kGray900,
                            ),
                          ),
                        )
                      : null),
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: prefixIcon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: prefixIcon,
                          ),
                        ),
                      ],
                    )
                  : ((prefix?.isNotEmpty ?? false)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Center(
                                child: Text(prefix!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                              ),
                            ),
                          ],
                        )
                      : null),
              filled: filled,
              fillColor: fillColor,
              border: border,
            ),
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            enabled: enabled,
          ),
        )
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      this.backgroundColor,
      this.width,
      this.onChanged,
      this.hintText})
      : super(key: key);
  final Color? backgroundColor;
  final double? width;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kLightGreyColor)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(Icons.search, size: 20, color: Theme.of(context).hintColor),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: hintText ?? ''),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}

class SelectDateTextField extends StatelessWidget {
  const SelectDateTextField({
    Key? key,
    this.label,
    this.desc,
    this.value,
    this.onChanged,
    this.enabled,
    this.width,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.initialValue,
    this.textStyle,
  }) : super(key: key);
  final String? label;
  final String? desc;
  final DateTime? value;
  final Function(DateTime?)? onChanged;
  final bool? enabled;
  final TextStyle? textStyle;
  final double? width;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label?.isNotEmpty ?? false)
          Row(
            children: [
              Text(
                label!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        if (label?.isNotEmpty ?? false) const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: TextFormField(
            onTap: () => _showDatePicker(context),
            readOnly: true,
            controller: controller,
            style: textStyle ?? Theme.of(context).textTheme.headlineSmall,
            validator: validator,
            initialValue: initialValue,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              suffixIcon: Icon(
                Icons.calendar_month,
                size: 28,
              ),
            ),
            enabled: enabled,
          ),
        )
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    try {
      DateTime? result = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: value ?? DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context)
                    .colorScheme
                    .copyWith(primary: Theme.of(context).primaryColor)),
            child: child ?? const SizedBox(),
          );
        },
      );
      onChanged?.call(result);
    } catch (_) {}
  }
}

class SelectTextFieldArg {
  const SelectTextFieldArg({required this.label, required this.value});

  final String label;
  final dynamic value;
}

class SelectTextField extends StatelessWidget {
  const SelectTextField(
      {Key? key,
      this.label,
      this.desc,
      this.value,
      this.onChanged,
      this.enabled,
      required this.items})
      : super(key: key);
  final String? label;
  final String? desc;
  final dynamic value;
  final ValueChanged<String?>? onChanged;
  final bool? enabled;
  final List<SelectTextFieldArg> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label?.isNotEmpty ?? false)
          Row(
            children: [
              Text(
                label!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        if (label?.isNotEmpty ?? false) const SizedBox(height: 10.0),
        Container(
          height: kTextFieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: kLightGreyColor),
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(4)),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(4.0),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 20,
            underline: const SizedBox(),
            value: value,
            onChanged: onChanged,
            items:
                items.map<DropdownMenuItem<String>>((SelectTextFieldArg item) {
              return DropdownMenuItem<String>(
                value: item.value.toString(),
                child: Text(
                  item.label,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class MultiSelectTextField extends StatelessWidget {
  const MultiSelectTextField({
    Key? key,
    this.label,
    this.desc,
    this.onChanged,
    this.enabled,
    required this.items,
    this.width,
    this.backgroundColor,
    this.controller,
    this.validator,
    required this.selected,
  }) : super(key: key);
  final String? label;
  final String? desc;
  final ValueChanged<List<SelectTextFieldArg>?>? onChanged;
  final bool? enabled;
  final List<SelectTextFieldArg> items;
  final double? width;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<dynamic> selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label?.isNotEmpty ?? false)
          Row(
            children: [
              Text(
                label!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        if (label?.isNotEmpty ?? false) const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: TextFormField(
            onTap: () => _showMultiSelect(context),
            readOnly: true,
            controller: controller,
            validator: validator,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              prefixIcon: Icon(Icons.calendar_month, color: Colors.grey),
              filled: true,
              border: InputBorder.none,
            ),
            enabled: enabled,
          ),
        )
      ],
    );
  }

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: items.map((e) => MultiSelectItem(e.value, e.label)).toList(),
          initialValue: selected,
          onConfirm: (values) {},
        );
      },
    );
  }
}
