import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Function onTap;

  const CustomIconButton({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColor.appGrey.withOpacity(0.1)),
        child: icon,
      ),
    );
  }
}
