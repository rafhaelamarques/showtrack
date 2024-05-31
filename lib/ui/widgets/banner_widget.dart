import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final bool useAlt;
  const BannerWidget({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 150,
    this.fit = BoxFit.cover,
    this.useAlt = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: url != ''
              ? NetworkImage(url)
              : useAlt
                  ? const AssetImage('assets/images/placeholder_alt.png')
                      as ImageProvider
                  : const AssetImage('assets/images/placeholder.png')
                      as ImageProvider,
          fit: fit,
        ),
      ),
    );
  }
}
