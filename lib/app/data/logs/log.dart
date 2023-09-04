import '../../../main.dart';

class Log {
  static void info({required String info}) {
    log.info(info);
  }

  static void severe({required String severe}) {
    log.severe(severe);
  }
}
