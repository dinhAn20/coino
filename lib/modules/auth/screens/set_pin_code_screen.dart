import 'package:flutter/material.dart';

import '../../../configs/size_config.dart';
import '../widgets/pin_code_field.dart';
import '../widgets/title_with_subtitle_text.dart';

class SetPinCodeScreen extends StatefulWidget {
  const SetPinCodeScreen({super.key});

  @override
  State<SetPinCodeScreen> createState() => _SetPinCodeScreenState();
}

class _SetPinCodeScreenState extends State<SetPinCodeScreen> {
  Size get size => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const TitleWithSubtitleText(
            title: "Set your PIN code 🔐",
            subTitle:
                "Add a PIN to make your account more secure. We may ask for a PIN for every crypto stock transaction.",
          ),
          SizedBox(height: getProportionateScreenHeight(32)),
          const SizedBox(height: 50),
          PinCodeField(
            context: context,
            fieldHeight: 70,
            fieldWidth: (size.width - 84) / 4,
          ),
        ],
      ),
    );
  }
}
