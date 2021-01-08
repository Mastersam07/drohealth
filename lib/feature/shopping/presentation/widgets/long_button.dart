import 'package:flutter/material.dart';

class CustomLongButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color color;
  final Widget icon;
  final Color labelColor;
  final double borderRadius;
  const CustomLongButton(
      {@required this.label,
      @required this.onTap,
      this.color,
      this.labelColor,
      this.borderRadius,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(
        height: 60,
        width: double.infinity,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        onPressed: onTap,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    label ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: labelColor ?? Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            : Text(
                label ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: labelColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
