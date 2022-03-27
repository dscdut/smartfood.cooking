import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/core/utils/custom_cache_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    Key? key,
    this.isSelected,
    required this.imageUrl,
    required this.materialName,
    this.onMaterialTap,
    this.onDeleteAction,
  }) : super(key: key);

  final bool? isSelected;
  final String imageUrl;
  final String materialName;
  final VoidCallback? onMaterialTap;
  final VoidCallback? onDeleteAction;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (!states.any(interactiveStates.contains)) {
      return Palette.backgroundColor;
    }
    return Palette.pink500;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMaterialTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 115.h,
            width: 115.h,
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
              border: onDeleteAction == null
                  ? (isSelected!
                      ? Border.all(
                          width: 1.5.w,
                          color: Palette.pink500,
                        )
                      : null)
                  : null,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                  color: Palette.shadowColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: CachedNetworkImage(
                    cacheManager: CustomCacheManager.customCacheManager,
                    imageUrl: imageUrl != ""
                        ? imageUrl
                        : "https://www.seriouseats.com/thmb/1Tl-bBEgEnFwD_bSxF4BOWNixPs="
                            "/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__co"
                            "eus__resources__content_migration__serious_eats__seriouseats.com__2020__12__20201203"
                            "-indonesian-pantry-vicky-wasik-1-b827da1c26134cf18153da281f8efb19.jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.r),
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
                      child: const Center(
                        child: Icon(
                          PhosphorIcons.warning,
                          color: Palette.orange500,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Center(
                      child: Text(
                        materialName,
                        style: CustomTextTheme.bodyText1.copyWith(
                          color: Palette.gray500,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -4.h,
            right: -4.w,
            child: onDeleteAction == null
                ? IgnorePointer(
                    ignoring: true,
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isSelected,
                      shape: const CircleBorder(),
                      side: const BorderSide(
                          width: 1.5, color: Palette.backgroundColor),
                      onChanged: (bool? value) {},
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        splashRadius: 18,
                        icon: Container(
                          decoration: const BoxDecoration(
                            color: Palette.backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fill,
                            child: Icon(
                              PhosphorIcons.xCircleFill,
                              color: Palette.pink500,
                            ),
                          ),
                        ),
                        onPressed: onDeleteAction,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
