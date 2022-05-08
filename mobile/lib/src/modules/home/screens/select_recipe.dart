import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/modules/home/widgets/recipe_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SelectRecipe extends StatefulWidget {
  const SelectRecipe({Key? key}) : super(key: key);

  @override
  State<SelectRecipe> createState() => _SelectRecipeState();
}

class _SelectRecipeState extends State<SelectRecipe> {
  late List<Recipe> listFound;

  @override
  void didChangeDependencies() {
    listFound = ModalRoute.of(context)!.settings.arguments as List<Recipe>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressedFunction: () => Navigator.pop(context),
                  ),
                  Text(
                    'Công thức của bạn',
                    style: CustomTextTheme.headline2
                        .copyWith(color: Palette.pink500, fontSize: 26.sp),
                  ),
                  IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      //TODO: impl filter function
                    },
                    icon: const Icon(
                      PhosphorIcons.sliders,
                      size: 32,
                      color: Palette.pink500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: AnimationLimiter(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: listFound.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: FadeInAnimation(
                          child: RecipeCard(recipe: listFound[index]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
