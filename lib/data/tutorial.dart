class Tutorial {
  final int id;
  final String name;
  final bool isFree;

  const Tutorial({this.id, this.name, this.isFree});
}

class TutorialList {
  static List<Tutorial> list() {
    const data = <Tutorial> [
      Tutorial(
        id: 1,
        name: 'Introduction',
        isFree: false
      ),
      Tutorial(
          id: 2,
          name: 'Chapter',
          isFree: true
      ),
      Tutorial(
          id: 3,
          name: 'Art & Design',
          isFree: true
      ),
      Tutorial(
          id: 4,
          name: 'Business',
          isFree: true
      ),
    ];
    return data;
}
}