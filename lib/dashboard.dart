import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? password = '';

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getPreference());
  }

  void getPreference() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('password')) {
      password = prefs.getString('password');
      print(password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Dashboard')]),
      ),
    );
  }
}
