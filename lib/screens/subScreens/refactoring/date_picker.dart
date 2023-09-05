import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../subScreens/refactoring/styles.dart';

DateTime? first;
DateTime? second;

class WidgetDateRangePicker extends StatefulWidget {
  const WidgetDateRangePicker({super.key});

  @override
  State<WidgetDateRangePicker> createState() => _WidgetDateRangePickerState();
}

class _WidgetDateRangePickerState extends State<WidgetDateRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                  context: context,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: const ColorScheme.light(
                          primary: cardColor,
                          onSecondary: Color.fromARGB(255, 230, 0, 0),
                          onPrimary: Color.fromARGB(255, 0, 26, 44),
                          surface: Color.fromARGB(255, 0, 37, 248),
                          onSurface: Color.fromARGB(255, 255, 255, 255),
                          secondary: Colors.white,
                        ),
                        dialogBackgroundColor:
                            const Color.fromARGB(255, 0, 26, 44),
                        textTheme: const TextTheme(
                          titleMedium: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      child: child ?? const Text(""),
                    );
                  },
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now());
              if (date == null) {
                return;
              } else {
                setState(() {
                  _startDate = date;
                });
                first = _startDate;
              }
            },
            child: Text(
                _startDate == null ? 'Start Date' : parseDatDrop(_startDate!),
                style: const TextStyle(fontSize: 15, color: Colors.black))),
        TextButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: const ColorScheme.light(
                          primary: cardColor,
                          onSecondary: Color.fromARGB(255, 230, 0, 0),
                          onPrimary: Color.fromARGB(255, 0, 26, 44),
                          surface: Color.fromARGB(255, 0, 37, 248),
                          onSurface: Color.fromARGB(255, 255, 255, 255),
                          secondary: Colors.white,
                        ),
                        dialogBackgroundColor:
                            const Color.fromARGB(255, 0, 26, 44),
                        textTheme: const TextTheme(
                          titleMedium: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      child: child ?? const Text(""),
                    );
                  },
                  initialDate:
                      _startDate != null ? _startDate! : DateTime.now(),
                  firstDate: _startDate != null ? _startDate! : DateTime.now(),
                  lastDate: DateTime.now());
              if (date != null) {
                setState(() {
                  _endDate = date;
                });
                second = _endDate;
              }
            },
            child: Text(
              _endDate == null ? 'End Date' : parseDatDrop(_endDate!),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            )),
        Container(
            color: bgColor,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ))
      ],
    );
  }

  String parseDatDrop(DateTime date) {
    final formatter = DateFormat('dd MMM \n yyyy');
    return formatter.format(date);
  }
}
