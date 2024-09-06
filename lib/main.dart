import 'package:clean_architecture_practice/features/users/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/databases/cache/cache_helper.dart';
import 'features/users/presentation/manager/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Demo',
      home: BlocProvider(
        child: const HomeScreen(),
        create: (context) => UserCubit()..failureOrUser(1),
      ),
    );
  }
}
