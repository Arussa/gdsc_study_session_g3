// ignore_for_file: file_names

class Animal {
  String name;
  int id;
  String color;

  Animal(this.name, this.id, this.color);
}

class Cat extends Animal {
  String sound;

  Cat(int id, String name, String color, this.sound) : super(name, id, color);

  void printcxcs() {
    // ignore: avoid_print
    print('Details: Animal Name: $name id: $id color: $color Sound: $sound');
  }
}

void main() {
  Cat habibi = Cat(1, 'Jago', 'Black', 'Roar');
  habibi.printcxcs();
}
