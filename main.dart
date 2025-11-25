import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/metrics_cubit.dart';
import 'bloc/theme_cubit.dart';
import 'data/local_storage.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(HealthApp());
}

class HealthApp extends StatelessWidget {
  final LocalStorage storage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MetricsCubit(storage)..loadMetrics()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: "Personal Health Insights",
            themeMode: mode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.indigo,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.dark(
                primary: Colors.indigo,
                secondary: Colors.tealAccent,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );

  }
}
