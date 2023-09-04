import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/logs/log.dart';
import '../../../data/resources/color_resource.dart';

class CachedNImage extends StatefulWidget {
  final String imagefromNetwork;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? initial;
  final bool isProfile;

  const CachedNImage(
      {Key? key,
      this.initial,
      required this.imagefromNetwork,
      this.width,
      this.height,
      this.isProfile = false,
      required this.fit})
      : super(key: key);

  @override
  State<CachedNImage> createState() => _CachedNImageState();
}

class _CachedNImageState extends State<CachedNImage> {
  final ValueNotifier<int> _networklHasErrorNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    if (!widget.imagefromNetwork.contains('http') ||
        !widget.imagefromNetwork.contains('https')) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: widget.initial == null ? APP_DARK_GREY : APP_MAIN_BLUE,
        child: Center(
          child: Icon(
            widget.initial == null ? Icons.error_outline : Icons.person,
            color: WHITE,
          ),
        ),
      );
    }
    return ValueListenableBuilder(
        valueListenable: _networklHasErrorNotifier,
        builder: (BuildContext context, int count, Widget? child) {
          return CachedNetworkImage(
            httpHeaders: const {
              "Access-Control-Allow-Headers":
                  "Access-Control-Allow-Origin, Accept"
            },
            placeholderFadeInDuration: Duration(microseconds: 500),
            width: widget.width,
            height: widget.height,
            // memCacheWidth: 270,
            // memCacheHeight: 270,
            maxHeightDiskCache: 800,
            maxWidthDiskCache: 800,
            fit: widget.fit,
            imageUrl: widget.imagefromNetwork,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: widget.fit,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Center(
                    child: CircularProgressIndicator(
              color: APP_MAIN_BLUE,
            )),
            errorWidget: (context, url, error) => GestureDetector(
                onTap: () {
                  _networklHasErrorNotifier.value++;
                  setState(() {});
                  Log.info(
                      info:
                          'cached n image - value notifier - ${_networklHasErrorNotifier.value}');
                },
                child: Icon(widget.isProfile
                    ? Icons.person
                    : Icons.image_not_supported_rounded)),
          );
        });
  }
}
