class MyGuardian{
  String name;
  String phno;

  MyGuardian({required this.name, required this.phno});

  @override
  String toString() {
    return 'MyGuardian{name: $name, phno: $phno}';
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "phno": phno,
    };
  }
}