import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/constants/constants.dart';

class TopBarWidget extends StatelessWidget {
  final bool isBack;
  final bool isDark;
  final String? title;
  final Widget? suffix;

  const TopBarWidget({
    super.key,
    this.isBack = true,
    this.isDark = true,
    this.title,
    this.suffix,
  });

  Color getColor() => isDark ? ColorApp.black : ColorApp.white;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            isBack
                ? GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: getColor(),
                    ),
                  )
                : const SizedBox(),
            Gap.w12,
            Text(
              title ?? '',
              style: TypographyApp.headline3.copyWith(
                fontSize: 24,
                color: getColor(),
              ),
            ),
          ],
        ),
        suffix ?? const SizedBox(),
      ],
    );
  }
}
