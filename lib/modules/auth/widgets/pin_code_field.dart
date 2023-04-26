import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/theme/colors.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    super.key,
    required this.context,
    required this.fieldWidth,
    required this.fieldHeight,
  });

  final BuildContext context;
  final double fieldWidth;
  final double fieldHeight;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: Theme.of(context).textTheme.headlineMedium,
      length: 4,
      obscuringWidget: const Icon(
        Icons.circle,
        color: kGray900,
      ),
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        fieldWidth: fieldWidth,
        fieldHeight: fieldHeight,
        shape: PinCodeFieldShape.box,
        inactiveFillColor: kGray50,
        selectedColor: kPrimaryColor,
        selectedFillColor: kPrimary100Color,
        activeColor: kGray200,
        borderRadius: BorderRadius.circular(16),
        inactiveColor: kGray200,
        errorBorderColor: kGray200,
        activeFillColor: kGray50,
      ),
      enableActiveFill: true,
      cursorColor: Theme.of(context).colorScheme.primary,
      animationDuration: const Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}
