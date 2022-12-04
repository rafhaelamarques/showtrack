import 'package:get_it/get_it.dart';
import 'features/inject_search.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initSearch(getIt);
}
