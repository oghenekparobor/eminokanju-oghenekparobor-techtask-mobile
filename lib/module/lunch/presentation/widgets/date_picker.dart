import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/core/widgets/text_field.dart';

class PrimaryDatePicker extends StatefulWidget {
  const PrimaryDatePicker({
    required this.dateSelected,
    super.key,
  });

  final Function(String) dateSelected;

  @override
  State<PrimaryDatePicker> createState() => _PrimaryDatePickerState();
}

class _PrimaryDatePickerState extends State<PrimaryDatePicker> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = DateFormat.yMMMMEEEEd().format(DateTime.now());

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryTextfield(
      onChanged: (String v) {},
      onSaved: (String v) {},
      hint: 'Date',
      textInputType: TextInputType.number,
      controller: controller,
      validator: (String p0) {
        if (p0.isEmpty) {
          return 'Date is required';
        }

        return null;
      },
      readOnly: true,
      onTap: pickerDate,
    );
  }

  void pickerDate() {
    if (Platform.isAndroid) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      ).then((DateTime? value) {
        if (value != null) {
          controller.text = DateFormat.yMMMMEEEEd().format(value);

          widget.dateSelected(value.toIso8601String());
        }
      });
    } else {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.w,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () => context.nav.pop(),
                      child: const Text('OK'),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 2.h,
                    thickness: 2.w,
                  ),
                  SizedBox(
                    height: 250.h,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (_) {
                        controller.text = DateFormat.yMMMMEEEEd().format(_);

                        widget.dateSelected(_.toIso8601String());
                      },
                      minimumDate: DateTime.now().subtract(
                        const Duration(days: 1),
                      ),
                      maximumDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
