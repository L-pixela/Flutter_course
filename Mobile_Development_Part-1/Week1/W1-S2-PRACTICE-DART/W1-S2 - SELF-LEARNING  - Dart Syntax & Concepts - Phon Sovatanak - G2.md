
## **SELF-LEARNING 1 - Dart Syntax & Concepts**

### Phon Sovatanak (G2, IDTB090157)
 
To assess your understanding, you need to complete and submit this handout on MS Team

### **Objectives**
By completing this handout, you will:
1. Apply type inference for variable declarations.
2. Handle nullable and non-nullable variables.
3. Differentiate between `final` and `const`.
4. Manipulate strings, lists, and maps.
5. Use loops and conditions to control flow.
6. Define and call functions with positional and named arguments, understand arrow syntax 


### **Resources**
To help you complete this handout, use the following resources:
- [Variables](https://dart.dev/language/variables)
- [Null Safety](https://dart.dev/null-safety)
- [Built-in types](https://dart.dev/language/built-in-types)
- [Lists](https://dart.dev/language/collections)
- [Loops](https://dart.dev/language/loops)
- [Conditions](https://dart.dev/language/branches)
- [Functions](https://dart.dev/guides/language/language-tour#functions)

You can write you code on VS Code, or using this online editor
- [Install Dart and Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Online Dart Compiler](https://dartpad.dev/)

### **What You Need to Do**
1. For each `EXPLAIN`: Answer the question your own words, and illutrate with a code example
2. For each `CODE`: Provide code examples that illustrate the concepts.
---

### **Handout Structure: Dart Syntax and Concepts**

#### **1. Type Inference**


`EXPLAIN` : Explain how Dart infers the type of a variable.

`ANSWER` : Dart can determine the type of variable because of the initialization of the data type, when initialized with a value, it will know what data type it is.

`CODE` : Complete the bellow code to illustrate the concepts:

  ```dart
void main(){
    // Declare a int variable and let Dart infer its type
    var myInt = 12; // Dart will infers that the variable is an integer because the value is an integer.
    print(myInt);

    // Define a variable with an explicit String type
    String myName = "Hi, I'm Phon Sovatanak.";
    print(myName);
}
  ```

---

#### **2. Nullable and Non-Nullable Variables**

`EXPLAIN` : Explain nullable vs non-nullable variables.

`ANSWER` : Nullable variables is when the variables can be declared without the value. While non-nullable variables can not be declared without the value.

`EXPLAIN` : When is it useful to have nullable variables?

`ANSWER` : It is when you want to declare a variable for later used where you can change its value easily.

`CODE` : Complete the bellow code to illustrate the concepts:

  ```dart
  void main(){
    // Declare a nullable integer variable and assign it a null value

    int? nullableVar;

    nullableVar = 10;

    print(nullableVar);

    // Declare a non-nullable integer variable and assign it a value

    int nonNullableVar = 1;

    print(nonNullableVar);

    // Assign a new value to the nullable variable

    nullableVar = 20;

    print(nullableVar);
}
  ```

---

#### **3. Final and const**

`EXPLAIN` : Describe the difference between `final` and `const`.

`ANSWER` : A final variable can be set only once and it is initialized when accessed. and the const variable is implicitly final but it is a compile-time constant.

`CODE` : Complete the bellow code to illustrate the concepts:


  ```dart
// Declare a final variable and assign it the current date and time
void main() {
    final dateNow = DateTime.now();
    print(dateNow);
}

// Can you declare this variable as const? Why?
// This variable can not be declared since the const is a compile-time constant so it required fixed value even before the running the program.

// Declare a const variable with a integer value

void main() {
    const number = 10;
    print(number);
}

// Can you reassign the value of this final variable? Why?
// You can not reassign another value of the final variable as you can only set value to each final variable once and can not be change after assigning it. 
  ```

---

#### **4. Strings, Lists and Maps**

`CODE` : Complete the bellow code to illustrate the concepts:

  - **Strings:**
    ```dart
    void main(){
      // Declare two strings: firstName and lastName and an integer:age
      
      String lastName = "Joe";
      String firstName = "Weller";
      int age = 20;

      // Concatenate the 2 strings and the age 

      String fullName = lastName + " " + firstName;

      // Print result

      print("I am ${fullName}. I'm ${age} years old.");
    }
    ```

  - **Lists:**
    ```dart
    void main(){
      // Create a list of integers

        var numbers = [12,23,23,12,32,11];

      // Add a number to the list

        numbers.add(23);

      // Remove a number from the list

        numbers.remove(12);

      // Insert a number at a specific index in the list

        numbers[1] = 21;

      // Iterate over the list and print each number
        for(int i =0;i<(numbers.length);i++){
        print(numbers[i]);
        }
    }
    ```

  - **Maps:**
    ```dart
    void main(){
      // Create a map with String keys and integer values

      Map<String, int> book = {
        'Nasa' : 1,
        'Elon Musks' : 2,
        'Titanic' : 3,
        'Computer' : 4
      };

      // Add a new key-value pair to the map
      
      book["Nike"] = 5;

      // Remove a key-value pair from the map

      book.remove("Nike");

      // Iterate over the map and print each key-value pair
      for(var keys in book.keys) {
        print('$keys: ${book[keys]}');
      }
    }
    ```

---

#### **5. Loops and Conditions**

`CODE` : Complete the bellow code to illustrate the concepts:

  ```dart
  void main(){
  // Use a for-loop to print numbers from 1 to 5

    for(int i = 1; i<=5 ;i++){
      print(i);
    }
  
  // Use a while-loop to print numbers while a condition is true

    int number = 1;
    while(number<=5){
      print(number);
      number++;
    }
  
  // Use an if-else statement to check if a number is even or odd
    int number = 1;
    
    if(number%2 == 0 && number>0){
      print("${number} is even.");
    }else if(number%2 == 1 && number>0){
      print("${number} is odd.");
    }else{
      print("${number} is negative.");
    }

  }
  ```

---

#### **6. Functions**

`EXPLAIN` : Compare positional and named function arguments

`ANSWER` : positional function argument is used according to order of the parameter while named function can be used unorderly.

`EXPLAIN` : Explain when and how to use arrow syntax for functions
Arrow syntax can be used when the functions are simple and short with simple return value. you can use it by declaring the function then point an arrow(=>) to the condition of the returning value instead of using the return.

`CODE` : Complete the bellow code to illustrate the concepts:

  - **Defining and Invoking a Function:**
    ```dart
    // Define a function that takes two integers and returns their sum

    int numSum(int num1,int num2){
    return num1 + num2;
    }

    // Call the function and print the result

    void main() {
      int sum1 = numSum(2,3);
      print("The result is ${sum1}.");    
    }
    ```

  - **Positional vs Named Arguments:**
    ```dart
    // Define a function that uses positional arguments

    void greeting(String name, int age) {
      print("Hello, I'm ${name} and I'm ${age} years old.");
    }

    // Define another function that uses named arguments with the required keyword (ex: getArea with rectangle arguments)

    void getArea({int base = 4 ,int height = 5}) {
      double areaTri = (base * height) / 2;
      print("The Area of the Triangle is ${areaTri}.");
    }

    // Call both functions with appropriate arguments
    void main() {
      greeting("Alice", 20);
      getArea(base : 5);
    }
    ```

`EXPLAIN` : Can positional arguement be ommited? Show an example

`ANSWER` : Positional arguemnt can not be omitted. Because positional arguement required all of the parameter to be filled and in order. If you run the code example below, it will show an error run-time since age is missing.
```dart
void greeting(String name, int age) {
      print("Hello, I'm ${name} and I'm ${age} years old.");
}
void main() {
      greeting("Alice");
}
```


`EXPLAIN` : Can named arguement be ommited? Show an example

`ANSWER` : Named argument can be omitted. Because when you set a default value to the function and then you want to change the value of it, you can use the name of the parameter and set the value of it with or without the right order of the param.
```dart
void getArea({int base = 4 ,int height = 5}) {
      double areaTri = (base * height) / 2;
      print("The Area of the Triangle is ${areaTri}.");
}
void main() {
      getArea(base : 5);
}
```


  - **Arrow Syntax:**
    ```dart
    // Define a function using arrow syntax that squares a number

    int squareNum(int num) => num * num;

    // Call the arrow function and print the result
    void main() {
      print("${squareNum(5)}");
    }
    ```

---
 