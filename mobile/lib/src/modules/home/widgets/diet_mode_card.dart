import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DietModeCard extends StatelessWidget {
  const DietModeCard({
    super.key,
    required this.imageUrl,
    required this.modeName,
    required this.joinedCount,
    required this.noMenu,
    required this.onTapAction,
  });

  final String imageUrl;
  final String modeName;
  final String joinedCount;
  final String noMenu;
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        width: 170.w,
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
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.r),
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
                      top: Radius.circular(15.r),
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
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.r),
                  ),
                ),
                child: const Icon(
                  PhosphorIcons.warning,
                  color: Palette.orange500,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Text(
                'Ch??? ????? ??n $modeName',
                style: CustomTextTheme.subtitle1.copyWith(
                  color: Palette.gray500,
                  fontSize: 15.sp,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0.w,
                right: 8.0.w,
                bottom: 5.h,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.bookmarkBold,
                        color: Palette.pink500,
                        size: 22.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${joinedCount}k',
                              style: CustomTextTheme.bodyText1.copyWith(
                                color: Palette.pink500,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' ng?????i tham gia',
                              style: CustomTextTheme.bodyText3.copyWith(
                                color: Palette.gray500,
                                fontSize: 14.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.bookBold,
                        color: Palette.pink500,
                        size: 22.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: noMenu,
                              style: CustomTextTheme.bodyText1.copyWith(
                                color: Palette.pink500,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' th???c ????n',
                              style: CustomTextTheme.bodyText3.copyWith(
                                color: Palette.gray500,
                                fontSize: 14.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
