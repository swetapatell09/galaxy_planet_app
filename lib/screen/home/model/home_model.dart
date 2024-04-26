class PlanetModel {
  String? name, image, description;

  PlanetModel({this.name, this.image, this.description});

  factory PlanetModel.mapToModel(Map m1) {
    return PlanetModel(
        image: m1['image'], name: m1['name'], description: m1['description']);
  }
}
