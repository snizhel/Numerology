class LatestCourse {
  final int id;
  final String image;
  final String name;
  final String instructor;
  final double rating;
  final double price;

  const LatestCourse({this.id, this.image, this.name, this.instructor, this.rating, this.price});
}

class LatestCourseList {
  static List<LatestCourse> list() {
    const data = <LatestCourse> [
      LatestCourse(
        id: 0,
        image: 'assets/images/latest/1.png',
        name: 'Donec sodalesa magna',
        instructor: 'David Luiz',
        rating: 5.0,
        price: 15.0,
      ),
      LatestCourse(
          id: 1,
          image: 'assets/images/latest/2.png',
          name: 'Advanced UI/UX Courses',
          instructor: 'Robat Jhonson',
          rating: 4.5,
          price: 49.0,
      ),
      LatestCourse(
          id: 2,
          image: 'assets/images/latest/3.png',
          name: 'Digital Marketing Courses',
          instructor: 'James Williams',
          rating: 5.0,
          price: 20.0,
      ),
    ];
    return data;
  }
}