import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/helpers/show_loading_dialog.dart';
import 'package:mobile/src/data/repositories/recipe_repository.dart';

enum SearchStatus { loading, idle, error }

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

  final RecipeRepository recipeRepository;
  final listTodayRecipe = List.filled(5, false);
  RecipeProvider({required this.recipeRepository});

  void favoriteRecipeAction(int index) {
    listTodayRecipe[index] = !listTodayRecipe[index];
    //TODO: call method from repository to send data action to API
    notifyListeners();
  }

  Future<void> findRecipe(BuildContext context,
      {required List<int> listId}) async {
    try {
      showLoadingDialog(context, contentDialog: "Đang tìm kiếm món ăn");
      await recipeRepository.getRecipesByIngredients(listId).then((recipes) {
        Navigator.pop(context);
        if (recipes.isEmpty) {
          Navigator.pushNamed(
            context,
            RouteManager.notFound,
          );
        } else {
          Navigator.pushNamed(context, RouteManager.selectRecipe,
              arguments: recipes);
        }
      });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error to finding"),
        ),
      );
    }
  }
}
