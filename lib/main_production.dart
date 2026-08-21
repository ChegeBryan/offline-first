import 'package:offline_first/app/app.dart';
import 'package:offline_first/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
