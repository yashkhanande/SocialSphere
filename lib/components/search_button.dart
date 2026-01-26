import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        color: Colors.white.withValues(alpha: 0.1),
      ),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
    );
  }
}
