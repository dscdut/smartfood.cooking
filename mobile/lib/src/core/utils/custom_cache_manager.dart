import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const cacheKey = 'image_cached';
  static final customCacheManager = CacheManager(
    Config(
      cacheKey,
      stalePeriod: const Duration(days: 1),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: cacheKey),
      fileService: HttpFileService(),
    ),
  );
}
