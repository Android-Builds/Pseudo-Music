import 'package:flutter/material.dart';
import 'package:pseudomusic/utils/variables.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Use Navigation Rails'),
                Spacer(),
                Switch(
                  value: usenavrails,
                  onChanged: (value) {
                    setState(() {
                      uiController.add(usenavrails = value);
                      print(usenavrails);
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Use TabBar'),
                Spacer(),
                Switch(
                  value: usetabbar,
                  onChanged: (value) {
                    setState(() {
                      uiController.add(usetabbar = value);
                      print(usetabbar);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
