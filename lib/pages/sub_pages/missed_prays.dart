import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_muslim/components/appbar.dart';
import 'package:daily_muslim/components/properties.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/missed_prays_widget.dart';
import '../../components/shared_pref.dart';

class MissedPrays extends StatefulWidget {
  MissedPrays({Key? key}) : super(key: key);

  @override
  State<MissedPrays> createState() => _MissedPraysState();
}

class _MissedPraysState extends State<MissedPrays> {
  int _fajr = 0, _dhuhr = 0, _asr = 0, _maghrib = 0, _isha = 0;
  @override
  void initState() {
    super.initState();
    _fajr = AllUserData.getPrayers("fajr");
    _dhuhr = AllUserData.getPrayers("dhuhr");
    _asr = AllUserData.getPrayers("asr");
    _maghrib = AllUserData.getPrayers("maghrib");
    _isha = AllUserData.getPrayers("isha");
  }

  void add(String name) {
    setState(() {
      switch (name) {
        case "fajr":
          _fajr++;
          AllUserData.addPrayer(name);
          _fajr = AllUserData.getPrayers(name);
          break;
        case "dhuhr":
          _dhuhr++;
          AllUserData.addPrayer(name);
          _dhuhr = AllUserData.getPrayers(name);
          break;
        case "asr":
          _asr++;
          AllUserData.addPrayer(name);
          _asr = AllUserData.getPrayers(name);
          break;
        case "maghrib":
          _maghrib++;
          AllUserData.addPrayer(name);
          _maghrib = AllUserData.getPrayers(name);
          break;
        case "isha":
          _isha++;
          AllUserData.addPrayer(name);
          _isha = AllUserData.getPrayers(name);
          break;
      }
    });
  }

  void subtract(String name) {
    setState(() {
      switch (name) {
        case "fajr":
          _fajr--;
          AllUserData.subtractPrayer(name);
          _fajr = AllUserData.getPrayers(name);
          break;
        case "dhuhr":
          _dhuhr--;
          AllUserData.subtractPrayer(name);
          _dhuhr = AllUserData.getPrayers(name);
          break;
        case "asr":
          _asr--;
          AllUserData.subtractPrayer(name);
          _asr = AllUserData.getPrayers(name);
          break;
        case "maghrib":
          _maghrib--;
          AllUserData.subtractPrayer(name);
          _maghrib = AllUserData.getPrayers(name);
          break;
        case "isha":
          _isha--;
          AllUserData.subtractPrayer(name);
          _isha = AllUserData.getPrayers(name);
          break;
      }
    });
  }

  DateTime teenAge = DateTime.now();
  DateTime startPraying = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          change: () {}, title: "Missed Prays", page: Pages.settings),
      body: Container(
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MissPrayer(
                        count: _fajr,
                        title: "Fajr",
                        plus: () => add("fajr"),
                        minus: () => subtract("fajr"),
                      ),
                      Divider(
                        height: 10,
                        color: black,
                      ),
                      MissPrayer(
                        count: _dhuhr,
                        title: "Dhuhr",
                        plus: () => add("dhuhr"),
                        minus: () => subtract("dhuhr"),
                      ),
                      Divider(
                        height: 10,
                        color: black,
                      ),
                      MissPrayer(
                        count: _asr,
                        title: "Asr",
                        plus: () => add("asr"),
                        minus: () => subtract("asr"),
                      ),
                      Divider(
                        height: 10,
                        color: black,
                      ),
                      MissPrayer(
                        count: _maghrib,
                        title: "Maghrib",
                        plus: () => add("maghrib"),
                        minus: () => subtract("maghrib"),
                      ),
                      Divider(
                        height: 10,
                        color: black,
                      ),
                      MissPrayer(
                        count: _isha,
                        title: "Isha",
                        plus: () => add("isha"),
                        minus: () => subtract("isha"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => print('subtract 1 day'),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'SUBTRACT 1 DAY',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: colorStr),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => print('add 1 day'),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'ADD 1 DAY',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: colorStr),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 3),
                  shadowColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(100, 60)),
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => white),
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => color),
                ),
                onPressed: () => showModalBottomSheet(
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => StatefulBuilder(
                    builder: (context, setState) => Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey[500],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'When you became a teenager?',
                              style: getStyle(21, colorStr, false),
                            ),
                          ),
                          CupertinoButton(
                              color: color,
                              child: Text(
                                  '${teenAge.month}/${teenAge.day}/${teenAge.year}'),
                              onPressed: () => setState(
                                  () async => showAndroidTimePicker(context))),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'When you started praying?',
                              style: getStyle(21, colorStr, false),
                            ),
                          ),
                          CupertinoButton(
                              color: colorStr,
                              child: Text(
                                  '${startPraying.month}/${startPraying.day}/${startPraying.year}'),
                              onPressed: () => setState(
                                  () async => showIOSDateTimePicker(context))),
                        ],
                      ),
                    ),
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.calculator,
                ),
                label: Text(
                  'Calculate your all missed prays',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAndroidTimePicker(context) {
    final newDate = showDatePicker(
        context: context,
        initialDate: teenAge,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now());
    teenAge = newDate as DateTime;
  }

  void showIOSDateTimePicker(context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 190,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                      initialDateTime: startPraying,
                      mode: CupertinoDatePickerMode.date,
                      dateOrder: DatePickerDateOrder.mdy,
                      onDateTimeChanged: (val) => startPraying = val,
                    ),
                  )
                ],
              ),
            ));
  }
}
