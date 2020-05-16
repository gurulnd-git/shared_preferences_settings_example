import 'package:ds/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: ListView(
      children: <Widget>[
        SizedBox(
            width: 100.0,
            height: 100.0,
            child:  SettingsToggleScreen(
          settingKey: 'key-of-your-setting',
          title: 'Settings Ui ',
          children: [],
        ) ),


        SimpleSettingsTile(
          title: 'Conditionally enabled.',
          enabledIfKey: 'key-of-parent',
          visibleByDefault: true,
        ),
        Settings().onBoolChanged(
          settingKey: 'key-of-your-setting',
          defaultValue: false,
          childBuilder: (BuildContext context, bool value){
            return Text(value.toString());
          },
        ),
        Settings().onStringChanged(
          settingKey: 'key-of-your-setting',
          defaultValue: 'Empty',
          childBuilder: (BuildContext context, String value){
            return Text(value);
          },
        ),
        SettingsContainer(
          children: [
          Text('First line'),
          Text('Second line'),
          ],
        ),
        SettingsContainer(
          child: Text('Settings container'),
        ),
        MaterialColorPickerSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Color Picker',
          cancelCaption: 'Keep the old value',
          okCaption: 'Select new',
          confirmText: 'Are you sure want to modify the previously selected color?',
          confirmModalTitle: 'Are you sure?',
          confirmModalCancelCaption: 'Keep the old one',
          confirmModalConfirmCaption: 'Yes, I am sure',
        ),
        TextFieldModalSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Type your email',
          defaultValue: 'This is by default.',
          cancelCaption: 'Cancel',
          okCaption: 'Save Email',
          keyboardType: TextInputType.emailAddress,
        ),
        TextFieldModalSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Set User Password',
          obscureText: true,
        ),
        SimpleColorPickerSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Color Picker',
        ),
    RadioPickerSettingsTile(
    settingKey: 'key-of-your-setting',
      title: 'Choose one in the modal dialog',
      values: {
        'a': 'Option A',
        'b': 'Option B',
        'c': 'Option C',
        'd': 'Option D',
      },
      defaultKey: 'b',
    ),

//        SliderSettingsTile(
//          settingKey: 'key-of-your-setting',
//          title: 'Rate this app',
//          subtitle: 'How would you rate this app in a 5 to 1 scale?',
//          minValue: 1.0,
//          maxValue: 5.0,
//          step: 2.0,
//        ),
        SliderSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Brightness',
          minIcon: Icon(Icons.brightness_4),
          maxIcon: Icon(Icons.brightness_7),
        ),
    SettingsTileGroup(
    title: 'Group title',
      children: [
        RadioSettingsTile(
          settingKey: 'key-of-your-setting',
          title: 'Select one option',
          values: {
            'a': 'Option A',
            'b': 'Option B',
            'c': 'Option C',
            'd': 'Option D',
          },
        ),
        SwitchSettingsTile(
          settingKey: 'wifi_status',
          title: 'Wi-Fi',
          subtitle: 'Connected.',
          subtitleIfOff: 'To see available networks, turn on Wi-Fi.',
          screen: SettingsToggleScreen(
              settingKey: 'wifi_status',
              subtitle: 'Connected',
              subtitleIfOff: 'To see available networks, turn on Wi-Fi.',

          children: [
          SettingsContainer(
          children: [          Text('You are offline.'),
          Text('Put some widgets or tiles here.'),
          ],
        ),
      ],
    ),
    ),
        CheckboxSettingsTile(
          settingKey: 'wifi_status',
          title: 'Wi-Fi',
          subtitle: 'Connected.',
          subtitleIfOff: 'To see available networks, turn on Wi-Fi.',
          screen: SettingsToggleScreen(
              settingKey: 'wifi_status',
              subtitle: 'Connected',
              subtitleIfOff: 'To see available networks, turn on Wi-Fi.',
              children: [
          SettingsContainer(
          children: [
          Text('You are offline.'),
          Text('Put some widgets or tiles here.'),
          ],
        ),
      ],
    ),
    ),
      ExpansionSettingsTile(
      title: 'You can expand & close',
      children: [
      CheckboxSettingsTile(
        settingKey: 'key-of-your-setting',
        title: 'This is a simple Checkbox',
      ),
      ],
    ),
      CheckboxSettingsTile(
        settingKey: 'key-of-your-setting',
        title: 'This is a simple Checkbox',
      ),
      ],
    ),
        SimpleSettingsTile(
          title: 'Advanced',
          subtitle: 'More, advanced settings.',
          screen: SettingsToggleScreen(
            title: 'Sub menu',
            children: [
              CheckboxSettingsTile(
                settingKey: 'key-of-your-setting',
                title: 'This is a simple Checkbox',
              ),
              SettingsToggleScreen(
                settingKey: 'key-of-your-setting',
                title: 'Title',
                defaultValue: true,
                subtitle: 'Enabled',
                subtitleIfOff: 'Disabled',
                children: [
                  SettingsContainer(
                    child: Text('This is enabled! :)'),
                  ),
                ],
                childrenIfOff: [
                  SettingsContainer(
                    child: Text('Tap the checkbox to enable.'),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    )

    );
  }
}
