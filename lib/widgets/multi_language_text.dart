import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/models/multi_text.dart';
import 'package:trading_app/modules/common/bloc/app_cubit.dart';
import 'package:trading_app/modules/common/bloc/app_state.dart';

class MultiLanguageText extends StatelessWidget {
  const MultiLanguageText(this.multiText,
      {Key? key, this.style, this.space = 10, this.supportRTL = false})
      : super(key: key);
  final TextStyle? style;
  final MultiText? multiText;
  final double space;
  final bool supportRTL;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Directionality(
              textDirection: supportRTL ? TextDirection.rtl : TextDirection.ltr,
              child: Text(
                multiText?.arText ?? '',
                style: style ?? const TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: space,
            ),
            if (multiText?.enText?.isNotEmpty ?? false)
              Text(
                multiText?.enText ?? '',
                style: style ?? const TextStyle(fontSize: 14),
              ),
            if (multiText?.enText?.isNotEmpty ?? false)
              SizedBox(
                height: space,
              ),
            Text(
              multiText?.swText ?? '',
              style: style ?? const TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: space,
            ),
          ],
        );
      },
    );
  }
}
