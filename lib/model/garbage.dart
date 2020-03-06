class Garbage {

  //--- Name Of Garbage
  final String name;
  //-- image
  final String image;

  Garbage({this.name,this.image});

  static List<Garbage> allGarbage()
  {
    var lstOfGarbage = new List<Garbage>();

    lstOfGarbage.add(new Garbage(name:"Tiger Circle",image: "uploads/1.jpg"));
    lstOfGarbage.add(new Garbage(name:"Malpe",image: "uploads/2.jpg"));
    lstOfGarbage.add(new Garbage(name:"IC",image: "uploads/3.jpg"));
    lstOfGarbage.add(new Garbage(name:"Ahmedabad",image: "uploads/4.jpeg"));
    lstOfGarbage.add(new Garbage(name:"Endpoint",image: "uploads/5.jpeg"));
    lstOfGarbage.add(new Garbage(name:"Student Plaza",image: "uploads/6.jpeg"));
    return lstOfGarbage;
  }
}
