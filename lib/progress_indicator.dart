import 'package:flutter/material.dart';

class ProgressIndicatorView {
  ProgressIndicator linearProgressIndicator() {
    return const LinearProgressIndicator(
      color: Colors.white,
    );
  }

  ProgressIndicator circularProgressIndicator() {
    return const CircularProgressIndicator(
      color: Colors.white,
    );
  }
}
