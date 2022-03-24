import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: InteractiveViewer(
          child: Center(
            child: Hero(
              tag: imageUrl,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                cacheManager: CustomCacheManager.customCacheManager,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
