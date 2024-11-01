import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../checkout/controllers/checkout_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: Text('Select Check-in date'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'The following are the available check-in dates.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: controller.selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              controller.updateDate(selectedDay);
            },
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
