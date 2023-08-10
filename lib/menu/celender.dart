import "package:flutter/material.dart";
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Calendar extends StatefulWidget {
  bool date;
  Calendar({super.key,required this.date});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 133, 236),
        title: const Text('CALENDAR',
        style:TextStyle( fontSize:20,color: Colors.white,fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1), 
            lastDay: DateTime.utc(2023, 12, 31), 
            focusedDay: DateTime.now(),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              )
            ),
            //  selectedDayPredicate: (day) {
              
            //   return widget.date && day.isSameDay(DateTime.now());
            // },
          ),
        ],
      ),
    );
  }}
