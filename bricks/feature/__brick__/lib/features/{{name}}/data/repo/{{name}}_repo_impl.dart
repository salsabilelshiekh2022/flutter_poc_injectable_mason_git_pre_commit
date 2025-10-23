import 'package:injectable/injectable.dart';

import '{{name}}_repo.dart';

@LazySingleton(as: {{name.pascalCase()}}Repo)
class {{name.pascalCase()}}RepoImpl implements {{name.pascalCase()}}Repo {
  {{name.pascalCase()}}RepoImpl();
}
