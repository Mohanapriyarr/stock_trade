import 'package:flutter/material.dart';

class LocalAssetImage extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final Function()? onTap;
  final BoxFit? boxFit;
  final Color? color;
  const LocalAssetImage(
      {Key? key,
      required this.assetPath,
      this.height,
      this.width,
      this.onTap,
      this.color,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //? precaching an image before showing in the UI
    // precacheImage(Image.asset(assetPath).image, context);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          assetPath,
          color: color,
          fit: boxFit,
          filterQuality: FilterQuality.high,
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          },
          errorBuilder: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
