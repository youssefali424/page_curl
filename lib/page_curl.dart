import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_curl/widgets/curl_widget.dart';

class PageCurl extends StatelessWidget {
  final Widget back;
  final Widget front;
  final Size? size;
  final bool vertical;
  final bool debugging;

  PageCurl({
    Key? key,
    required this.back,
    required this.front,
    this.size,
    this.vertical = false,
    this.debugging = false,
  }) : super(key: key);

  Widget _buildWidget(Widget child, Size size) {
    var aspectRatio = size.width / size.height;
    return Transform.rotate(
      angle: pi / 2,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            1.0 / aspectRatio,
            aspectRatio,
            1.0,
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = this.size ?? MediaQuery.of(context).size;
    var aspectRatio = size.width / size.height;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        aspectRatio,
        1.0 / aspectRatio,
        1.0,
      ),
      child: Transform.rotate(
        angle: pi / 2,
        child: Container(
          height: size.height,
          width: size.width,
          child: CurlWidget(
            frontWidget: _buildWidget(front, size),
            backWidget: _buildWidget(back, size),
            size: size,
            vertical: vertical,
            debugging: debugging,
          ),
        ),
      ),
    );
  }
}
