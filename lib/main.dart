import 'package:clean_architecture_with_bloc/core/di/app_depandencies.dart';
import 'package:clean_architecture_with_bloc/core/routes/app_router.dart';
import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/login/bloc/login_bloc.dart';
import 'presentation/login/screens/login_screen.dart';

void main() {
  final deps = AppDependencies();
  runApp(MyApp(deps: deps));
}

class MyApp extends StatelessWidget {
  final AppDependencies deps;

  const MyApp({super.key, required this.deps});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc(deps.loginUser))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.login,
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
