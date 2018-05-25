import 'package:flutter/material.dart';
import 'package:scoped_example/my_app.dart';
import 'package:scoped_example/scope_model_wrapper.dart';
import 'package:scoped_example/translation_strings.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatelessWidget {
  final LocaleChangeCallback onLocaleChange;

  String _username;
  String _password;

  Login({Key key, this.onLocaleChange}) : super(key: key);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
                top: 30.0, right: 16.0, bottom: 30.0, left: 16.0),
            child: new ListView(
              children: <Widget>[
                new Form(
                    key: _formKey,
                    child: new Column(
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
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        const SizedBox(height: 120.0),
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: Translations.of(context).username,
                            hintText: "user@katara.net",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => val.contains("@")
                              ? null
                              : Translations.of(context).not_valid_username,
                          onSaved: (val) => _username = val,
                        ),
                        const SizedBox(height: 16.0),
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: Translations.of(context).password,
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? Translations.of(context).password_is_too_short
                              : null,
                          onSaved: (val) => _password = val,
                        ),
                        const SizedBox(height: 26.0),
                        new MaterialButton(
                          onPressed: () {
                            _submit(context);
                          },
                          minWidth: 1500.0,
                          height: 60.0,
                          elevation: 0.0,
                          color: const Color.fromRGBO(119, 31, 17, 1.0),
                          child: new Text(
                            Translations.of(context).login,
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          ),
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
                                  minWidth: 1500.0,
                                  height: 60.0,
                                  color: Colors.white,
                                  child: new Text(
                                    Translations.of(context).language,
                                    style: new TextStyle(
                                      color: const Color.fromRGBO(
                                          119, 31, 17, 1.0),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                )),
                      ],
                    ))
              ],
            )));
  }

  _submit(BuildContext context) {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() {
    print("Username: $_username && password: $_password");
  }
}
