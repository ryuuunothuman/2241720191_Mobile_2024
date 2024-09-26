main() {
  var mahasiswa2 = ('first', 'Cahyo Adi Prasetia', '2241720191', b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.$2); // Prints NAMA
  print(mahasiswa2.$3); // Prints NIM
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$4); // Prints 'last'

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Cahyo Adi Prasetia', 2241720191);
  print(mahasiswa);
  var record = {'first': 'first', 'a': 2, 'b': true, 'last': 'last'};
  print('before move: $record');

  var result = move(record);
  print('after move: $result');
}

Map<String, dynamic> move(Map<String, dynamic> record) {
  var temp = record['a'];
  record['a'] = record['b'];
  record['b'] = temp;

  return record;
}