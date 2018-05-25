import 'package:flutter/material.dart';
import 'package:scoped_example/my_app.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyApp());
  }
}

class AppModel extends Model {
  TextDirection _textDirection = TextDirection.rtl;
  TextDirection get textDirection => _textDirection ?? TextDirection.rtl;

  String _locale = "ar";
  String get locale => _locale ?? "ar";

  void changeDirection() {
    if (_textDirection == TextDirection.rtl) {
      _textDirection = TextDirection.ltr;
      _locale = "en";
    } else {
      _textDirection = TextDirection.rtl;
      _locale = "ar";
    }
    notifyListeners();
  }
}
