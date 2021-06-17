class Review {
  final int id;
  final String name;
  final String image;
  final String time;
  final double rating;
  final String comment;

  const Review({this.id, this.name, this.image, this.time, this.rating, this.comment});
}

class ReviewList {
  static List<Review> list() {
    const data = <Review> [
      Review(
        id: 1,
        name: 'Jonson Wiliam',
        image: 'assets/images/profile.png',
        time: '1',
        rating: 5,
        comment: 'Contrary to popular besimp and world class lyrandom text. It has roots',
      ),
      Review(
          id: 2,
          name: 'Shikha Melaine',
          image: 'assets/images/profile.png',
          time: '2',
        rating: 4,
        comment: 'Contrary to popular besimp and world class lyrandom text. It has roots',
      ),
      Review(
          id: 3,
          name: 'Fiza Kubila',
          image: 'assets/images/profile.png',
          time: '7',
        rating: 5,
        comment: 'Contrary to popular besimp and world class lyrandom text. It has roots',
      ),
    ];
    return data;
}
}