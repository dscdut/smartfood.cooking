import 'package:flutter/material.dart';
import 'package:mobile/src/core/config/router.dart';

class ChooseYourMaterial extends StatefulWidget {
  const ChooseYourMaterial({Key? key}) : super(key: key);

  @override
  State<ChooseYourMaterial> createState() => _ChooseYourMaterialState();
}

class _ChooseYourMaterialState extends State<ChooseYourMaterial> {
  final typeMaterialList = [
    "Tất cả",
    "Rau củ",
    "Thịt",
    "Cá",
    "Hoa quả",
    "Hải sản",
    "Gia vị"
  ];
  var selectedTypeList = <bool>[];
  var selectedMaterialList = <bool>[];

  @override
  void initState() {
    selectedTypeList =
        List<bool>.filled(typeMaterialList.length, false, growable: false)
          ..first = true;
    selectedMaterialList = List<bool>.filled(15, false, growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: const Text("Chọn nguyên liệu"),
          titleTextStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 300,
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: "Tủ lạnh bạn hôm nay có gì ?",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 18),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteManager.yourMaterial),
                    child: Container(
                      width: 45,
                      height: 45,
                      color: Colors.grey.shade400,
                      child: const Icon(
                        Icons.visibility_sharp,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: selectedTypeList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ChoiceChip(
                        label: Text(typeMaterialList[index]),
                        selected: selectedTypeList[index],
                        onSelected: (value) => setState(() {
                          if (index == 0 && !selectedTypeList[index]) {
                            selectedTypeList = List<bool>.filled(
                                typeMaterialList.length, false,
                                growable: false)
                              ..first = true;
                          } else if (index != 0) {
                            selectedTypeList[index] = value;
                            selectedTypeList[0] = false;
                          }
                        }),
                        selectedColor: Colors.pink,
                        backgroundColor: Colors.grey,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: selectedMaterialList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        key: ValueKey(index),
                        height: size.height * 0.1,
                        width: size.height * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(
                              'https://i.ytimg.com/vi/Zr-qM5Vrd0g/'
                              'maxresdefault.jpg?x-oss-process=image/resize,m_lfit,h_78,w_140',
                            ).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            focusColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  selectedMaterialList[index] = value;
                                }
                              });
                            },
                            value: selectedMaterialList[index],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 40,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
