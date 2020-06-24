import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pseudomusic/ui/global/theme/bloc/bloc.dart';
import 'package:pseudomusic/ui/global/theme/bloc/theme_event.dart';
import 'package:pseudomusic/utils/variables.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Color'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return ColorPickerDialog();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ColorPickerDialog extends StatefulWidget {
  @override
  _ColorPickerDialogState createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  bool lightTheme = true;
  String hex;
  TextEditingController hexController = TextEditingController();

  void changeColor(Color color) {
    setState(() {
      currentColor = color;
      hexController.text =
          hex = '${currentColor.value.toRadixString(16).substring(2)}';
      //print(hexController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    hex = hexController.text =
        '${currentColor.value.toRadixString(16).substring(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            ThemeData theme = new ThemeData(
              brightness: MediaQuery.of(context).platformBrightness,
              primaryColor: currentColor,
            );
            BlocProvider.of<ThemeBloc>(context).add(
              ThemeChanged(theme: theme),
            );
            Navigator.pop(context);
          },
        )
      ],
      contentPadding: const EdgeInsets.all(0.0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15.0,
                right: 10.0,
                left: 10.0,
              ),
              child: Row(
                children: [
                  Text('Color Code: '),
                  Spacer(),
                  SizedBox(
                    width: 80.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        if (value.length == 6) {
                          changeColor(
                            Color(int.parse('0xff' + value)),
                          );
                        }
                      },
                      controller: hexController,
                    ),
                  ),
                ],
              ),
            ),
            ColorPicker(
              pickerColor: currentColor,
              onColorChanged: changeColor,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.8,
              enableAlpha: false,
              displayThumbColor: true,
              showLabel: false,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(0.0),
                topRight: const Radius.circular(0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
