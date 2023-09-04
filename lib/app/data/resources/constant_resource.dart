//! SIZED BOX SPACING
import 'package:flutter/material.dart';
import 'package:tradetech/app/data/resources/color_resource.dart';

//! SIZED BOX SPACING
const SPACING_VVSMALL_HEIGHT = SizedBox(height: 4);
const SPACING_VSMALL_HEIGHT = SizedBox(height: 8);
const SPACING_SMALL_HEIGHT = SizedBox(height: 15);
const SPACING_MEDIUM_HEIGHT = SizedBox(height: 30);
const SPACING_LARGE_HEIGHT = SizedBox(height: 55);
const SPACING_VLARGE_HEIGHT_150 = SizedBox(height: 150);

const SPACING_VVSMALL_WIDTH = SizedBox(width: 4);
const SPACING_VSMALL_WIDTH = SizedBox(width: 8);
const SPACING_SMALL_WIDTH = SizedBox(width: 15);
const SPACING_MEDIUM_WIDTH = SizedBox(width: 30);
const SPACING_LARGE_WIDTH = SizedBox(width: 55);

const SHOW_NOTHING = SizedBox.shrink();
//! /////////////////////////////////////////////////////

const SPACER = Spacer();
const SPACER_F2 = Spacer(flex: 2);
const SPACER_F3 = Spacer(flex: 3);
const DIVIDER = Divider();

const double INFINITY = double.infinity;

//! TEXT STYLE OMIT HARD-CODING
TextStyle? h1(BuildContext context) {
  return Theme.of(context).textTheme.headline1?.copyWith(fontFamily: 'Brandon');
}

TextStyle? h2_light(BuildContext context) {
  return Theme.of(context).textTheme.headline2?.copyWith(
      fontFamily: 'Brandon',
      fontWeight: FontWeight.normal,
      color: APP_LIGHT_GREY);
}

TextStyle? h2_dark(BuildContext context) {
  return Theme.of(context).textTheme.headline2?.copyWith(fontFamily: 'Brandon');
}

TextStyle? h3_light(BuildContext context) {
  return Theme.of(context).textTheme.headline3?.copyWith(
      fontFamily: 'Brandon',
      fontWeight: FontWeight.normal,
      color: APP_LIGHT_GREY);
}

TextStyle? h3_dark(BuildContext context) {
  return Theme.of(context).textTheme.headline3?.copyWith(fontFamily: 'Brandon');
}

TextStyle? h4_light(BuildContext context) {
  return Theme.of(context).textTheme.headline4?.copyWith(
      fontFamily: 'Brandon',
      fontWeight: FontWeight.normal,
      color: APP_LIGHT_GREY);
}

TextStyle? h4_dark(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .headline4!
      .copyWith(fontSize: 16, fontFamily: 'Brandon');
}

TextStyle? caption(BuildContext context) {
  return Theme.of(context).textTheme.caption;
}

const TextAlign? CENTER_ALIGN = TextAlign.center;
const TextAlign? LEFT_ALIGN = TextAlign.left;
const TextAlign? RIGHT_ALIGN = TextAlign.end;

//? edge insets
const EdgeInsetsGeometry? NO_PADDING = EdgeInsets.zero;
const EdgeInsets PAD_8 = EdgeInsets.all(8.0);
const EdgeInsets PAD_12 = EdgeInsets.all(12.0);
const EdgeInsets PAD_25 = EdgeInsets.all(25.0);
const EdgeInsets PAD_20 = EdgeInsets.all(20.0);

//? Input Decoration
const InputDecoration? DEFAULT_INPUT_DECOR = InputDecoration(
    enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(width: 0.5, color: APP_DARK_GREY), //<-- SEE HERE
));

//? shape border
final ShapeBorder? SHAPE_BORDER_8 = RoundedRectangleBorder(
  side: const BorderSide(color: LIGHT_BLUE),
  borderRadius: BorderRadius.circular(8.0),
);

//? small card edge insets
const EdgeInsets S_CARD_PADDING =
    EdgeInsets.only(bottom: 15, left: 10, right: 10);
const EdgeInsets BIG_CARD_PADDING = EdgeInsets.only(bottom: 15);

//? radius
const Radius RADIUS_8 = Radius.circular(8);

//?
final BorderRadius? BORDER_RADIUS_8 = BorderRadius.circular(8.0);

//? decoration
final Decoration? Box_Decor_8_GREY = BoxDecoration(
    borderRadius: BorderRadius.circular(8.0), color: INPUT_FIELD_GREY);
final Decoration? Box_Decor_12_GREY = BoxDecoration(
    borderRadius: BorderRadius.circular(12.0), color: INPUT_FIELD_GREY);
const Decoration? Box_Decor_12_GREEN = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
    color: APP_MAIN_BLUE);

//? column and row alignment
const CrossAxisAlignment CROSS_AXIS_START = CrossAxisAlignment.start;
const CrossAxisAlignment CROSS_AXIS_CENTER = CrossAxisAlignment.center;
const CrossAxisAlignment CROSS_AXIS_END = CrossAxisAlignment.end;

const MainAxisAlignment MAIN_AXIS_START = MainAxisAlignment.start;
const MainAxisAlignment MAIN_AXIS_CENTER = MainAxisAlignment.center;
const MainAxisAlignment MAIN_AXIS_END = MainAxisAlignment.end;

const MAX = MainAxisSize.max;
const MIN = MainAxisSize.min;

//? Text input fields
const TextInputAction? INPUT_DONE = TextInputAction.done;
const TextInputAction? INPUT_NEXT = TextInputAction.next;
const TextInputAction? INPUT_NEW_LINE = TextInputAction.newline;

const TextInputType? TYPE_NAME = TextInputType.name;
const TextInputType? TYPE_EMAIL = TextInputType.emailAddress;
const TextInputType? TYPE_PHONE = TextInputType.phone;
const TextInputType? TYPE_VISIBLE_PASSWORD = TextInputType.visiblePassword;
const TextInputType? TYPE_ADDRESS = TextInputType.streetAddress;
const TextInputType? TYPE_NUMBER = TextInputType.number;
const TextInputType? TYPE_MULTILINE = TextInputType.multiline;

const TextCapitalization SENTENCE = TextCapitalization.sentences;
const TextCapitalization NONE = TextCapitalization.none;

//? numbers
const double? NUM_1000 = 1000;
const int NUM_500 = 500;
const double? NUM_150 = 150;
const double? NUM_100 = 100;
const double? NUM_55 = 55;
const double? NUM_48 = 48;
const double? NUM_40 = 40;
const double? NUM_25 = 25;
const double? NUM_10 = 10;

//? alignment
const AlignmentGeometry B_CENTER = Alignment.bottomCenter;
const AlignmentGeometry CENTER = Alignment.center;
const Alignment C_TOP_LEFT = Alignment.topLeft;
const Alignment C_TOP_CENTER = Alignment.topCenter;
const Alignment C_TOP_RIGHT = Alignment.topRight;
const Alignment C_CENTER_LEFT = Alignment.centerLeft;
const Alignment C_CENTER_CENTER = Alignment.centerRight;
const Alignment C_CENTER_RIGHT = Alignment.center;
const Alignment C_BOTTOM_LEFT = Alignment.bottomLeft;
const Alignment C_BOTTOM_CENTER = Alignment.bottomCenter;
const Alignment C_BOTTOM_RIGHT = Alignment.bottomRight;

//? animation duration
final Duration FIVE_HUNDRED_MIL = Duration(microseconds: 500);
//! /////////////////////////////////////////////////


