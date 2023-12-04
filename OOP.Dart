 class Laptop{
    String name;
    int id;
    int ram;
    
    Laptop(this.name,this.id,this.ram);

     void printinfo() {
    print('Laptop ID: $id, Name: $name, RAM: $ram GB');
     }
  }

void main(){
  Laptop obj1 = new Laptop("Lenovo",1,16);
  Laptop obj2 = new Laptop("HP",2,8);
  Laptop obj3 = new Laptop("Mac",3,16);
  
  obj1.printinfo();
  obj2.printinfo();
  obj3.printinfo();
}