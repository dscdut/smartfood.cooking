import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Palette.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 3),
            color: Palette.shadowColor.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            cacheManager: CustomCacheManager.customCacheManager,
            imageUrl: imageUrl == ''
                ? 'https://www.seriouseats.com/thmb/1Tl-bBEgEnFwD_bSxF4BOWNixPs='
                    '/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__co'
                    'eus__resources__content_migration__serious_eats__seriouseats.com__2020__12__20201203'
                    '-indonesian-pantry-vicky-wasik-1-b827da1c26134cf18153da281f8efb19.jpg'
                : imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.r),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            progressIndicatorBuilder: (context, string, progress) {
              return Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: Palette.orange500,
                  ),
                ),
              );
            },
            errorWidget: (context, string, dymamic) => Container(
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.r),
                ),
              ),
              child: const Center(
                child: Icon(
                  PhosphorIcons.warning,
                  color: Palette.orange500,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.w,
            ),
            child: Text(
              title,
              style: CustomTextTheme.subtitle1.copyWith(
                color: Palette.gray500,
                fontSize: 16.sp,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0.w,
              right: 8.0.w,
              bottom: 5.h,
            ),
            child: Text(
              description,
              style: CustomTextTheme.bodyText4.copyWith(
                color: Palette.gray400,
                fontSize: 12.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
