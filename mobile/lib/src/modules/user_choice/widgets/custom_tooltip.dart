import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/src/core/theme/palette.dart';

class CustomTooltip extends StatefulWidget {
  const CustomTooltip({super.key, this.child, required this.message});
  final String message;
  final Widget? child;

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip>
    with TickerProviderStateMixin {
  final color = Colors.black.withAlpha(120);
  late GlobalKey key;
  var _offset = const Offset(0, 0);
  // ignore: unused_field
  late Size? _size;
  OverlayEntry? overlayEntry;

  late AnimationController _controller;

  @override
  void initState() {
    key = LabeledGlobalKey(widget.message);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  void getWidgetDetails() {
    final renderBox = key.currentContext!.findRenderObject()! as RenderBox;
    _size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    _offset = offset;
  }

  OverlayEntry _makeOverlay() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: _offset.dy + 30.h,
        left: _offset.dx - 250.w,
        width: 300.w,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.0.w),
                  child: CustomPaint(
                    size: const Size(15, 10),
                    painter: TrianglePainter(),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(right: 10.0.w),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Palette.infoColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.message,
                    style: TextStyle(
                      color: Palette.backgroundColor,
                      fontSize: 14.sp,
                      letterSpacing: 0.15,
                      height: 16.sp / 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      child: widget.child,
      onLongPress: () {
        getWidgetDetails();
        overlayEntry = _makeOverlay();
        Overlay.of(context)!.insert(overlayEntry!);
        _controller.forward();
      },
      onLongPressEnd: (detail) async {
        await Future.delayed(const Duration(milliseconds: 300))
            .then((value) => _controller.reverse());
        await Future.delayed(const Duration(milliseconds: 100))
            .then((value) => overlayEntry!.remove());
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..color = Palette.infoColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2.0, 0)
      ..lineTo(0, size.height + 1)
      ..lineTo(size.width, size.height + 1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
