import 'package:flutter/material.dart';
import 'package:scoped_example/scope_model_wrapper.dart';
import 'package:scoped_example/translation_strings.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: Translations.of(context).username,
                hintText: "user@test.com",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (val) => val.contains("@")
                  ? null
                  : Translations.of(context).not_valid_username,
            ),
            const SizedBox(height: 50.0),
            ScopedModelDescendant<AppModel>(
                builder: (context, child, model) => MaterialButton(
                      onPressed: () {
                        model.changeDirection();
                      },
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
                    ))
          ],
        ),
      ),
    );
  }
}
