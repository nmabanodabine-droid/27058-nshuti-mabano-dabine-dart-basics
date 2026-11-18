
// Student: Nshuti Mabano Dabine
// Reg no: 27058

const String regNo = '27058';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
int countVowels(String text) {
  // by NMD
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    String letter = text[i].toLowerCase();

    if ('aeiou'.contains(letter)) {
      count++;
    }
  }

  return count;
}

// B3: Get initials
String initials(String fullName) {
  // by NMD
  String cleanedName = fullName.trim();

  if (cleanedName.isEmpty) {
    return '';
  }

  List<String> names = cleanedName.split(RegExp(r'\s+'));
  String result = '';

  for (String name in names) {
    result += '${name[0].toUpperCase()}.';
  }

  return result;
}

// C5: Draw a triangle
void drawTriangle(int height) {
  // by NMD
  int row = 1;

  while (row <= height) {
    String spaces = List.filled(height - row, ' ').join();
    String symbol = row.isEven ? '#' : '*';
    String pattern = List.filled(row, symbol).join();

    print(spaces + pattern);
    row++;
  }
}

// D2: Calculate MoMo transaction fee
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

// D2: Mask a phone number
String maskPhone(String phone) {
  // by NMD
  if (phone.length != 10) {
    return 'INVALID';
  }

  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by NMD
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String myName = 'Nshuti Mabano Dabine';
  print('$myName has ${countVowels(myName)} vowels');

  // B3
  print(initials('Nshuti Mabano Dabine'));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
}
