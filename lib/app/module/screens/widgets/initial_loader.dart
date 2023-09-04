import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/resources/color_resource.dart';

class InitialLoader extends StatelessWidget {
  const InitialLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: LoadingAnimationWidget.inkDrop(
          color: APP_MAIN_BLUE,
          size: 30,
        ),
      );
}
