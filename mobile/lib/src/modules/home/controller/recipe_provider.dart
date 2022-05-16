import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';
import 'package:mobile/src/core/helpers/show_loading_dialog.dart';
import 'package:mobile/src/data/model/recipe/recipe.dart';
import 'package:mobile/src/data/repositories/recipe_repository.dart';

enum SearchStatus { loading, idle, error }
enum DataLoadingStatus { loading, idle, error }

class RecipeProvider extends ChangeNotifier {
  RecipeProvider({
    required this.recipeRepository,
  });

  final menuData = [
    {
      'name': 'Bánh canh',
      'time': '20',
      'level': 'Dễ',
      'imageUrl': 'https://traicaycaonghe.vn/'
          'wp-content/uploads/2021/07/banh-canh-tuoi-bot-loc-hue-ngon.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Phở gà',
      'time': '30',
      'level': 'Dễ',
      'imageUrl': 'https://img-global.cpcdn.com/recipes/'
          'b711dcb7a259c93c/400x400cq70/photo.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Gỏi gà lá chanh chua ngọt',
      'time': '10',
      'level': 'Dễ',
      'imageUrl': 'https://photo-cms-kienthuc.zadn.vn/'
          'zoom/800/uploaded/hongnhat/2021_01_10/smj-1_MNJT.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Cơm tấm',
      'time': '30',
      'level': 'Vừa',
      'imageUrl': 'https://statics.vinpearl.com/'
          'com-tam-ngon-o-sai-gon-0_1630562640.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Mì quảng tôm thịt trứng',
      'time': '30',
      'level': 'T.bình',
      'imageUrl': 'https://cdn.cet.edu.vn/'
          'wp-content/uploads/2021/04/to-mi-quang.jpg',
      'isFavorite': false,
    },
  ];
  final dietModeData = [
    {
      'modeName': 'Eat Clean',
      'joinedCount': '2.5',
      'menu': '3',
      'imageUrl':
          'https://meta.vn/Data/image/2020/05/20/che-do-an-eat-clean-4.jpg'
    },
    {
      'modeName': 'cho người béo phì',
      'joinedCount': '1.5',
      'menu': '3',
      'imageUrl':
          'https://omron-yte.com.vn/wp-content/uploads/2014/11/giam-can-e1491808919423.jpg'
    },
    {
      'modeName': 'cho người tập Gym',
      'joinedCount': '6.9',
      'menu': '3',
      'imageUrl':
          'https://www.elleman.vn/wp-content/uploads/2018/03/20/an-uong-khoa-hoc-elle-man-feature.jpg'
    }
  ];

  final List<Map<String, String>> newsData = [
    {
      'imageUrl':
          'https://image.thanhnien.vn/w660/Uploaded/2022/bfznsfyr.bn/2019_11_11/sx/1_bulo.jpg',
      'newsTitle': 'Nên ăn gì khi bị Covid-19',
      'description':
          'F0 sau thời gian điều trị COVID-19 có nguy cơ bị suy dinh dưỡng ở các mức độ khác nhau khiến cơ thể bị úng ba la xi bùa'
    },
    {
      'imageUrl':
          'https://genvita.vn/-/media/genvita/articles/desktops/uong-nuoc-ep-can-tay-feature.ashx?w=1920&h=1080&useCustomFunctions=1&centerCrop=1&hash=73BFF59106DA8D5A4E15A413BED817B52BD2A429',
      'newsTitle': 'Tác dụng của nước ép cần tây',
      'description':
          'Nước ép cần tây không chỉ là thức uống giảm cân mà còn mang lại nhiều lợi ích cho da và tóc. Tác dụng ...'
    },
    {
      'imageUrl':
          'https://cdn.chiaki.vn/unsafe/0x800/left/top/smart/filters:quality(75)/https://chiaki.vn/upload/news/2021/05/thuc-don-giam-mo-bung-duoi-cho-nu-an-toan-17052021161539.jpg',
      'newsTitle': 'Nên ăn gì để giảm mỡ bụng',
      'description': 'Nên ăn gì để có thể giảm mỡ bung, giữ vóng dáng đẹp...'
    }
  ];

  final RecipeRepository recipeRepository;
  final listTodayRecipe = List.filled(5, false);
  DataLoadingStatus loadingData = DataLoadingStatus.idle;

  void favoriteRecipeAction(int index) {
    listTodayRecipe[index] = !listTodayRecipe[index];
    //TODO: call method from repository to send data action to API
    notifyListeners();
  }

  Future<void> findRecipe(
    BuildContext context, {
    required Map<int, bool?> data,
    bool isInSelectedScreen = false,
  }) async {
    try {
      final listId = <int>[];
      data.forEach(
        (key, value) {
          if (value == true) {
            listId.add(key);
          }
        },
      );
      showLoadingDialog(context, contentDialog: 'Đang tìm kiếm món ăn');
      await recipeRepository.getRecipesByIngredients(listId).then((recipes) {
        Navigator.pop(context);
        if (recipes.isEmpty) {
          Navigator.pushNamed(
            context,
            RouteManager.notFound,
          );
        } else {
          isInSelectedScreen
              ? Navigator.popAndPushNamed(
                  context,
                  RouteManager.selectRecipe,
                  arguments: recipes,
                )
              : Navigator.pushNamed(
                  context,
                  RouteManager.selectRecipe,
                  arguments: recipes,
                );
        }
      });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error to finding'),
        ),
      );
    }
  }

  Future<Recipe?> getDataRecipeById(
    BuildContext context, {
    required int id,
  }) async {
    try {
      showLoadingDialog(
        context,
        contentDialog: 'Đang lấy dữ liệu món ăn',
      );
      await recipeRepository.getRecipeById(id).then((data) {
        Navigator.pop(context);
        return data;
      });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lấy dữ liệu món ăn không thành công'),
        ),
      );
    }
    return null;
  }
}
