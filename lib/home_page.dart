import 'package:flutter/material.dart';
import 'package:ids_material_sdk/bottom_nav_bar/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<IDSBottomNavigationAppBarState> _bottomNavBarKey =
  GlobalKey<IDSBottomNavigationAppBarState>();


  final List<Map<String, dynamic>> _tasks = [
    {"title": "Complete Flutter Project", "completed": false},
    {"title": "Read Documentation", "completed": false},
    {"title": "Fix UI Bugs", "completed": false},
  ];

  final TextEditingController _taskController = TextEditingController();

  /// Function to add a new task
  void _addTask() {
    _bottomNavBarKey.currentState?.changeTab(2);
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({"title": _taskController.text, "completed": false});
        _taskController.clear();
      });
    }
  }

  /// Function to toggle task completion
  void _toggleTask(int index) {
    setState(() {
      _tasks[index]["completed"] = !_tasks[index]["completed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Page")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: "Enter new task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.blue),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: _tasks[index]["completed"],
                    onChanged: (value) => _toggleTask(index),
                  ),
                  title: Text(
                    _tasks[index]["title"],
                    style: TextStyle(
                      decoration: _tasks[index]["completed"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
