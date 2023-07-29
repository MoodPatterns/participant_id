import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/utils/models/layout_properties.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isActive;
  final ThemeData theme;
  final LayoutProperties layoutProperties;

  const BottomButton({super.key, required this.onPressed, required this.text, required this.isActive, required this.theme, required this.layoutProperties});
  

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding:  EdgeInsets.only(left: layoutProperties.edgeInsets, right: layoutProperties.edgeInsets, bottom: layoutProperties.edgeInsets,),
      child: Row(
        children: [
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: isActive ? theme.primaryColor : Colors.grey,
            ),
            onPressed: isActive ? onPressed : (){
              Get.snackbar('input_missing'.tr(), 'input_data'.tr());
            },
            child: Padding(
              padding: EdgeInsets.all(layoutProperties.edgeInsets/2),
              child: Text(
                text,
                textScaleFactor: layoutProperties.textScalingFactor,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }


}