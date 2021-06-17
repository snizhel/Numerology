class Instructor {
  final int id;
  final String image;
  final String name;
  final String expert;
  final double rating;

  const Instructor({this.id, this.image, this.name, this.expert, this.rating});
}

class InstructorList {
  static List<Instructor> list() {
    const data = <Instructor> [
      Instructor(
        id: 0,
        image: 'assets/images/instructor/1.png',
        name: 'Robat Jonson',
        expert: 'Web Development',
        rating: 5.0
      ),
      Instructor(
          id: 1,
          image: 'assets/images/instructor/2.png',
          name: 'Evant Williams',
          expert: 'UX Design',
          rating: 4.5
      ),
      Instructor(
          id: 2,
          image: 'assets/images/instructor/3.png',
          name: 'Priyanka Das',
          expert: 'Digital Marketing',
          rating: 5.0
      ),
      Instructor(
          id: 3,
          image: 'assets/images/instructor/4.png',
          name: 'Devos Watson',
          expert: 'App Developer',
          rating: 5.0
      ),
    ];
    return data;
  }
}