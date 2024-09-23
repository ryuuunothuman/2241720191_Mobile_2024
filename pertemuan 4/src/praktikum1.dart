void main() {
  final List<Object?> list = [5, null, null];
  list[1] = 'Cahyo Adi Prasetia';
  list[2] = '2241720191';
  assert(list.length == 3);
  assert(list[1] == 'Cahyo Adi Prasetia');
  print(list.length);
  print(list[1]);
  print(list[2]);

  list[1] = 5;
  assert(list[1] == 5);
  print(list[1]);
}