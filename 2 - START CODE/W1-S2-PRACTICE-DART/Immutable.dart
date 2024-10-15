class Profile {
  String _name;
  int _age;
  String _phone;

  Profile(this._name, this._age, this._phone);
  set name(String name) => this._name = name;
  String get name => this._name;

  set age(int age) => this._age = age;
  int get age => this._age;

  set phone(String phone) => this._phone = phone;
  String get phone => this._phone;
  // To convert the data to string
  @override
  String toString() {
    return "Name: $_name\nAge: $_age\nPhone: $_phone\n";
  }
}

void main() {
  Profile person1 = Profile("Gitty", 21, "01234587");
  Profile person2 = Profile("Jumpie", 22, "123456768");
  print(person1.toString() + person2.toString());
}
