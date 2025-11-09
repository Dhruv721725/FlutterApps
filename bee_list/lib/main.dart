import 'package:bee_list/components/db.dart';
import 'package:bee_list/components/models.dart';
import 'package:bee_list/pages/home_page.dart';
import 'package:bee_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ListItemAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(AppNotificationAdapter());
  await Hive.openBox<ListItem>('taskifybox');
  
  runApp(
    ChangeNotifierProvider(
      create: (_)=>Db(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    Db db = Provider.of<Db>(context);
    return MaterialApp(
      title: 'Bee\'s List',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(db:db),
    );
  }
}
