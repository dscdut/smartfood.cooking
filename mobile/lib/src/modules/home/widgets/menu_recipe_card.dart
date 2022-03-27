import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuRecipeCard extends StatelessWidget {
  const MenuRecipeCard({
    Key? key,
    required this.imageUrl,
    required this.recipeName,
    required this.isFavorite,
    required this.onFavoriteAction,
    required this.onMenuCardAction,
    required this.timeNeed,
    required this.level,
  }) : super(key: key);

  final String imageUrl;
  final String recipeName;
  final bool isFavorite;
  final String timeNeed;
  final String level;
  final VoidCallback onFavoriteAction;
  final VoidCallback onMenuCardAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMenuCardAction,
      child: Container(
        width: 160.w,
        // height: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Palette.shadowColor.withOpacity(0.1),
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    cacheManager: CustomCacheManager.customCacheManager,
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (context, string, progress) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                          color: Palette.backgroundColor,
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
                      child: const Center(
                        child: Icon(
                          PhosphorIcons.warning,
                          color: Palette.orange500,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                        color: Palette.backgroundColor,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black54.withOpacity(0.7),
                            const Color(0xffC4C4C4).withOpacity(0.1),
                          ],
                          stops: const [0.2, 0.9],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          splashRadius: 20,
                          icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(
                                PhosphorIcons.heartFill,
                                size: 26,
                                color: isFavorite
                                    ? Palette.orange500
                                    : Palette.backgroundColor,
                              ),
                            ),
                          ),
                          onPressed: onFavoriteAction,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 75.h,
              // width: 170.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
                color: Palette.backgroundColor,
              ),
              padding: EdgeInsets.only(
                top: 4.h,
                bottom: 6.w,
                left: 8.w,
                right: 8.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    recipeName,
                    style: CustomTextTheme.bodyText1.copyWith(
                      color: Palette.gray500,
                      fontSize: 16.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            PhosphorIcons.clockBold,
                            color: Palette.gray400,
                            size: 18.sp,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            "$timeNeed phút",
                            style: CustomTextTheme.bodyText2.copyWith(
                              color: Palette.gray400,
                              fontSize: 13.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Container(
                        width: 2.w,
                        height: 10.h,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        color: Palette.gray400,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            PhosphorIcons.cookingPotBold,
                            color: Palette.gray400,
                            size: 18.sp,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            level,
                            style: CustomTextTheme.bodyText2.copyWith(
                              color: Palette.gray400,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
