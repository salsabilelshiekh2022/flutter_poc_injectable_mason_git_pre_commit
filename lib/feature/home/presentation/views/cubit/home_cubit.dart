import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc_injectable_mason_hooks/feature/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
}
