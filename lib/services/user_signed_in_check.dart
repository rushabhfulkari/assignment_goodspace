import 'package:shared_preferences/shared_preferences.dart';

bool loggedIn = false;
String token = "";

Future<void> checkIfUserIsSignedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  loggedIn = prefs.getBool('loggedIn') ?? false;
  token = prefs.getString('token') ?? '';
}
