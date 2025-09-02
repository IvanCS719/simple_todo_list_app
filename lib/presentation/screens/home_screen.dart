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
                title: Text('Tarea X'),
                secondary: IconButton(icon: Icon(Icons.delete_outlined), onPressed: (){},),
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
          )
        ],
      ),
    );
  }
}