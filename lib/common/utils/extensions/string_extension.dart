import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html_unescape/html_unescape.dart';

extension ConvertToImage on String {
  Widget toSvg({
    BuildContext? context,
    double? width,
    double? height,
    double padding = 0,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        this,
        width: width,
        height: height ?? width,
        color: color,
        cacheColorFilter: true,
      ),
    );
  }

  AssetImage toImage({
    double? width,
    double? height,
  }) {
    return AssetImage(this);
  }
}

extension HtmlUnescapeString on String {
  String toUnescape() {
    var unescape = HtmlUnescape();
    return unescape.convert(this);
  }
}
