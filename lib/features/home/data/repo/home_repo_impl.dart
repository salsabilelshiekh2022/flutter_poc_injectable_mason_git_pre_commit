import 'package:injectable/injectable.dart';

import 'home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl();
}
