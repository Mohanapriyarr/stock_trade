import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:provider/provider.dart';
import 'app/data/theme/themes.dart';
import 'app/module/provider/stock_list_provider.dart';
import 'app/module/screens/view/stock_list_view.dart';

final log = Logger('');

void main() {
  //? Log everything in debug builds.  Log severe (and up) in release builds.
  Logger.root.level = kDebugMode ? Level.ALL : Level.SEVERE;
  Logger.root.onRecord.listen((record) {
    record.level.name.contains('INFO') ? Print.yellow('''
  --🚀 ${record.time}
|
  --${record.message}
''') : Print.red('🚀 ${record.time}\n~ ${record.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StockListProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Themes.dark,
        home: const StockListView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
