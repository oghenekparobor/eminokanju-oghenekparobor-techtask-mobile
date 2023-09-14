import 'package:flutter/material.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void toggleLoader() {
    setState(() => _isLoading = !_isLoading);
  }
}
