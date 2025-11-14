import 'package:bee_list/services/models.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

class Db extends ChangeNotifier{
  static final Box<ListItem> _box = Hive.box("taskifybox");

  // functions for list titles
  List<ListItem> getListItems()=> _box.values.toList();
  void addListItem(ListItem listItem){
    _box.add(listItem);
  }
  void delListItem(int id){
    _box.deleteAt(id);
    notifyListeners();
  }
  void saveListItem(int id, ListItem lit){
    _box.putAt(id, lit);
  }

  //  functions for list items
  List<Item> getItems(int id)=> _box.getAt(id)!.items;
  void addItem(int listId, Item item){
    ListItem lit= _box.getAt(listId)!;
    lit.items.add(item);
    _box.putAt(listId, lit);
  }
  void saveItem(int listId, int itemId, Item item){
    ListItem lit= _box.getAt(listId)!;
    lit.items[itemId] = item;
    _box.putAt(listId, lit);
  }
  void delItem(int listId, int itemId){
    ListItem lit= _box.getAt(listId)!;
    lit.items.removeAt(itemId);
    _box.putAt(listId, lit);
    notifyListeners();
  }
  void toggleCheck(int listId, int itemId){
    ListItem lit= _box.getAt(listId)!;
    lit.items[itemId].check=!lit.items[itemId].check;
    _box.putAt(listId, lit);
  }

  // functions for list notes
  List<Note> getNotes(int id)=> _box.getAt(id)!.notes;
  void addNote(int listId, Note note){
    ListItem lit= _box.getAt(listId)!;
    lit.notes.add(note);
    _box.putAt(listId, lit);
  }
  void saveNote(int listId, int noteId, Note note){
    ListItem lit= _box.getAt(listId)!;
    lit.notes[noteId] = note;
    _box.putAt(listId, lit);
    notifyListeners();
  }
  void delNote(int listId, int noteId){
    ListItem lit= _box.getAt(listId)!;
    lit.notes.removeAt(noteId);
    _box.putAt(listId, lit);
    notifyListeners();
  }

  // functions for remianders
  List<Reminder> getReminders(int id)=> _box.getAt(id)!.reminders;
  void addReminder(int listId, Reminder rmndr){
    ListItem lit= _box.getAt(listId)!;
    lit.reminders.add(rmndr);
    _box.putAt(listId, lit);
    notifyListeners();
  }
  void saveReminder(int listId, int rmndrId, Reminder rmndr){
    ListItem lit= _box.getAt(listId)!;
    lit.reminders[rmndrId] = rmndr;
    _box.putAt(listId, lit);
    notifyListeners();
  }
  void delReminder(int listId, int rmndrId){
    ListItem lit= _box.getAt(listId)!;
    lit.reminders.removeAt(rmndrId);
    _box.putAt(listId, lit);
    notifyListeners();
  }
}