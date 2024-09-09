import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // List of students' names
  final List<String> students = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
  ];

  // List to keep track of attendance status for each student
  // Initially, all are marked as "Not Marked"
  List<String> attendanceStatus = List.filled(10, "Not Marked");

  // Method to update attendance status
  void markAttendance(int index, String status) {
    setState(() {
      attendanceStatus[index] = status;
    });
  }

  // Method to handle submit button click
  void submitAttendance() {
    bool allMarked = attendanceStatus.every((status) => status != "Not Marked");

    if (allMarked) {
      // Example of submitting (here, just showing a confirmation message)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance Submitted Successfully!'),
        ),
      );
      // Here you would normally send attendanceStatus data to a database like MongoDB
    } else {
      // Show warning if some students' attendance is not marked
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please mark attendance for all students!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Attendance'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      students[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      'Status: ${attendanceStatus[index]}',
                      style: TextStyle(
                        color: attendanceStatus[index] == 'Present'
                            ? Colors.green
                            : attendanceStatus[index] == 'Absent'
                                ? Colors.red
                                : Colors.black,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            markAttendance(index, "Present");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text('P',
                          style: TextStyle(color: Colors.white), // P for Present
                        ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            markAttendance(index, "Absent");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('A',
                          style: TextStyle(color: Colors.white),), // A for Absent
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Submit Attendance Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: submitAttendance,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
              child: Text(
                'Submit ',
                style: TextStyle(fontSize: 18,color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
