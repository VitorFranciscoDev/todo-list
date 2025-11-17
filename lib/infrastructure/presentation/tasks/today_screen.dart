import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastructure/presentation/tasks/tasks_state.dart';
import 'package:to_do_list/infrastructure/presentation/widgets/bottom_sheet_widget.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  // Return the Abreviated Name of the month based on the number
  String _month(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Jan";
    }
  }

  // Return the name of the day based on the number
  String _weekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Monday";
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksProvider>().tasks;
    final now = DateTime.now();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
        
              // Title
              const Text(
                "Today",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
        
              const SizedBox(height: 10),
        
              // Date
              Text(
                "${_month(now.month)} ${now.day} - ${_weekday(now.weekday)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
        
              const SizedBox(height: 5),
        
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index) => Divider(color: Colors.grey[400]),
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            
                            const SizedBox(width: 30),

                            Text("AAAAAAAAAAAAAaa"),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const AddTaskBottomSheet(),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
