import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? ontap;

  const AppButton({super.key, required this.labelText, this.ontap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          color: Colors.white.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
