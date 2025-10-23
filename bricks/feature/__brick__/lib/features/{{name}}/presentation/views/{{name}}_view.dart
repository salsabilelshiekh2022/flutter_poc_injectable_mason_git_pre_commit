import 'package:flutter/material.dart';

import 'widgets/{{name}}_body.dart';

class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: {{name.pascalCase()}}Body());
  }
}
