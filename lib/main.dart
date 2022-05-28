import 'package:flappy_bird/const/const.dart';
import 'package:flappy_bird/helper/cache_manager.dart';
import 'package:flappy_bird/presentation/pages/home_page.dart';
import 'package:flappy_bird/const/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  disableMobileLandscape();
  buildBlocObserver();
  await CachManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => pipescontrollerCubit,
        ),
        BlocProvider(
          create: (context) => gamecontrollerCubit,
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomePage()),
      ),
    );
  }
}
