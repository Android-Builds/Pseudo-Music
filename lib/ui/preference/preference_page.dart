import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/colorpicker.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(MaterialCommunityIcons.palette),
            title: Text(
              'Accent Color',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('Color'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return ColorPickerDialog();
              },
            ),
          ),
          SizedBox(
            width: 200.0,
            child: Divider(
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(MaterialCommunityIcons.navigation),
            title: Text(
              'Navigation',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile<NavBarPrefs>(
            title: const Text('Bottom Drawer'),
            value: NavBarPrefs.bottom,
            groupValue: navpref,
            onChanged: (NavBarPrefs value) {
              setState(() {
                navpref = value;
                uiController.add(usetabbar = false);
                uiController.add(usenavrails = false);
              });
            },
          ),
          RadioListTile<NavBarPrefs>(
            title: const Text('Tabs'),
            value: NavBarPrefs.tab,
            groupValue: navpref,
            onChanged: (NavBarPrefs value) {
              setState(() {
                navpref = value;
                uiController.add(usenavrails = false);
                uiController.add(usetabbar = true);
                print(usetabbar);
              });
            },
          ),
          RadioListTile<NavBarPrefs>(
            title: const Text('Navigation Rails'),
            value: NavBarPrefs.rails,
            groupValue: navpref,
            onChanged: (NavBarPrefs value) {
              setState(() {
                navpref = value;
                uiController.add(usetabbar = false);
                uiController.add(usenavrails = true);
                print(usenavrails);
              });
            },
          ),
        ],
      ),
    );
  }
}
