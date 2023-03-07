import 'package:bec_movie_application/views/helpers/text_style.dart';
import 'package:flutter/material.dart';

class TextWidget {
  static Widget textTitle(String title) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyles.customStyle.fontHeader,
        ),
      );

  static Widget textSubTitle(String title, String sub) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: "$title: ",
            style: TextStyles.defaultStyle.bold.fontTitle,
            children: <TextSpan>[
              TextSpan(text: sub, style: TextStyles.customStyle.fontMedium),
            ],
          ),
        ),
      );
}
