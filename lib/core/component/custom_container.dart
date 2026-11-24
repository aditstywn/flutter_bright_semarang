import 'package:material_ui/material_ui.dart';

import '../style/color/colors_app.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  const CustomContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.border,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? ColorsApp.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 4),
        border: border,
        boxShadow: [
          BoxShadow(
            color: ColorsApp.black.withAlpha(50),
            blurRadius: 2,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: child,
    );
  }
}
