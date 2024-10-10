import 'package:flutter/material.dart';

PreferredSizeWidget? buildAppBar(
    BuildContext context, String title, bool showBackButton) {
  return (showBackButton)
      ? AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        )
      : AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.black87,
        );
}
