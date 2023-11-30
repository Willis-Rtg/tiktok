import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notifiction = false;

  void onNotificationChaged(bool? newNotification) {
    if (newNotification == null) return;
    setState(() {
      notifiction = newNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        children: [
          Column(
            children: [
              Gaps.v10,
              RotatedBox(
                quarterTurns: -1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 1,
                  width: MediaQuery.of(context).size.height / 1.8,
                  child: ListWheelScrollView(
                    itemExtent: 300,
                    // useMagnifier: true,
                    // magnification: 1.5,
                    diameterRatio: 3,
                    // offAxisFraction: 2,
                    children: [
                      for (var x in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
                        RotatedBox(
                          quarterTurns: 1,
                          child: Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text("Pick me"),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Column(
            children: [
              CircularProgressIndicator.adaptive(),
            ],
          ),
          ListView(
            children: [
              ListTile(
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationVersion: "v0.0",
                      applicationLegalese:
                          "All right reserved. Please don't copy thie app.");
                },
                title: const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text("About this app..."),
              ),
              const AboutListTile(),
              ListTile(
                title: const Text("date picker"),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030),
                  );
                  final time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  final booking = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData(
                              appBarTheme: const AppBarTheme(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                              ),
                              colorSchemeSeed: Colors.pink),
                          child: child!);
                    },
                  );
                },
              ),
              CheckboxListTile(
                title: const Text("notification"),
                checkColor: Theme.of(context).primaryColor,
                activeColor: Colors.white,
                value: notifiction,
                onChanged: onNotificationChaged,
              ),
              Checkbox(value: notifiction, onChanged: onNotificationChaged),
              Switch.adaptive(
                  value: notifiction, onChanged: onNotificationChaged),
              SwitchListTile(
                  value: notifiction, onChanged: onNotificationChaged),
              ListTile(
                title: const Text(
                  "Log out (iOS)",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go."),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  "Log out (Android)",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go."),
                      actions: [
                        TextButton(
                          child: const Text("No"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          // isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  "Log out (Android /bttom)",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      message: const Text("Please Don't go"),
                      // content: const Text("Please don't go."),
                      actions: [
                        CupertinoActionSheetAction(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("No")),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
