import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const BannerWidget({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 150,
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
              : const AssetImage('assets/images/placeholder.png')
                  as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
