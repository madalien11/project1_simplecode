// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth": MessageLookupByLibrary.simpleMessage("Authorization"),
        "characters": MessageLookupByLibrary.simpleMessage("Characters"),
        "charactersListIsEmpty":
            MessageLookupByLibrary.simpleMessage("Characters were not found"),
        "charactersSearch":
            MessageLookupByLibrary.simpleMessage("Search characters"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "inputErrorCheckLogin":
            MessageLookupByLibrary.simpleMessage("Wrong login"),
        "inputErrorCheckLoginPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong login or password is entered"),
        "inputErrorCheckPassword":
            MessageLookupByLibrary.simpleMessage("Wrong password"),
        "inputLoginAndPassword":
            MessageLookupByLibrary.simpleMessage("Input login and password"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lengthErrorCheckLogin": MessageLookupByLibrary.simpleMessage(
            "Login must contain at least 3 characters"),
        "lengthErrorCheckPassword": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least 8 characters"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "mainScreen": MessageLookupByLibrary.simpleMessage("Main screen"),
        "numberOfCharacters":
            MessageLookupByLibrary.simpleMessage("Total number of characters"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong :-("),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again")
      };
}
