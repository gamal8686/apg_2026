import 'dart:async';

import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

goTo(Widget page, {bool canPop = false, int? delayDuration}) {
  void action() {
    Navigator.push(
      navKey.currentContext!,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  if (delayDuration != null) {
    Timer(Duration(seconds: delayDuration), () {
      action();
    });
  } else {
    action();
  }
}

showMessage(String? text, {bool isError = false}) {
  if (text == null || text.isEmpty) return;
  final context = navKey.currentContext;

  if (context == null) return;
   ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: isError ?  Colors.red :Theme.of(context).primaryColor.withValues(alpha: .70),
      content: Text(text),
      duration: Duration(seconds: 4),
    ),
  );
}
