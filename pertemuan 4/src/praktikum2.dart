void main() {
  // Menghapus variabel 'halogens'
  
  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  
  // Menambahkan nama dan NIM ke 'names1' menggunakan .add()
  names1.add('Cahyo Adi Prasetia');
  names1.add('2241720191');

  // Menambahkan nama dan NIM ke 'names2' menggunakan .addAll()
  names2.addAll(['Cahyo Adi Prasetia', '2241720191']);

  // Mencetak isi dari kedua set
  print(names1);
  print(names2);
}