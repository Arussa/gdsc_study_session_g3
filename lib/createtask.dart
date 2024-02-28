import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  late TextEditingController taskNameController;
  late TextEditingController dueDateController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    dueDateController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    dueDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Create New Task'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Main Task Name'),
          TextFormField(
            controller: taskNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 49, 48, 48), width: 1.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Due Date'),
          TextFormField(
            controller: dueDateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              prefixIcon: IconButton(
                onPressed: () async {
                  DateTime initialDate = DateTime.now();
                  if (dueDateController.text.isNotEmpty) {
                    initialDate = DateTime.parse(dueDateController.text);
                  }
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 5),
                  );
                  if (pickedDate != null ||
                      pickedDate == null && dueDateController.text.isEmpty) {
                    setState(() {
                      dueDateController.text =
                          pickedDate?.toString() ?? DateTime.now().toString();
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ),
            onTap: () async {
              DateTime initialDate = DateTime.now();
              if (dueDateController.text.isNotEmpty) {
                initialDate = DateTime.parse(dueDateController.text);
              }
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 5),
              );
              if (pickedDate != null ||
                  pickedDate == null && dueDateController.text.isEmpty) {
                setState(() {
                  dueDateController.text =
                      pickedDate?.toString() ?? DateTime.now().toString();
                });
              }
            },
          ),
          const SizedBox(height: 16.0),
          const Text('Description'),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              String taskName = taskNameController.text;
              String dueDate = dueDateController.text;
              String description = descriptionController.text;
              Navigator.pushNamed(
                context,
                '/task-detail',
                arguments: {
                  'taskName': taskName,
                  'dueDate': dueDate,
                  'description': description,
                },
              );
              // addTask()
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
