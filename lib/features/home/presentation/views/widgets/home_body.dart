import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc_injectable_mason_hooks/core/di/dependency_injection.dart';
import 'package:flutter_poc_injectable_mason_hooks/features/home/data/repo/home_repo.dart';
import 'package:flutter_poc_injectable_mason_hooks/features/home/presentation/views/cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: Center(child: Text('Home Body')),
    );
  }
}
