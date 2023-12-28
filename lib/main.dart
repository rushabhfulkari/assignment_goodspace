import 'package:assignment_goodspace/services/user_signed_in_check.dart';
import 'package:assignment_goodspace/src/dashboard/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'core/utils/constants.dart';
import 'services/get_device_id.dart';
import 'services/scroll_behaviour.dart';
import 'src/authentication/presentation/views/sign_up_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getDeviceId().then((value) {
    deviceId = value;
  });
  checkIfUserIsSignedIn().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return returnScrollConfigation(child);
        },
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins',
        ),
        home: !loggedIn ? const SignUpPage() : const MyNavigationBar());
  }
}
