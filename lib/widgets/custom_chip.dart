import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/const/durations.dart';
import '../utils/models/layout_properties.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final double? width;
  final bool selected;
  final Function(bool selected) onSelect;
  final String svgPath;
  final LayoutProperties layoutProperties;

  const CustomChip({
    super.key,
    required this.label,
    this.width,
    this.selected = false,
    required this.onSelect,
    required this.svgPath, required this.layoutProperties,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: MyDurations.animationNormal,
      margin: EdgeInsets.all(layoutProperties.edgeInsets),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: selected
            ?  theme.primaryColor
            : theme.canvasColor,
        borderRadius: BorderRadius.all(Radius.circular(selected ? 25 : 10)),
        border: Border.all(
          color: selected
              ? theme.colorScheme.secondary.withOpacity(.38)
              : theme.colorScheme.onSurface.withOpacity(.38),
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(selected ? 25 : 10)),
        onTap: () => onSelect(!selected),
        child: Padding(
          padding: EdgeInsets.all(layoutProperties.edgeInsets),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width,
                  height: width,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: AnimatedSwitcher(
                      duration: MyDurations.animationNormal,
                      child: SvgPicture.asset(
                        svgPath,
                        key: ValueKey('$svgPath$selected'),
                        colorFilter: ColorFilter.mode(
                          selected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                          BlendMode.modulate,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                    duration: MyDurations.animationNormal,
                    child: Text(
                      label,
                      textScaler: TextScaler.linear(layoutProperties.textScalingFactor),
                      maxLines: 2,
                      key: ValueKey('$label$selected'),
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: selected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurface),
                    )),
                AnimatedSwitcher(
                    duration: MyDurations.animationNormal,
                    child: selected
                        ? Icon(
                            CupertinoIcons.checkmark_alt,
                            color: theme.colorScheme.onPrimary,
                      size: 20*layoutProperties.textScalingFactor
                          )
                        : const SizedBox.shrink()),
              ]),
        ),

        // Stack(
        //   alignment: Alignment.center,
        //   children: <Widget>[
        //     AnimatedCheckmark(
        //       active: selected,
        //       color: Colors.white,
        //       size: const Size.square(32),
        //       weight: 5,
        //       duration: const Duration(milliseconds: 400),
        //     ),
        //     Positioned(
        //       left: 9,
        //       right: 9,
        //       bottom: 7,
        //       child: Text(
        //         label,
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //         style: TextStyle(
        //           color: selected ? Colors.white : theme.colorScheme.onSurface,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
