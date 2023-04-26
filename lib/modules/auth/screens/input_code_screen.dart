import 'package:flutter/material.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import '../../../configs/size_config.dart';
import '../../../widgets/button.dart';
import '../widgets/pin_code_field.dart';
import '../widgets/title_with_subtitle_text.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({super.key});

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen> {
  Size get size => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const TitleWithSubtitleText(
                    title: "You’ve got mail 📩",
                    subTitle:
                        "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
                  ),
                  SizedBox(height: getProportionateScreenHeight(32)),
                  const SizedBox(height: 40),
                  PinCodeField(
                    context: context,
                    fieldHeight: 70,
                    fieldWidth: (size.width - 84) / 4,
                  ),
                ],
              ),
            ),
            Text(
              "Didn't receive email?",
              style: Theme.of(context).textTheme.titleMedium!.w500,
            ),
            const SizedBox(height: 16),
            Text(
              "You can resend code in 55 s",
              style: Theme.of(context).textTheme.titleMedium!.w500,
            ),
            const SizedBox(height: 32),
            BasicButton(
              label: "Confirm",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
