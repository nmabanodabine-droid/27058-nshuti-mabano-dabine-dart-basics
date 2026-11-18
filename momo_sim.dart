
// Student: Nshuti Mabano Dabine
// Reg no: 27058

const String regNo = '27058';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part F: MoMo transaction fee
int momoFee(int amount) {
  // by NMD
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// Format money with commas
String formatRwf(int amount) {
  // by NMD
  String digits = amount.abs().toString();
  String result = '';
  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      result += ',';
    }

    result += digits[i];
    i++;
  }

  String sign = amount < 0 ? '-' : '';
  return '$sign$result RWF';
}

// Validate a five-digit PIN
bool isValidPin(String pin) {
  // by NMD
  if (pin.length != 5) {
    return false;
  }

  if (pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) {
      return false;
    }

    i++;
  }

  bool allSame = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
      break;
    }

    i++;
  }

  return !allSame;
}

// Send money
int sendMoney(int balance, int amount) {
  // by NMD
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Buy airtime
int buyAirtime(int balance, int amount) {
  // by NMD
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime ${formatRwf(amount)} purchased. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

void main() {
  // by NMD
  print('Reg no: $regNo | D = $d | T = $t');

  // PIN validation tests
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('48218: ${isValidPin('48218')}');

  // formatRwf tests
  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(1250000));
  print(formatRwf(-5000));

  // Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int amountToSend = (d + 1) * 3000;

  balance = sendMoney(balance, amountToSend);
  balance = sendMoney(balance, amountToSend);
  balance = sendMoney(balance, amountToSend);

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid amount
  balance = sendMoney(balance, 0);

  // Test insufficient balance
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');
}
