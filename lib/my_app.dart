import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_example/login_page.dart';
import 'package:scoped_example/scope_model_wrapper.dart';
import 'package:scoped_example/style.dart';
import 'package:scoped_example/translation.dart';
import 'package:scoped_model/scoped_model.dart';

//callback interface
typedef LocaleChangeCallback = void Function(
    Locale locale, TextDirection textDirection);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecifiedLocalizationDelegate _localeOverrideDelegate;
  TextDirection _textDirection = TextDirection.rtl;

  @override
  void initState() {
    super.initState();

    _localeOverrideDelegate =
        new SpecifiedLocalizationDelegate(const Locale("ar", ""));
  }

  // onLocaleChange Interface implementation
  onLocaleChange(Locale l, TextDirection textDirection) {
    setState(() {
      _localeOverrideDelegate = new SpecifiedLocalizationDelegate(l);
      _textDirection = textDirection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
              localizationsDelegates: [
                _localeOverrideDelegate,
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('ar', ''), // Arabic
                const Locale('en', ''), // English
              ],
              builder: (BuildContext context, Widget child) {
                return Directionality(
                  textDirection: _textDirection,
                  child: child,
                );
              },
              debugShowCheckedModeBanner: false,
              theme: hrTheme,
              title: "Katara Intranet",
              home: new Login(onLocaleChange: onLocaleChange),
            ));
  }
}
