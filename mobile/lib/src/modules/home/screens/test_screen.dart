import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/home/controller/ingredient_provider.dart';
import 'package:mobile/src/widgets/loading_circle.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar"),
      ),
      body: Column(
        children: [
          Consumer<IngredientProvider>(builder: (context, provider, child) {
            final status = provider.status;
            if (status == LoadingStatus.loading) {
              return const LoadingCircle();
            } else if (status == LoadingStatus.error) {
              return const Center(
                child: Icon(PhosphorIcons.warning),
              );
            }
            return RefreshIndicator(
              onRefresh: () => provider.getListIngredient(),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: provider.listIngredient.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(provider.listIngredient[index].name),
                    );
                  },
                ),
              ),
            );
          }),
          Container(
            height: 300,
            color: Palette.orange500,
          ),
        ],
      ),
    );
  }
}
