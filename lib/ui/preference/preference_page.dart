import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pseudomusic/ui/global/theme/app_themes.dart';
import 'package:pseudomusic/ui/global/theme/bloc/bloc.dart';
import 'package:pseudomusic/ui/global/theme/bloc/theme_event.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  _showDialog() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: AppTheme.values.length,
              itemBuilder: (context, index) {
                final itemAppTheme = AppTheme.values[index];
                return Card(
                  color: appThemeData[itemAppTheme].primaryColor,
                  child: ListTile(
                    title: Text(
                      itemAppTheme.toString(),
                      style: appThemeData[itemAppTheme].textTheme.bodyText1,
                    ),
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(context).add(
                        ThemeChanged(theme: itemAppTheme),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text('Color'),
            onPressed: () => showDialog(
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
  Color currentColor = Colors.limeAccent;
  String hex;
  TextEditingController hexController = new TextEditingController();

  void changeColor(Color color) {
    setState(() {
      currentColor = color;
      print('Here');
      hexController.text = '#${currentColor.value.toRadixString(16)}';
    });
  }

  @override
  void initState() {
    super.initState();
    hexController.text = '#${currentColor.value.toRadixString(16)}';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(15.0),
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
                    child: TextFormField(
                      textAlign: TextAlign.center,
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
              enableAlpha: true,
              displayThumbColor: false,
              showLabel: false,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(2.0),
                topRight: const Radius.circular(2.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
