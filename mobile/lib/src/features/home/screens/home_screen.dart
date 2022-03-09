import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/home/widgets/diet_mode_card.dart';
import 'package:mobile/src/features/home/widgets/menu_button.dart';
import 'package:mobile/src/features/home/widgets/menu_recipe_card.dart';
import 'package:mobile/src/widgets/no_show_limit_scroll.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final menuData = [
    {
      "name": "Bánh canh",
      "time": "20",
      "level": "Dễ",
      "imageUrl": "https://traicaycaonghe.vn/"
          "wp-content/uploads/2021/07/banh-canh-tuoi-bot-loc-hue-ngon.jpg",
      "isFavorite": false,
    },
    {
      "name": "Phở gà",
      "time": "30",
      "level": "Dễ",
      "imageUrl": "https://img-global.cpcdn.com/recipes/"
          "b711dcb7a259c93c/400x400cq70/photo.jpg",
      "isFavorite": false,
    },
    {
      "name": "Gỏi gà lá chanh chua ngọt",
      "time": "10",
      "level": "Dễ",
      "imageUrl": "https://photo-cms-kienthuc.zadn.vn/"
          "zoom/800/uploaded/hongnhat/2021_01_10/smj-1_MNJT.jpg",
      "isFavorite": true,
    },
    {
      "name": "Cơm tấm",
      "time": "30",
      "level": "Vừa",
      "imageUrl": "https://statics.vinpearl.com/"
          "com-tam-ngon-o-sai-gon-0_1630562640.jpg",
      "isFavorite": true,
    },
    {
      "name": "Mì quảng tôm thịt trứng",
      "time": "30",
      "level": "T.bình",
      "imageUrl": "https://cdn.cet.edu.vn/"
          "wp-content/uploads/2021/04/to-mi-quang.jpg",
      "isFavorite": false,
    },
  ];
  final dietModeData = [
    {
      "modeName": "Eat Clean",
      "joinedCount": "2.5",
      "menu": "3",
      "imageUrl":
          "https://meta.vn/Data/image/2020/05/20/che-do-an-eat-clean-4.jpg"
    },
    {
      "modeName": "cho người béo phì",
      "joinedCount": "1.5",
      "menu": "3",
      "imageUrl":
          "https://meta.vn/Data/image/2020/05/20/che-do-an-eat-clean-4.jpg"
    },
    {
      "modeName": "cho người tập Gym",
      "joinedCount": "6.9",
      "menu": "3",
      "imageUrl":
          "https://meta.vn/Data/image/2020/05/20/che-do-an-eat-clean-4.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoShowLimitScroll(),
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 22.0.h),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Xin chào, A",
                      style: CustomTextTheme.headline1.copyWith(
                        color: Palette.pink500,
                        fontSize: 32.sp,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        "A",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Text(
                  "Hôm nay bạn muốn nấu món gì?",
                  style: CustomTextTheme.headline4.copyWith(
                    color: Palette.gray400,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuButton(
                    menuName: 'Tủ lạnh\nbạn có gì?',
                    onMenuAction: () => Navigator.pushNamed(
                      context,
                      RouteManager.chooseYourMaterial,
                    ),
                    child: SvgPicture.asset(
                      ImagePath.fridgeIcon,
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                  MenuButton(
                    menuName: 'Công thức\nSmartfood',
                    onMenuAction: () {},
                    child: const Icon(
                      PhosphorIcons.forkKnifeBold,
                      color: Palette.yellowStar,
                    ),
                  ),
                  MenuButton(
                    menuName: 'Tạo\nthực đơn',
                    onMenuAction: () {},
                    child: const Icon(
                      PhosphorIcons.calendarPlusBold,
                      color: Palette.infoColor,
                    ),
                  ),
                  MenuButton(
                    menuName: 'Tính\ncalories',
                    onMenuAction: () {},
                    child: const Icon(
                      PhosphorIcons.fireFill,
                      color: Palette.orange500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Text(
                  "Công thức hôm nay",
                  style: CustomTextTheme.headline2.copyWith(
                    color: Palette.pink500,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 220.h,
                child: ScrollConfiguration(
                  behavior: NoShowLimitScroll(),
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 8.h),
                    itemCount: menuData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MenuRecipeCard(
                        imageUrl: menuData[index]["imageUrl"] as String,
                        isFavorite: menuData[index]["isFavorite"] as bool,
                        level: menuData[index]["level"] as String,
                        recipeName: menuData[index]["name"] as String,
                        timeNeed: menuData[index]["time"] as String,
                        onMenuCardAction: () {},
                        onFavoriteAction: () {
                          setState(() {
                            menuData[index]["isFavorite"] =
                                !(menuData[index]["isFavorite"] as bool);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 26.w);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                child: Text(
                  "Chế độ ăn",
                  style: CustomTextTheme.headline2.copyWith(
                    color: Palette.pink500,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 240.h,
                child: ScrollConfiguration(
                  behavior: NoShowLimitScroll(),
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 8.h),
                    itemCount: dietModeData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DietModeCard(
                        imageUrl: dietModeData[index]["imageUrl"] as String,
                        joinedCount:
                            dietModeData[index]["joinedCount"] as String,
                        modeName: dietModeData[index]["modeName"] as String,
                        noMenu: dietModeData[index]["menu"] as String,
                        onTapAction: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 25.w);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





