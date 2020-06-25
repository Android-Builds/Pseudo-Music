import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/utils/constants.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/colorpicker.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  Color color;

  @override
  void initState() {
    super.initState();
    listdiscoController = new StreamController();
  }

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            dense: true,
            leading: Icon(
              MaterialCommunityIcons.palette,
              size: 20.0,
              color: color,
            ),
            title: Text(
              'Accent Color',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 70.0),
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
            dense: true,
            leading: Icon(
              MaterialCommunityIcons.navigation,
              color: color,
              size: 20.0,
            ),
            title: Text(
              'Navigation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile<NavBarPrefs>(
            activeColor: color,
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
            activeColor: color,
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
            activeColor: color,
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
          SizedBox(
            width: 200.0,
            child: Divider(
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              MaterialCommunityIcons.lightbulb,
              size: 20.0,
              color: color,
            ),
            title: Text(
              'Disco',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Disco Mode'),
            value: disco,
            onChanged: (value) {
              setState(() {
                disco = value;
                listdiscoController.add(discomode);
              });
            },
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Unison'),
            value: DiscoModes.unison,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                      listdiscoController.add(discomode);
                    });
                  }
                : null,
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Random'),
            value: DiscoModes.random,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                      listdiscoController.add(discomode);
                    });
                  }
                : null,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30.0),
            enabled: disco,
            dense: true,
            title: Text(
              'Mode Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Unison'),
            value: DiscoModes.unison,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                    });
                  }
                : null,
          ),
          RadioListTile<DiscoModes>(
            title: const Text('Random'),
            value: DiscoModes.random,
            groupValue: discomode,
            onChanged: disco
                ? (DiscoModes value) {
                    setState(() {
                      discomode = value;
                    });
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
