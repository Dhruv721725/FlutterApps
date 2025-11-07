import 'package:bee_list/components/models.dart';
import 'package:hive_flutter/adapters.dart';

class Db {
  static final Box<ListItem> _box = Hive.box("taskifybox");
  
  static List<ListItem> getListItems()=> _box.values.toList();
  static void addListItem(ListItem listItem){
    _box.add(listItem);
  }

  static List<Item> getItems(int id)=> _box.getAt(id)!.items;
  static void addItem(int listId, Item item){
    ListItem lit= _box.getAt(listId)!;
    lit.items.add(item);
    _box.putAt(listId, lit);
  }
  static void toggleCheck(int listId, int itemId){
    ListItem lit= _box.getAt(listId)!;
    lit.items[itemId].check=!lit.items[itemId].check;
    _box.putAt(listId, lit);
  }

  static List<Note> getNotes(int id)=> _box.getAt(id)!.notes;
  static void addNote(int listId, Note note){
    ListItem lit= _box.getAt(listId)!;
    lit.notes.add(note);
    _box.putAt(listId, lit);
  }
}