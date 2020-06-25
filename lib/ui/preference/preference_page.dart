import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/ui/global/disco/bloc/discobloc.dart';
import 'package:pseudomusic/ui/global/theme/bloc/bloc.dart';
import 'package:pseudomusic/utils/constants.dart';
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
      body: ListView(
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
          SizedBox(
            width: 200.0,
            child: Divider(
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(MaterialCommunityIcons.lightbulb),
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
