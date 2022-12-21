//Model files contain a single class outlining the structure of this object
//Objects can be passed directly to Firebase Firestore in this format, and retrieved in the same way

class User {
  String? name;
  int? age;

  User({
    this.name,
    this.age,
  });
}