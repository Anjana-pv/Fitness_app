import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}
 
class _CalendarState extends State<Calendar> {

//    DateTime? _selectedDate;
  
//   List<DateTime> workoutDates = [
//     DateTime(2023, 7, 22), // Replace with actual workout dates
//     DateTime(2023, 7, 25),
//     DateTime(2023, 7, 28),
//     // Add more workout dates as needed
//   ];

//   void _onDaySelected(DateTime selectedDate, DateTime focusedDate) {
//     setState(() {
//       _selectedDate = selectedDate;
//     });
//   }

//   Widget _buildCell(BuildContext context, DateTime date) {
//     // ... (same code as shown in step 5) ...
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Calendar'),
      ),
      body: Column(
        children: [
//           TableCalendar(
//             calendarController: _calendarController,
//             onDaySelected: _onDaySelected,
//             calendarBuilders: CalendarBuilders(
//               defaultBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
//               todayBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
//               selectedBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
],
     ),
      );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calendar'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             calendarController: _calendarController,
//             onDaySelected: _onDaySelected,
//             onVisibleDaysChanged: _onVisibleDaysChanged,
//             calendarStyle: CalendarStyle(
//               // Customize the calendar style as needed
//               todayDecoration: BoxDecoration(
//                 color: Colors.yellow,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//               selectedTextStyle: TextStyle(color: Colors.white),
//             ),
//             calendarBuilders: CalendarBuilders(
//               defaultBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
//               todayBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
//               selectedBuilder: (context, date, _) {
//                 return _buildCell(context, date);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
  }
}
