import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({
    Key? key,
    required this.isSelected,
    required this.imageUrl,
    required this.materialName,
    required this.onMaterialTap,
  }) : super(key: key);
  final bool isSelected;
  final String imageUrl;
  final String materialName;
  final VoidCallback onMaterialTap;

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
            height: 100.h,
            width: 100.h,
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
              border: isSelected
                  ? Border.all(
                      width: 2.w,
                      color: Palette.pink500,
                    )
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
                      ),
                      image: DecorationImage(
                        image: Image.network(
                          imageUrl,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0.w,
                      vertical: 3.h,
                    ),
                    child: Center(
                      child: Text(
                        materialName,
                        style: CustomTextTheme.bodyText1.copyWith(
                          color: Palette.gray500,
                          fontSize: 13.sp,
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
            top: 12.h,
            right: 12.w,
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isSelected,
              shape: const CircleBorder(),
              side:
                  const BorderSide(width: 1.5, color: Palette.backgroundColor),
              onChanged: (bool? value) {},
            ),
          ),
        ],
      ),
    );
  }
}
