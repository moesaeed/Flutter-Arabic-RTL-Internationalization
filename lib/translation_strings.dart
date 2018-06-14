import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_example/I10n/messages_all.dart';

class Translations {
  static Future<Translations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translations();
    });
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String get username {
    return Intl.message(
      'Username',
      name: 'username',
    );
  }

  String get not_valid_username {
    return Intl.message(
      'Not Valid Username',
      name: 'not_valid_username',
    );
  }

  String get password {
    return Intl.message(
      'password',
      name: 'password',
    );
  }

  String get password_is_too_short {
    return Intl.message(
      'password is too short',
      name: 'password_is_too_short',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
    );
  }

  String get language {
    return Intl.message(
      'عربي',
      name: 'language',
    );
  }

  String get links {
    return Intl.message(
      'Links',
      name: 'links',
    );
  }

  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
    );
  }

  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
    );
  }

  String get support {
    return Intl.message(
      'Support',
      name: 'support',
    );
  }

  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
    );
  }
}
