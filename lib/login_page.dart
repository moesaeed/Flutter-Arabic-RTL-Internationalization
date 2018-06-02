import 'package:flutter/material.dart';
import 'package:scoped_example/my_app.dart';
import 'package:scoped_example/scope_model_wrapper.dart';
import 'package:scoped_example/translation_strings.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatelessWidget {
  final LocaleChangeCallback onLocaleChange;

  Login({Key key, this.onLocaleChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(
                top: 30.0, right: 16.0, bottom: 30.0, left: 16.0),
            child: new ListView(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: (100.0)),
                    new Container(
                      width: 200.0,
                      height: 90.0,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new ExactAssetImage("assets/logo.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 120.0),
                    new TextFormField(
                      decoration: InputDecoration(
                        labelText: Translations.of(context).username,
                        hintText: "user@test.com",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val.contains("@")
                          ? null
                          : Translations.of(context).not_valid_username,
                    ),
                    const SizedBox(height: 26.0),
                    ScopedModelDescendant<AppModel>(
                        builder: (context, child, model) => MaterialButton(
                              //elevation: 18.0,
                              onPressed: () {
                                model.changeDirection();

                                onLocaleChange(Locale(model.locale, ""),
                                    model.textDirection);
                              },
//                              minWidth: 1500.0,
                              height: 60.0,
                              color: const Color.fromRGBO(119, 31, 17, 1.0),
                              child: new Text(
                                Translations.of(context).language,
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            )),
                  ],
                )
              ],
            )));
  }
}
