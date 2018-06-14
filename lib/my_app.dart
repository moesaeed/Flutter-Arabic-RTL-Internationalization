import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_example/login.dart';
import 'package:scoped_example/scope_model_wrapper.dart';
import 'package:scoped_example/style.dart';
import 'package:scoped_example/translation.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
              locale: model.appLocal,
              localizationsDelegates: [
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('ar', ''), // Arabic
                const Locale('en', ''), // English
              ],
              debugShowCheckedModeBanner: false,
              theme: hrTheme,
              title: "Arabic Flutter",
              home: new Login(),
            ));
  }
}
