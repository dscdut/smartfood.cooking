import 'package:flutter/foundation.dart';
import 'package:mobile/src/core/constant/image_path.dart';

class UserChoiceProvider with ChangeNotifier {
  // STATIC DATA for ChooseRegionPage
  List<bool> listCheckChosenRegion = List.filled(3, false);

  // STATIC DATA for ChooseFavoriteFoodPage
  final List<String> listImagePathFavoriteFood = <String>[
    ImagePath.traditionalKoreanFoodImage,
    ImagePath.noodleImage,
    ImagePath.soupImage,
    ImagePath.grilledImage,
    ImagePath.vegetarianDishImage,
    ImagePath.vegetableImage,
    ImagePath.drinkImage,
    ImagePath.cakeImage,
    ImagePath.friedImage
  ];
  final List<String> listNameFavoriteFood = <String>[
    "Lẩu",
    "Bún-Mì-Phở",
    "Cháo",
    "Nướng",
    "Món chay",
    "Rau củ",
    "Thức uống",
    "Bánh ngọt",
    "Chiên"
  ];
  final List<bool> listCheckChosenFavoriteFood = List.filled(9, false);

  // STATIC DATA for DietPage
  final List<String> listNameDiet = <String>[
    "Eat Clean",
    "Keto",
    "Low carb/ Das",
    "Thuần chay",
    "Chế độ ăn cho người béo phì",
    "Chế độ ăn cho người thiếu cân",
    "Không theo chế độ ăn"
  ];
  int currentIndex = 0;

  // STATIC DATA for AllergicFoodPage
  final List<String> listNameAllergicFood = [
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
  List<bool> listCheckChosenAllergicFood = List.filled(9, false);

  void onTapRegionCard(int index) {
    listCheckChosenRegion[index] = !listCheckChosenRegion[index];
    notifyListeners();
  }

  void onTapFavoriteFoodCard(int index) {
    listCheckChosenFavoriteFood[index] = !listCheckChosenFavoriteFood[index];
    notifyListeners();
  }

  void onTapDietItem(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onTapAllergicItem(int index) {
    if (index == listCheckChosenAllergicFood.length - 1) {
      listCheckChosenAllergicFood =
          List.filled(listCheckChosenAllergicFood.length, false)..last = true;
    } else {
      if (listCheckChosenAllergicFood.last) {
        listCheckChosenAllergicFood.last = false;
      }

      listCheckChosenAllergicFood[index] = !listCheckChosenAllergicFood[index];
      if (listCheckChosenAllergicFood.every((element) => element == false)) {
        listCheckChosenAllergicFood =
            List.filled(listCheckChosenAllergicFood.length, false)..last = true;
      }
    }
    notifyListeners();
  }
}
