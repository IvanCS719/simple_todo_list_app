import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_list_app/presentation/providers/task_list_provider.dart';
import 'package:simple_todo_list_app/presentation/providers/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  final TextEditingController textController;
  final FocusNode focusNodeV;

  const HomeScreen(
      {super.key, required this.textController, required this.focusNodeV});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: const Text('Tareas De Hoy'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        actions: [IconButton(onPressed: (){
          ref.read(themeNotifierProvider.notifier).toggleTheme();
        },
        icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined))],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  // Checkbox inmutable, por ser StatelessWidget
                  final task = tasks[index];
                  return Card(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    elevation: .5,
                    child: CheckboxListTile(
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      
                      value: task.isDone,
                      onChanged: (_) {
                        ref.read(taskListProvider.notifier).toggleTask(task.id);
                      }, // No permite cambiar el checkbox
                      title: Text(
                        task.title,
                        style: task.isDone
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                //color: Colors.black.withOpacity(0.5),
                              )
                            : null,
                      ),
                      secondary: IconButton(
                        icon: const Icon(Icons.delete_outlined),
                        onPressed: () {
                          ref
                              .read(taskListProvider.notifier)
                              .removeTask(task.id);
                        },
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            padding: const EdgeInsets.all(16.0),
            child: TaskInputBox(
              textController: textController,
              focusNodeV: focusNodeV,
              ref: ref,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskInputBox extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNodeV;

  final WidgetRef ref;

  const TaskInputBox(
      {super.key,
      required this.textController,
      required this.focusNodeV,
      required this.ref});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TaskFieldBox(
          textController: textController,
          focusNodeV: focusNodeV,
        )),
        const SizedBox(
          width: 8,
        ),
        IconButton.filled(
            padding: const EdgeInsets.all(12.0),
            onPressed: () {
              final taskText = textController.text.trim();

              if (taskText.isNotEmpty) {
                focusNodeV.requestFocus();
                ref.read(taskListProvider.notifier).addTask(taskText);
                textController.clear();
              }
            },
            icon: const Icon(Icons.add_outlined))
      ],
    );
  }
}

class TaskFieldBox extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNodeV;

  const TaskFieldBox(
      {super.key, required this.textController, required this.focusNodeV});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
      controller: textController,
      focusNode: focusNodeV,
      //onTapOutside: (event) => focusNodeV.unfocus(),
      decoration: InputDecoration(
          hintText: 'Añadir una tarea nueva...',
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder),
    );
  }
}
