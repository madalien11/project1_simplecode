import 'package:flutter/material.dart';

import '../../../../constants/app_assets.dart';

class ImageProductCard extends StatelessWidget {
  const ImageProductCard({
    Key? key,
    this.url,
  }) : super(key: key);
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: url != null
            ? Image.network(
                url!,
                fit: BoxFit.contain,
              )
            : Image.asset(AppAssets.images.fishIcon),
      ),
    );
  }
}
