import 'package:bee_list/pages/reminders_page.dart';
import 'package:bee_list/services/db.dart';
import 'package:bee_list/services/models.dart';
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
  Hive.registerAdapter(ReminderAdapter());
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
    
    // samples for testing
    db.addListItem(ListItem(title: "Essentials", time: DateTime.now()));
    // db.addItem(0, Item(text: "Item1", check: false, time: DateTime.now()));
    // db.addItem(0, Item(text: "Item2", check: false, time: DateTime.now()));
    // db.addItem(0, Item(text: "Item3", check: false, time: DateTime.now()));
    // db.addNote(0, Note(text: "Note1", time: DateTime.now()));
    // db.addNote(0, Note(text: "Note2", time: DateTime.now()));
    // db.addNote(0, Note(text: "Note3", time: DateTime.now()));

    return MaterialApp(
      title: 'Taskify',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: RemindersPage(listId:0, db: db,),
    );
  }
}
