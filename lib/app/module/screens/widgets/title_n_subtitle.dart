import 'package:flutter/material.dart';

import '../../../data/resources/color_resource.dart';
import '../../../data/resources/constant_resource.dart';

Widget titleNSubtitle(BuildContext context, String title, String subtitle,
        {Color titleColor = APP_DARK_GREY, Color subTitleColor = WHITE}) =>
    SizedBox(
      height: 70,
      width: 100,
      child: Column(
        children: [
          SPACING_SMALL_HEIGHT,
          Text(
            title,
            style: h4_dark(context)?.copyWith(color: titleColor),
          ),
          SPACING_VVSMALL_HEIGHT,
          Expanded(
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: h4_dark(context)?.copyWith(color: subTitleColor),
            ),
          ),
        ],
      ),
    );
