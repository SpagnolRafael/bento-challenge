library molten_navigationbar_flutter;

import 'dart:math';

import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final double barHeight;
  final double domeHeight;
  final double domeWidth;
  final Color? domeCircleColor;
  final double domeCircleSize;
  final EdgeInsets margin;
  final Color? barColor;
  final List<AppNavBarItem> tabs;
  final int selectedIndex;
  final Function(int index) onTabChange;
  final Curve curve;
  final Duration? duration;
  final double borderSize;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const AppBottomNavBar({
    super.key,
    this.barHeight = kBottomNavigationBarHeight,
    this.barColor,
    this.domeHeight = 15.0,
    this.domeWidth = 100,
    this.domeCircleColor,
    this.domeCircleSize = 50.0,
    required this.tabs,
    this.margin = EdgeInsets.zero,
    required this.selectedIndex,
    required this.onTabChange,
    this.duration,
    this.curve = Curves.linear,
    this.borderColor,
    this.borderSize = 0,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final borderRadiuss = borderRadius;

      final Color barColorr =
          (barColor?.withOpacity(1)) ?? Theme.of(context).colorScheme.surface;

      final Color domeCircleColorr = (domeCircleColor?.withOpacity(1)) ??
          Theme.of(context).colorScheme.primary;

      final double tabWidthh =
          (constraints.biggest.width - margin.horizontal) / tabs.length;

      final double domeWidthh = min(domeWidth, tabWidthh);
      return Container(
        height: barHeight + domeHeight,
        margin: margin,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: barHeight,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 219, 219, 219),
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 10)
                ],
                color: barColorr,
                borderRadius: borderRadiuss,
                border: Border.all(
                  width: borderSize,
                  color: (borderColor == null || borderSize < 1)
                      ? barColorr
                      : borderColor!,
                ),
              ),
            ),
            _animatedPositionedDome(
              top: 0,
              tabWidth: tabWidthh,
              domeWidth: domeWidthh,
              domeHeight: domeHeight,
              domeColor:
                  borderSize > 0 ? (borderColor ?? barColorr) : barColorr,
            ),
            _animatedPositionedDome(
              top: borderSize < 1 ? 1 : (borderSize + 0.2),
              tabWidth: tabWidthh,
              domeWidth: domeWidthh,
              domeHeight: domeHeight,
              domeColor: barColorr,
            ),
            AnimatedPositioned(
              top: 0,
              bottom: 14,
              curve: curve,
              duration: duration ?? const Duration(milliseconds: 150),
              left: tabWidthh * selectedIndex,
              width: _normalizeDomeOnEdge(tabWidthh, selectedIndex),
              child: Center(
                child: Container(
                  height: domeCircleSize,
                  decoration: BoxDecoration(
                    color: domeCircleColorr,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            ...tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final isSelected = index == selectedIndex;
              final title = entry.value.title;
              return AnimatedPositioned(
                curve: curve,
                duration: duration ?? const Duration(milliseconds: 150),
                top: isSelected ? 0 : domeHeight,
                bottom: 0,
                left: tabWidthh * index,
                width: _normalizeDomeOnEdge(tabWidthh, index),
                child: Column(
                  children: [
                    Expanded(
                      child: _MoltenTabWrapper(
                        tab: entry.value,
                        onTab: () => onTabChange(index),
                        isSelected: isSelected,
                        circleSize: domeCircleSize,
                      ),
                    ),
                    if (!isSelected && title != null)
                      Text(title,
                          style: AppTextStyle.roboto.copyWith(fontSize: 10))
                    else
                      const SizedBox(height: 12)
                  ],
                ),
              );
            }),
          ],
        ),
      );
    });
  }

  Widget _animatedPositionedDome({
    required double top,
    required double domeWidth,
    required double domeHeight,
    required Color domeColor,
    required double tabWidth,
  }) {
    return AnimatedPositioned(
      curve: curve,
      duration: duration ?? const Duration(milliseconds: 150),
      top: top,
      left: tabWidth * selectedIndex,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 150),
        width: _normalizeDomeOnEdge(tabWidth, selectedIndex),
        child: Center(
          child: _MoltenDome(
            color: domeColor,
            height: domeHeight,
            width: domeWidth,
          ),
        ),
      ),
    );
  }

  double _normalizeDomeOnEdge(double x, int index) {
    double newPos;
    if (index == 0) {
      newPos = x + borderSize;
    } else if (index == tabs.length - 1) {
      newPos = x - borderSize;
    } else {
      newPos = x;
    }

    return newPos;
  }
}

class _MoltenTabWrapper extends StatelessWidget {
  final AppNavBarItem tab;
  final bool isSelected;
  final Function onTab;
  final double circleSize;
  const _MoltenTabWrapper({
    required this.tab,
    required this.isSelected,
    required this.onTab,
    required this.circleSize,
  });
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: isSelected
            ? tab.selectedColor ?? Colors.white
            : tab.unselectedColor ?? Colors.grey,
      ),
      child: SizedBox(
        height: circleSize,
        width: circleSize,
        child: Material(
          shape: const CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent)),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTab(),
            child: tab.icon,
          ),
        ),
      ),
    );
  }
}

class AppNavBarItem {
  final Widget icon;
  final String? title;
  final Color? selectedColor;
  final Color? unselectedColor;
  AppNavBarItem({
    required this.icon,
    this.selectedColor,
    this.title,
    this.unselectedColor,
  });
}

class _MoltenDome extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  const _MoltenDome({
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _DomePainter(color: color),
          size: Size(width, height),
        );
      },
    );
  }
}

class _DomePainter extends CustomPainter {
  final Color color;
  _DomePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
        0, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width * 0.94, size.height, size.width * 0.83,
        size.height * 0.65, size.width * 0.72, size.height * 0.31);
    path.cubicTo(size.width * 0.67, size.height * 0.12, size.width * 0.59,
        size.height * 0.01, size.width * 0.51, 0);
    path.cubicTo(
        size.width * 0.51, 0, size.width * 0.51, 0, size.width * 0.51, 0);
    path.cubicTo(size.width * 0.42, -0.01, size.width * 0.34,
        size.height * 0.11, size.width * 0.27, size.height * 0.31);
    path.cubicTo(size.width * 0.17, size.height * 0.65, size.width * 0.06,
        size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
