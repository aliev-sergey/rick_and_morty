import 'package:flutter/material.dart';
import 'package:rick_and_morty/styles/color_palette.dart';
import 'package:rick_and_morty/styles/text_styles.dart';

class DescriptionItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const DescriptionItem({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Text(
          title,
          style: ProjectTextStyles.ui_13Regular
              .copyWith(color: ColorPalette.white.withOpacity(0.5)),
        ),
        const SizedBox(height: 2.0),
        Text(
          subtitle,
          style: ProjectTextStyles.ui_17Regular,
        ),
        const SizedBox(height: 12.0),
        Container(
          height: 1.0,
          color: ColorPalette.secondary,
        ),
      ],
    );
  }
}