import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/const/durations.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool selected;
  final Function(bool selected) onSelect;
  final List<String> svgPaths;

  const CustomChip({
    Key? key,
    required this.label,
    required this.color,
    this.width,
    this.margin,
    this.selected = false,
    required this.onSelect,
    this.height,
    required this.svgPaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      width: width,
      height: height,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      duration: Durations.animationNormal,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: selected
            ? (color ?? theme.primaryColor.withOpacity(.12))
            : theme.unselectedWidgetColor.withOpacity(.12),
        borderRadius: BorderRadius.all(Radius.circular(selected ? 25 : 10)),
        border: Border.all(
          color: selected
              ? (color ?? theme.colorScheme!.secondary.withOpacity(.38))
              : theme.colorScheme.onSurface.withOpacity(.38),
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(selected ? 25 : 10)),
        onTap: () => onSelect(!selected),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: svgPaths
                        .map((p) =>
                        AnimatedSwitcher(
                            duration: Durations.animationNormal,
                            child: SvgPicture.asset(
                              p,
                              key: ValueKey('$p$selected'),
                              colorFilter: ColorFilter.mode(
                                selected ? theme.colorScheme.onPrimary : theme
                                    .colorScheme.primary,
                                BlendMode.color,
                              ),
                            )))
                        .toList(),
                  ),
                ),
              ),
              AnimatedSwitcher(duration: Durations.animationNormal,
                  child: Text(label, key: ValueKey('$label$selected'), style: theme.textTheme.labelLarge!.copyWith(
                    color: selected ? theme.colorScheme.onPrimary : theme
                        .colorScheme.onSurface
                  ),)),
        AnimatedSwitcher(duration: Durations.animationNormal,
            child: selected ? Icon(MdiIcons.checkBold, color: theme.colorScheme.onPrimary,) : const SizedBox.shrink()),
            ]
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
