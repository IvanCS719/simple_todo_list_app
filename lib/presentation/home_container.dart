import 'package:flutter/material.dart';
import 'package:simple_todo_list_app/presentation/screens/home_screen.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  final TextEditingController _textController = TextEditingController();

  final FocusNode _focusNodeV = FocusNode();

    @override
    void dispose(){
      _textController.dispose();
      _focusNodeV.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(textController: _textController, focusNodeV: _focusNodeV,);
  }
}