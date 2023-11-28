class IntroData {
  final String title;
  final String subTitle;
  final String image;

  const IntroData({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<IntroData> get values => [
        IntroData(
          title: "Discover something new",
          subTitle: "Special new arrivals just for you",
          image: "intro_one.png",
        ),
        IntroData(
          title: "Update trendy outfit",
          subTitle: "Favorite brands and hottest trends",
          image: "intro_two.png",
        ),
        IntroData(
          title: "Explore your true style",
          subTitle: "Relax and let us bring the style to you",
          image: "intro_three.png",
        ),
      ];
}
