void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list); // Mengganti variabel 'list1' dengan 'list'
  print(list2);
  print(list2.length);

  var list1 = [1, 2, null]; // Mendeklarasikan list 1
  print(list1);
  var list3 = [0, ...?list1]; // Menggunakan null-aware spread
  print(list3);
  print(list3.length);

  // Menambahkan NIM ke dalam list
  var nim = '2241720191';
  var listnim = [0, ...?list, nim]; // Menggunakan spread operator untuk menambahkan variabel 'nim' ke dalam list
  print(listnim);
  print(listnim.length);

  bool promoActive = true; // Deklarasi promoActive
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  var login = 'Manager'; // Deklarasi login
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav2);

  var listofInts = [1, 2, 3];
  var listofString = ['#0', for (var i in listofInts) '#${i}']; // String interpolation
  assert(listofString[1] == '#1');
  print(listofString);
}

