import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? ontap;
  final IconData? icon;

  const MediumButton({
    super.key,
    required this.labelText,
    this.ontap,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.widthOf(context) * 0.5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          color: Colors.white.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            icon != null ? SizedBox(width: 10) : SizedBox(),
            icon != null ? Icon(icon, size: 24) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
