//SKill enum

enum Skill {
  FLUTTER("FLUTTER"),
  DART("DART"),
  OTHER("OTHER");

  final String skill;
  const Skill(this.skill);
  String toString() => skill;
}

final Map SkillBonus = {
  "FLUTTER": 2000,
  "DART": 3000,
  "OTHER": 1000,
};

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.city, this.street, this.zipCode);
}

class Employee {
  //instances
  final String _name;
  final double _baseSalary;
  final int _yearOfExperience;
  List<Skill> _skills = [];
  //Getter for the instances
  String get name => _name;
  double get baseSalary => _baseSalary;
  int get yearOfExperience => _yearOfExperience;
  List get skills => _skills;
  // Constructor
  Employee(this._name, this._baseSalary, this._yearOfExperience);
  // Constructor for mobileDeveloper
  Employee.mobileDeveloper(
      this._name, this._baseSalary, this._yearOfExperience) {
    if (_skills.isEmpty) {
      _skills.add(Skill.DART);
      _skills.add(Skill.FLUTTER);
    }
  }
  // add skills to list
  void addSkill(Skill skill) {
    this._skills.add(skill);
  }

  // compute the salary
  double computeSalary(double baseSalary, int yearOfExperience, List skills) {
    double salary = baseSalary; //40000

    salary += yearOfExperience * 2000; // 10000

    for (var skill in skills) {
      if (SkillBonus.containsKey(skill.toString())) {
        salary += SkillBonus[skill.toString()];
      } //
    }
    return salary;
  }

  String get names => name;
  double get salary => baseSalary;
  int get yearExperience => yearExperience;

  void printDetails() {
    print(
        'Employee: $name, Salary: \$${computeSalary(baseSalary, yearOfExperience, skills)}, Year of Experience: ${yearOfExperience} \n Skills: $skills \n');
  }
}

void main() {
  String name = 'Sokea';
  double salary = 40000;
  int yearOfExperience = 4;
  var emp1 = Employee.mobileDeveloper(name, salary, yearOfExperience);
  // emp1.computeSalary(salary, yearOfExperience, emp1.skills);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, 5);
  emp2.addSkill(Skill.DART);
  emp2.printDetails();
}
