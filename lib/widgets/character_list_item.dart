import 'package:flutter/material.dart';
import 'package:rick_and_morty/styles/color_palette.dart';
import 'package:rick_and_morty/styles/text_styles.dart';

class CharacterListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String gender;
  final VoidCallback? onTapHandler;
  final String image;

  const CharacterListItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.gender,
      this.onTapHandler,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTapHandler,
      child: Container(
        height: 85.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ColorPalette.secondary,
        ),
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildAvatar(image: image),
            const SizedBox(width: 12.0),
            _BuildDescription(
              title: title,
              subtitle: subtitle,
              gender: gender,
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildAvatar extends StatelessWidget {
  final String image;

  const _BuildAvatar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 60.0,
      child: CircleAvatar(
        maxRadius: 30.0,
        backgroundImage: Image.network(image).image,
      ),
    );
  }
}

class _BuildDescription extends StatelessWidget {
  final String title;
  final String subtitle;
  final String gender;

  const _BuildDescription(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: ProjectTextStyles.ui_17Regular,
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subtitle,
                    style: ProjectTextStyles.ui_13Regular
                        .copyWith(color: ColorPalette.white.withOpacity(0.5))),
                Text(gender,
                    style: ProjectTextStyles.ui_13Regular
                        .copyWith(color: ColorPalette.white.withOpacity(0.5))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
