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
          Row(
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
          )
        ],
      ),
    );
  }
}