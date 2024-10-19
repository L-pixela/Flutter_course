class BankAccount {
  final int _id;
  final String _username;
  double _balance = 0;
//getter
  int get id => _id;
  String get username => _username;
  double get balance => _balance;
//constructor
  BankAccount(this._id, this._username);
//credit function
  void credit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      throw Exception('Credit amount must be positive!');
    }
  }

//withdraw function
  void withdraw(double amount) {
    try {
      if (_balance >= amount) {
        _balance -= amount;
      } else {
        throw Exception("Insufficent Amount!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return "Account ID: $_id, Owner: $_username, Balance: $_balance";
  }
}

class Bank {
  final String _name;
  final Map<int, BankAccount> _accounts = {};

  String get name => _name;

  Bank(this._name);

  BankAccount createAccount(int accountId, String accountName) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account ID is already exists!');
    }
    BankAccount newAccount = BankAccount(accountId, accountName);
    _accounts[accountId] = newAccount;
    return newAccount;
  }

  BankAccount? getAccount(int accountId) {
    return _accounts[accountId];
  }

  void deleteAccount(int accountId) {
    if (_accounts.containsKey(accountId)) {
      _accounts.remove(accountId);
    } else {
      throw Exception('Account not found.');
    }
    ;
  }

  List<BankAccount> listAccounts() {
    return _accounts.values.toList();
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  print(ronanAccount);
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  print(ronanAccount);
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50
  print(ronanAccount);

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
