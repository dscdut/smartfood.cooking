import 'package:flutter/cupertino.dart';

class RecipeProvider extends ChangeNotifier {
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
    }
  ];

  //TODO: add depedencences
  final listTodayRecipe = List.filled(5, false);
  RecipeProvider();

  void favoriteRecipeAction(int index) {
    listTodayRecipe[index] = !listTodayRecipe[index];
    //TODO: call method from repository to send data action to API
    notifyListeners();
  }
}
