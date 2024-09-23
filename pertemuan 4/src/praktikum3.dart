void main() {
  var gifts = {
    // Key : Value
    'first' : 'partridge',
    'second' : 'turtledoves',
    'fifth' : 1
  };
  var nobleGases = {
    2 : 'helium',
    10 : 'neon',
    18 : 2,
  };

  // Menambahkan nama dan nim sebagai key-value pairs
  var mhs1 = Map<String, String>();
  mhs1['Nama'] = 'Cahyo Adi Prasetia'; // Menambahkan nama
  mhs1['NIM'] = '2241720191'; // Menambahkan nim
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  // Menambahkan nama dan nim menggunakan key bertipe int
  var mhs2 = Map<int, String>();
  mhs2[1] = 'Cahyo Adi Prasetia'; // Menambahkan nama
  mhs2[2] = '2241720191'; // Menambahkan nim
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}