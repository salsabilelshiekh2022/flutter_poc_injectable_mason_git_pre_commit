import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repo/{{name}}_repo.dart';

part '{{name}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this.{{name.CamelCase()}}Repo) : super({{name.pascalCase()}}Initial());
  final {{name.pascalCase()}}Repo {{name.CamelCase()}}Repo;
}
