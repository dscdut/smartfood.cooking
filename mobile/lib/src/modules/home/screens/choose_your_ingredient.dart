import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/helpers/debounce.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/di/injector.dart';
import 'package:mobile/src/modules/home/controller/choice_your_ingredients_provider.dart';
import 'package:mobile/src/modules/home/controller/recipe_provider.dart';
import 'package:mobile/src/modules/home/screens/selected_ingredient_screen.dart';
import 'package:mobile/src/modules/home/widgets/ingredient_card.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:mobile/src/widgets/error_message.dart';
import 'package:mobile/src/widgets/loading_circle.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ChooseYourIngredient extends StatefulWidget {
  const ChooseYourIngredient({super.key});

  @override
  State<ChooseYourIngredient> createState() => _ChooseYourIngredientState();
}

class _ChooseYourIngredientState extends State<ChooseYourIngredient> {
  late final ScrollController _scrollController;
  late final ChoiceYourIngredientsProvider _choiceYourIngredientsProvider;
  late final Debounce _debounceLoadMore;
  late final Debounce _debounceUserInput;

  final List<String> typeMaterialList = <String>[
    'Tất cả',
    'Thịt',
    'Thủy sản',
    'Rau củ quả',
    'Trứng',
    'Sữa',
    'Gia vị',
    'Hạt',
    'Thực phẩm chế biến',
    'Gạo, bột, đồ khô',
    'Nước',
    'Nội tạng',
    'Khác',
  ];
  @override
  void initState() {
    _scrollController = ScrollController();
    _choiceYourIngredientsProvider = getIt<ChoiceYourIngredientsProvider>();
    _debounceLoadMore = Debounce(const Duration(milliseconds: 300));
    _debounceUserInput = Debounce(const Duration(milliseconds: 700));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _debounceLoadMore(() async {
          if (_choiceYourIngredientsProvider.filterDataMode ==
              FilterDataMode.none) {
            await _choiceYourIngredientsProvider.loadMoreAllIngredientData();
          } else if (_choiceYourIngredientsProvider.filterDataMode ==
              FilterDataMode.chip) {
            final index =
                _choiceYourIngredientsProvider.selectedTypeList.indexOf(
              _choiceYourIngredientsProvider.selectedTypeList
                  .firstWhere((element) => element == true),
            );
            await _choiceYourIngredientsProvider
                .loadMoreIngredientsDataByCategory(index);
          } else {
            await _choiceYourIngredientsProvider.loadingDataMoreBySearch();
          }
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounceLoadMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _choiceYourIngredientsProvider,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20.0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Chọn nguyên liệu',
                        style: CustomTextTheme.headline2
                            .copyWith(color: Palette.pink500, fontSize: 26.sp),
                      ),
                      IconButton(
                        splashRadius: 28.r,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.only(right: 5.w),
                        icon: Consumer<ChoiceYourIngredientsProvider>(
                          builder: (context, provider, child) {
                            return Badge(
                              badgeColor: Palette.pink500,
                              badgeContent: Text(
                                provider.countSelectedMaterial(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              animationType: BadgeAnimationType.scale,
                              position: BadgePosition.topEnd(
                                top: -10.h,
                                end: -10.h,
                              ),
                              child: Icon(
                                Icons.kitchen_rounded,
                                size: 32.sp,
                                color: Palette.pink500,
                              ),
                            );
                          },
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _choiceYourIngredientsProvider,
                              child: const SelectedIngredientScreen(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 280.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Palette.shadowColor.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: TextField(
                          controller: _choiceYourIngredientsProvider
                              .searchEditingController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(left: 14.w),
                            border: InputBorder.none,
                            hintText: 'Tủ lạnh bạn hôm nay có gì!',
                            hintStyle: CustomTextTheme.headline4
                                .copyWith(color: Palette.gray300),
                            suffixIcon: Consumer<ChoiceYourIngredientsProvider>(
                              builder: (context, provider, child) {
                                if (provider
                                    .searchEditingController.text.isEmpty) {
                                  return const Icon(
                                    PhosphorIcons.magnifyingGlass,
                                    color: Palette.gray400,
                                  );
                                } else {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(12.r),
                                    onTap: () => provider.clearSearch(),
                                    child: const Icon(
                                      PhosphorIcons.xBold,
                                      color: Palette.orange400,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          onChanged: (value) {
                            _debounceUserInput(() {
                              _choiceYourIngredientsProvider
                                  .onSearchWithValue();
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        splashRadius: 28.r,
                        icon: const Icon(PhosphorIcons.scan),
                        color: Palette.orange500,
                        iconSize: 36.sp,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    itemCount: typeMaterialList.length,
                    itemBuilder: (context, index) {
                      return Consumer<ChoiceYourIngredientsProvider>(
                        builder: (_, provider, __) {
                          return ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: Text(typeMaterialList[index]),
                            labelStyle: CustomTextTheme.subtitle1.copyWith(
                              color: provider.selectedTypeList[index]
                                  ? Colors.white
                                  : Palette.gray500,
                            ),
                            selected: provider.selectedTypeList[index],
                            onSelected: (value) => provider.onSelected(index),
                            selectedColor: Palette.pink500,
                            backgroundColor: Palette.backgroundColor,
                            elevation: 2,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 12.w);
                    },
                  ),
                ),
                Expanded(
                  child: Consumer<ChoiceYourIngredientsProvider>(
                    builder: (_, provider, __) {
                      final status = provider.status;
                      final searchStatus = provider.searchStatus;
                      if (searchStatus == SearchLoadingStatus.loading) {
                        return const LoadingCircle(
                          content: 'Đang tìm kiếm',
                        );
                      } else if (searchStatus == SearchLoadingStatus.error) {
                        return const ErrorMessage(
                          content: 'Không tìm thấy nguyên liệu',
                        );
                      } else if (status == LoadingStatus.loading) {
                        return const LoadingCircle(
                          content: 'Đang tải nguyên liệu',
                        );
                      } else if (status == LoadingStatus.error) {
                        return const ErrorMessage(
                          content: 'Đã có lỗi xảy ra, vui lòng thử lại!',
                        );
                      } else {
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          controller: _scrollController,
                          itemCount: provider.ingredientFilterData.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                          ),
                          itemBuilder: (context, index) {
                            return IngredientCard(
                              imageUrl: provider.ingredientFilterData
                                  .elementAt(index)
                                  .url!,
                              materialName: provider.ingredientFilterData
                                  .elementAt(index)
                                  .name,
                              isSelected: provider.selectedData[provider
                                  .ingredientFilterData
                                  .elementAt(index)
                                  .id]!,
                              onMaterialTap: () =>
                                  provider.onTapIngredientsCard(
                                index,
                                provider.ingredientFilterData
                                    .elementAt(index)
                                    .id!,
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Consumer<ChoiceYourIngredientsProvider>(
                  builder: (context, provider, child) {
                    return provider.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Palette.pink500,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
                Consumer<ChoiceYourIngredientsProvider>(
                  builder: (context, provider, child) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 18.h,
                          bottom: 24.h,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () {
                            if (provider.selectedData.values
                                .where((element) => element == true)
                                .toList()
                                .isNotEmpty) {
                              context.read<RecipeProvider>().findRecipe(
                                    context,
                                    data: provider.selectedData,
                                  );
                            }
                          },
                          child: Ink(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: !provider.selectedData.values
                                      .where((element) => element == true)
                                      .toList()
                                      .isNotEmpty
                                  ? Palette.orange300
                                  : Palette.orange500,
                            ),
                            child: Text(
                              "Tiếp tục ${provider.countSelectedMaterial() == "0" ? "" : "(${provider.countSelectedMaterial()})"}",
                              style: CustomTextTheme.headline4.copyWith(
                                color: Palette.backgroundColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
