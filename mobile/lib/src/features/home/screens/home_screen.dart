import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/constant/image_path.dart';
import 'package:mobile/src/core/theme/custom_text_theme.dart';
import 'package:mobile/src/core/theme/palette.dart';
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

class DietModeCard extends StatelessWidget {
  const DietModeCard(
      {Key? key,
      required this.imageUrl,
      required this.modeName,
      required this.joinedCount,
      required this.noMenu,
      required this.onTapAction})
      : super(key: key);

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
        width: 160.w,
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
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(imageUrl).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              ),
            ),
            SizedBox(height: 5.h),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Text(
                "Chế độ ăn $modeName",
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
                              text: "${joinedCount}k",
                              style: CustomTextTheme.bodyText1.copyWith(
                                color: Palette.pink500,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' người tham gia',
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
                              text: ' thực đơn',
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
      child: Stack(
        children: [
          Container(
            width: 155.w,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                          image: DecorationImage(
                            image: Image.network(
                              imageUrl,
                            ).image,
                            fit: BoxFit.cover,
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
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black54.withOpacity(0.7),
                                  const Color(0xffC4C4C4).withOpacity(0.1),
                                ],
                                stops: const [
                                  0.2,
                                  0.9
                                ]),
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
                      const Spacer(),
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
                        flex: 2,
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
          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              splashRadius: 24.r,
              icon: Stack(
                children: <Widget>[
                  Positioned(
                    left: 1.0,
                    top: 2.0,
                    child: Icon(
                      PhosphorIcons.heartFill,
                      color: Palette.shadowColor.withOpacity(0.08),
                    ),
                  ),
                  const Icon(PhosphorIcons.heartFill)
                ],
              ),
              color: isFavorite ? Palette.orange500 : Palette.backgroundColor,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onFavoriteAction,
            ),
          )
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.child,
    required this.menuName,
    required this.onMenuAction,
  }) : super(key: key);

  final Widget child;
  final String menuName;
  final VoidCallback onMenuAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMenuAction,
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Palette.shadowColor.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: child,
          ),
          Text(
            menuName,
            style: CustomTextTheme.bodyText1.copyWith(
              color: Palette.gray500,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
