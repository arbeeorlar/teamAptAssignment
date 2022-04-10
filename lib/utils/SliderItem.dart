class SliderModel {
  String? title;
  String? description;
  String? icon;
  bool? isLike;
  String? amount;

  SliderModel(
      {this.title, this.description, this.icon, this.isLike, this.amount});
}

class SliderContent {
  List<SliderModel> getSliderItem() {
    List<SliderModel> sideBarMenu = [
      SliderModel(
          title: "Audi",
          description: "GL 5000",
          icon: "images/one.jpg",
          isLike: false,
          amount: "\$50"),
      SliderModel(
          title: "Benz",
          description: "GL 5000",
          icon: "images/two.jpg",
          isLike: false,
          amount: "\$60"),
      SliderModel(
          title: "G-wagon",
          description: "GL 5000",
          icon: "images/three.jpg",
          isLike: false,
          amount: "\$70"),
      SliderModel(
          title: "Lambo",
          description: "GL 5000",
          icon: "images/four.jpg",
          isLike: false,
          amount: "\$80"),
      SliderModel(
          title: "Ferarri",
          description: "Ferrari 5000",
          icon: "images/five.jpg",
          isLike: false,
          amount: "\$90"),
      SliderModel(
          title: "Muscle",
          description: "Camry 5000",
          icon: "images/six.jpg",
          isLike: false,
          amount: "\$150"),
      SliderModel(
          title: "Pencil",
          description: "Camry 5000",
          icon: "images/seven.jpg",
          isLike: false,
          amount: "\$200"),
      SliderModel(
          title: "Big Daddy",
          description: "Camry 5000",
          icon: "images/eight.jpg",
          isLike: false,
          amount: "\$150"),
    ];

    return sideBarMenu;
  }
}
