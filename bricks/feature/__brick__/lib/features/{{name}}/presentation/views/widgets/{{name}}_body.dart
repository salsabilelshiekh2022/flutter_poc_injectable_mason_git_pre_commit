import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc_injectable_mason_hooks/core/di/dependency_injection.dart';
import '../../../data/repo/{{name}}_repo.dart';
import '../cubit/{{name}}_cubit.dart';
class {{name.pascalCase()}}Body extends StatelessWidget {
  const {{name.pascalCase()}}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{name.pascalCase()}}Cubit(getIt<{{name.pascalCase()}}Repo>()),
      child: Center(child: Text('{{name.pascalCase()}} Body')),
    );
  }
}
