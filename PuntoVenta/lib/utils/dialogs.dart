import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(0.9),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
