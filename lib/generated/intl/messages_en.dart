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

  static String m0(email) => "Email: ${email}";

  static String m1(name) => "Name: ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "changeTheCamera":
            MessageLookupByLibrary.simpleMessage("Change the Camera"),
        "dataResultcode":
            MessageLookupByLibrary.simpleMessage("Data: {result.code}"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailEmail": m0,
        "loading": MessageLookupByLibrary.simpleMessage("loading"),
        "logIn": MessageLookupByLibrary.simpleMessage(" Log In"),
        "longRoad": MessageLookupByLibrary.simpleMessage("Long Road"),
        "market": MessageLookupByLibrary.simpleMessage("Market"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameName": m1,
        "noPermission": MessageLookupByLibrary.simpleMessage("No Permission"),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "qr": MessageLookupByLibrary.simpleMessage("QR"),
        "qrScanner": MessageLookupByLibrary.simpleMessage("QR Scanner"),
        "registerNow": MessageLookupByLibrary.simpleMessage(" Register now"),
        "resume": MessageLookupByLibrary.simpleMessage("resume"),
        "scanACode": MessageLookupByLibrary.simpleMessage("Scan a code"),
        "scanAgain": MessageLookupByLibrary.simpleMessage("Scan Again"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "stories": MessageLookupByLibrary.simpleMessage("Stories"),
        "urbanCity": MessageLookupByLibrary.simpleMessage("Urban City"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage(
            "Welcome back, we missed You!"),
        "welcomeLetsGo": MessageLookupByLibrary.simpleMessage(
            "Welcome, let\\\'s get started!")
      };
}
