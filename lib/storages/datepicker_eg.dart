import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DateSelection(),
  ));
}

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateTime selected_date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: TextEditingController(
                  text: '${selected_date.toLocal()}'.split(' ')[0]),
              onTap: () => SelectDate(context),
              readOnly: true,
              decoration: InputDecoration(
                  labelText: 'Select Date',
                  suffixIcon: Icon(Icons.calendar_month)),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> SelectDate(BuildContext context) async {
    final DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: selected_date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    if (pickeddate != null && pickeddate != selected_date) {
      setState(() {
        selected_date = pickeddate;
      });
    }
  }
}
