import 'package:logging/logging.dart';

final Logger rootLogger = Logger.root;
final Logger accountServiceLogger = new Logger('AccountService');

final Logger loginScreenLogger = new Logger('LoginScreen');

void configureLogger() {
  rootLogger.level = Level.ALL;
  rootLogger.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
