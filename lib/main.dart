import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_list_app/presentation/home_container.dart';
import 'package:simple_todo_list_app/presentation/providers/theme_provider.dart';

void main(){
  return runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(themeNotifierProvider).themeApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomeContainer(),
    );
  }
}