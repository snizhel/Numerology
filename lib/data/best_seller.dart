class BestSeller {
  final int id;
  final String image;
  final String name;
  final String instructor;
  final double rating;
  final double price;

  const BestSeller({this.id, this.image, this.name, this.instructor, this.rating, this.price});
}

class BestSellerList {
  static List<BestSeller> list() {
    const data = <BestSeller> [
      BestSeller(
        id: 0,
        image: 'assets/images/best/1.png',
        name: 'Basic Graphics Course 2021',
        instructor: 'Farhana Khanom',
        rating: 5.0,
        price: 15.0,
      ),
      BestSeller(
          id: 1,
          image: 'assets/images/best/2.png',
          name: 'Advanced Development',
          instructor: 'James Williams',
          rating: 4.5,
          price: 49.0,
      ),
    ];
    return data;
  }
}