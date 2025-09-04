import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        title: const Text('Mis Tareas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
              return CheckboxListTile(
                value: check,

                onChanged: (value){
                  setState(() {
                    check = !check;
                  });
                },
                title: const Text('Tarea X'),
                secondary: IconButton(icon: const Icon(Icons.delete_outlined), onPressed: (){},),
                controlAffinity: ListTileControlAffinity.leading,
                );
              
              /*ListTile(
                leading: Checkbox(value: check, onChanged: (value){
                  setState(() {
                    check = !check;
                  });
                }),
                title: Text('Tarea'),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline)),
                onTap: (){
                  setState(() {
                    check = !check;
                  });
                },
              );*/
            }
            ),
          ),

          Container(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            padding: const EdgeInsets.all(16.0),
            child: const TaskInputBox()
              
              ,
          )
        ],
      ),
    );
  }
}

class TaskInputBox extends StatelessWidget {
  const TaskInputBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: const TaskFieldBox()),
        const SizedBox(width: 8,),
        IconButton.filled(
          padding: const EdgeInsets.all(12.0),
          onPressed: (){},
          icon: const Icon(Icons.add_outlined)
          )
      ],
      );
  }
}

class TaskFieldBox extends StatelessWidget {
  const TaskFieldBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textCotroller = TextEditingController();
    final focusNodeV = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(40)
        );
    
    return TextFormField(
      controller: textCotroller,
      focusNode: focusNodeV,
      decoration: InputDecoration(
        hintText: 'Añadir una tarea nueva...',
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder
      ),
    );
  }
}