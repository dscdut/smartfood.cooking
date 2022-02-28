import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/user_choice/widget/item_choice.dart';
import 'package:mobile/src/widgets/custom_back_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserChoiceScreen extends StatefulWidget {
  const UserChoiceScreen({Key? key}) : super(key: key);

  @override
  State<UserChoiceScreen> createState() => _UserChoiceScreenState();
}

class _UserChoiceScreenState extends State<UserChoiceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final PageController pageController;

  @override
  void initState() {
    tabController = TabController(
        vsync: this,
        length: 4,
        animationDuration: const Duration(milliseconds: 300));
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 10.0.h),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  ImagePath.smartfoodLogoSvg,
                  // height: 110.h,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onPressedFunction: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Bỏ qua",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Palette.gray300,
                            fontSize: 22.sp,
                          ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      tabController.index = value;
                    });
                  },
                  children: [
                    DietPage(key: UniqueKey()),
                    DietPage(key: UniqueKey()),
                    DietPage(key: UniqueKey()),
                    const AllergicFood(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (tabController.index + 1 < 4) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // TODO : Navigator to main screen
                  }
                },
                child: Container(
                  width: 120.w,
                  margin: EdgeInsets.only(bottom: 15.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Palette.orange500,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                  child: Text(
                    tabController.index + 1 == 4 ? "Xác nhận" : "Tiếp tục",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Palette.backgroundColor,
                          fontSize: 20.sp,
                        ),
                  ),
                ),
              ),
              Center(
                child: TabPageSelector(
                  controller: tabController,
                  color: Palette.pink100,
                  selectedColor: Palette.pink500,
                  indicatorSize: 10.0.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DietPage extends StatefulWidget {
  const DietPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final listDiet = [
    "Eat Clean",
    "Keto",
    "Low carb/ Das",
    "Thuần chay",
    "Chế độ ăn cho người béo phì",
    "Chế độ ăn cho người thiếu cân",
    "Không theo chế độ ăn"
  ];

  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chế độ ăn",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Palette.gray500,
                fontSize: 32.sp,
              ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listDiet.length,
            itemBuilder: (context, index) {
              return ItemChoice(
                isSelected: currentSelected == index,
                itemTitle: listDiet[index],
                onTapFunction: () {
                  setState(() {
                    currentSelected = index;
                  });
                },
                isNeedHelpTooltip: !(index == listDiet.length - 1),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 18.h);
            },
          ),
        ),
      ],
    );
  }
}

class AllergicFood extends StatefulWidget {
  const AllergicFood({Key? key}) : super(key: key);

  @override
  _AllergicFoodState createState() => _AllergicFoodState();
}

class _AllergicFoodState extends State<AllergicFood> {
  final listAllergicFood = [
    "Sữa bò",
    "Đường Lactose",
    "Trứng",
    "Cá/ Hải sản",
    "Đậu phộng",
    "Đậu tương",
    "Lúa mì",
    "Hạt cây",
    "Không dị ứng"
  ];

  var listSeleted = <bool>[];

  @override
  void initState() {
    listSeleted = List.filled(listAllergicFood.length, false)..first = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Thực phẩm dị ứng",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Palette.gray500,
                    fontSize: 32.sp,
                  ),
            ),
            IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              icon: const Icon(
                PhosphorIcons.magnifyingGlass,
              ),
              onPressed: () {},
              splashRadius: 24.sp,
              color: Palette.gray500,
              iconSize: 32.sp,
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listAllergicFood.length,
            itemBuilder: (context, index) {
              return ItemChoice(
                isSelected: listSeleted[index],
                itemTitle: listAllergicFood[index],
                onTapFunction: () {
                  setState(() {
                    if (index == listAllergicFood.length - 1) {
                      listSeleted = List.filled(listAllergicFood.length, false)
                        ..last = true;
                    } else {
                      if (listSeleted.last) {
                        listSeleted.last = false;
                      }

                      listSeleted[index] = !listSeleted[index];
                      if (listSeleted.every((element) => element == false)) {
                        listSeleted =
                            List.filled(listAllergicFood.length, false)
                              ..last = true;
                      }
                    }
                  });
                },
                isNeedHelpTooltip: false,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.h);
            },
          ),
        ),
      ],
    );
  }
}
