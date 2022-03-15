import 'package:flutter/cupertino.dart';

class ChoiceYourIngredientsProvider with ChangeNotifier {
  // STATIC DATA for Choose Your Material screen
  final List<String> typeMaterialList = <String>[
    "Tất cả",
    "Rau củ",
    "Thịt",
    "Cá",
    "Hoa quả",
    "Hải sản",
    "Gia vị"
  ];
  final List<Map<String, String>> materialData = [
    {
      "name": "Thịt gà",
      "imageUrl": "https://bloganchoi.com/wp-c"
          "ontent/uploads/2018/02/thit-ga.jpg"
    },
    {
      "name": "Thịt bò",
      "imageUrl": "https://photo-cms-kienthuc.zadn.vn/zoom/800/Upl"
          "oaded/hongngan/2020_03_11/a/1_JJRA.jpg"
    },
    {
      "name": "Thịt heo",
      "imageUrl":
          "https://cafefcdn.com/thumb_w/650/203337114487263232/2021/9/28/photo1632"
              "798710845-1632798710943181451693.png"
    },
    {
      "name": "Cà rốt",
      "imageUrl":
          "https://cdn.tgdd.vn/2021/09/CookDish/cach-chon-mua-va-cach-bao-quan-ca-rot"
              "-tuoi-lau-mot-cach-hieu-avt-1200x676-2.jpg"
    },
    {
      "name": "Khoai tây",
      "imageUrl": "https://cdn.tgdd.vn/2021/08/"
          "CookProduct/2-1200x676-4.jpg"
    },
    {
      "name": "Ớt chuông",
      "imageUrl": "https://vinmec-prod.s3.amazonaws.com/images/"
          "20210604_012841_203821_qua-ot-chuong-2.max-1800x1800.jpg"
    },
    {
      "name": "Tôm càng xanh",
      "imageUrl": "https://file.hstatic.net/1000030244/file/"
          "z3091440817595_480c13063b6626426c1483155f8f3841__5___1__b8e3b50ecfa941acb30cc2b498fb6f9e_grande.png"
    },
    {
      "name": "Mực nang",
      "imageUrl": "https://ptaseafood.com/wp-content/"
          "uploads/2021/01/DSC02175-copy-1.jpg"
    },
    {
      "name": "Cá ngừ vây xanh",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/"
          "images?q=tbn:ANd9GcRSBedXOAkdKzmw5vOQ8uwtnY_COJ-q0ItRDQ&usqp=CAU"
    },
    {
      "name": "Cá cam Nhật Bản",
      "imageUrl": "https://bizweb.dktcdn.net/100/274/539/"
          "products/304cartimage01.jpg?v=1511770953700"
    },
    {
      "name": "Cà chua",
      "imageUrl": "http://icdn.dantri.com.vn/"
          "zoom/1200_630/2019/05/18/ca-chua-1558139604071.jpg"
    },
    {
      "name": "Mì Ý",
      "imageUrl": "https://hangngoainhap.net.vn/"
          "upload/images/Linguine-Pasta.jpg"
    },
    {
      "name": "Bún",
      "imageUrl": "https://viorice.com/wp-content/"
          "uploads/2019/04/dai-ly-cung-cap-gao-lam-bun-ngon-chat-luong-gia-re.jpg"
    },
    {
      "name": "Hành lá",
      "imageUrl": "https://vinmec-prod.s3.amazonaws.com/images"
          "/20200719_014811_613311_8-loi-ich-suc-khoe-.max-1800x1800.jpg"
    },
    {
      "name": "Bánh đa phở",
      "imageUrl": "https://cf.shopee.vn/"
          "file/889bb56c8dafe256a5116443f2f69f88"
    },
  ];

  late List<bool> selectedTypeList = <bool>[];

  late List<bool> selectedMaterialList = <bool>[];

  ChoiceYourIngredientsProvider() {
    selectedTypeList =
        List<bool>.filled(typeMaterialList.length, false, growable: false)
          ..first = true;
    selectedMaterialList =
        List<bool>.filled(materialData.length, false, growable: false);
  }

  String countSelectedMaterial() {
    return selectedMaterialList
        .where((element) => element == true)
        .toList()
        .length
        .toString();
  }

  void onTapIngredientsCard(int index) {
    selectedMaterialList[index] = !selectedMaterialList[index];
    notifyListeners();
  }

  void onSelected(bool value, int index) {
    if (index == 0 && !selectedTypeList[index]) {
      selectedTypeList =
          List<bool>.filled(typeMaterialList.length, false, growable: false)
            ..first = true;
    } else if (index != 0) {
      selectedTypeList[index] = value;
      selectedTypeList[0] = false;
    }
    notifyListeners();
  }
}
