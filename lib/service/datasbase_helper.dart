import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starwars_app/models/people_model.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path + "starwars_people.db");
    final starWarsDB = await openDatabase(path,
        version: 1, onOpen: (database) {}, onCreate: _createDB);
    return starWarsDB;
  }

  String peopleTable = "people_table";
  String peopleName = "people_name";
  String peopleHeight = "people_height";
  String peopleMass = "people_mass";
  String peopleHairColor = "people_hairColor";
  String peopleSkinColor = "people_skinColor";
  String peopleEyeColor = "people_eyeColor";
  String peopleBirthDay = "people_birthDay";
  String peopleGender = "people_gender";
  String peopleHomeWorld = "people_homeWorld";

  void _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $peopleTable(
        $peopleName TEXT,
        $peopleHeight TEXT,
        $peopleMass TEXT,
        $peopleHairColor TEXT,
        $peopleSkinColor TEXT,
        $peopleEyeColor TEXT,
        $peopleBirthDay TEXT,
        $peopleGender TEXT,
      )''');
  }

  // createPeopleList(List<People> peopleList) async {
  //   await deleteAllPeople();
  //   final db = await database;

  //   for (int i = 0; i < peopleList.length; i++) {
  //     await db.insert("$peopleTable", peopleList[i].toJson());
  //   }
  // }

  createPeople(People people) async {
    await deleteAllPeople();
    final db = await database;
    final res = await db.insert('$peopleTable', people.toJson());

    return res;
  }

  Future<int> deleteAllPeople() async {
    Database db = await this.database;
    final res = await db.rawDelete("DELETE FROM $peopleTable");
    return res;
  }

  Future<List<People>> getAllPeoplefromDB() async {
    Database db = await database;
    final res = await db.rawQuery("SELECT * FROM $peopleTable");
    print("Result : " + res.length.toString());

    List<People> list =
        res.isNotEmpty ? res.map((e) => People.fromJson(e)).toList() : [];
    print("Get All People List : $list");
    return list;
  }

  // Future<People> getPeopleWithId(int id) async {
  //   Database db = await this.database;
  //   var response =
  //       await db.query("$peopleTable", where: "people_id = ?", whereArgs: [id]);
  //   return response.isNotEmpty ? peopleFromJson(response.first) : null;
  // }
}
