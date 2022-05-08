import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DynamicHeightPageView extends StatefulWidget {
  final List<Widget> children;
  final PageController pageController;
  final ValueChanged<int>? onPageChanged;
  final int indexCurrentPage;

  const DynamicHeightPageView({
    Key? key,
    required this.children,
    required this.pageController,
    this.onPageChanged,
    required this.indexCurrentPage,
  }) : super(key: key);

  @override
  _DynamicHeightPageViewState createState() => _DynamicHeightPageViewState();
}

class _DynamicHeightPageViewState extends State<DynamicHeightPageView>
    with TickerProviderStateMixin {
  late List<double> listHeigtOfChildren;

  double get _currentHeight => listHeigtOfChildren[widget.indexCurrentPage];

  @override
  void initState() {
    listHeigtOfChildren = widget.children.map((e) => 0.0).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fixedHeight =
        ScreenUtil().screenHeight - 475.h - MediaQuery.of(context).padding.top;
    return SizedBox(
      height: min(fixedHeight, _currentHeight),
      child: PageView.builder(
        controller: widget.pageController,
        itemCount: widget.children.length,
        itemBuilder: (context, index) {
          return OverflowBox(
            minHeight: 0,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: UpdatedSizeWidget(
                  onSizeChange: (Size size) =>
                      setState(() => listHeigtOfChildren[index] = size.height),
                  previousHeight: listHeigtOfChildren[index],
                  child: widget.children[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class UpdatedSizeWidget extends StatelessWidget {
  const UpdatedSizeWidget({
    Key? key,
    required this.child,
    required this.onSizeChange,
    required this.previousHeight,
  }) : super(key: key);

  final Widget child;
  final ValueChanged<Size> onSizeChange;
  final double previousHeight;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => updateSize(context));
    return child;
  }

  void updateSize(BuildContext context) {
    // print("update size call");
    try {
      final currentSize = context.size;
      if (previousHeight != currentSize?.height) {
        onSizeChange(currentSize!);
      }
    } catch (ex) {
      print(ex);
    }
  }
}
