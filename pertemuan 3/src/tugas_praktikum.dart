void main(){
  String nama = "Cahyo Adi Prasetia";
  String nim = "2241720191";

  for (int number = 2; number <= 201; number++){
    if (isPrime(number)){
      print("$number adalah bilangan prima.");
      print("NAMA : $nama");
      print("NIM : $nim");
    }
  }
}

bool isPrime(int number){
  if (number <= 1){
    return false;
  }
  for (int i = 2; i <= number / 2; i++){
    if (number % i == 0){
      return false;
    }
  }
  return true;
}