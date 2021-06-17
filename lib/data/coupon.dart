class Coupon {
  final int id;
  final String image;
  final String voucher;
  final String title;
  final double discount;

  const Coupon({this.id, this.image, this.voucher, this.title, this.discount});
}

class CouponList {
  static List<Coupon> list() {
    const data = <Coupon> [
      Coupon(
        id: 0,
        image: 'assets/images/coupon/1.png',
        voucher: 'AHGGZFZA',
        title: 'Web Development',
        discount: 5.0
      ),
      Coupon(
          id: 1,
          image: 'assets/images/coupon/2.png',
          voucher: 'PLIJKTGJ',
          title: 'UX Design',
          discount: 4.5
      ),
      Coupon(
          id: 2,
          image: 'assets/images/coupon/3.png',
          voucher: 'JSWEDU',
          title: 'Digital Marketing',
          discount: 5.0
      ),
      Coupon(
          id: 3,
          image: 'assets/images/coupon/4.png',
          voucher: 'YH123KIL',
          title: 'App Developer',
          discount: 5.0
      ),
    ];
    return data;
  }
}