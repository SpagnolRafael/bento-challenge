class ProductData {
  static String json(String id) {
    if (id == "JKJHK23HTHTJH2TBJ2H") {
      return '''
{
  "id": "JKJHK23HTHTJH2TBJ2H",
  "name": "Orange",
  "shop": "Alisha Mart",
  "images": [
    "assets/images/oranges01.webp",
    "assets/images/oranges02.jpg",
    "assets/images/oranges03.jpg"
  ],
  "categories": [
  {
    "name": "Fruits",
    "image":"assets/icons/fruits.png"
  },
   {
    "name": "Halal Food",
    "image":"assets/icons/halal.png"
  },
   {
    "name": "Gluten Free",
    "image":"assets/images/gluten-free.png"
  }
  ],
  "value": 8.15,
  "discount": 1.22,
  "rating": 4.7,
  "description": "Orange is a round, orange-colored citrus fruit known for its sweet and slightly tangy flavor. It is produced by the orange tree, which is an evergreen tree in the Rutaceae family. Oranges are one of the most popular fruits worldwide, and they are primarily cultivated for their juicy, segmented flesh. This fruit is a rich source of vitamin C and other essential nutrients. The orange is closely related to other citrus fruits such as grapefruit, lemon, and lime, and it comes in various varieties, including sweet oranges, blood oranges, and navel oranges. Oranges are not only enjoyed fresh but also widely used in the production of juices, marmalades, and culinary dishes."
}
''';
    } else {
      return '''
{
  "id": "SEF7S98EFSEG6SGSD8",
  "name": "Cabbage",
  "shop": "Alisha Mart",
  "images": [
    "assets/images/cabbage01.jpg",
    "assets/images/cabbage02.jpeg",
    "assets/images/cabbage03.jpg"
  ],
  "categories": [
  {
    "name": "Vegetarian",
    "image":"assets/icons/leafs.png"
  },
   {
    "name": "Halal Food",
    "image":"assets/icons/halal.png"
  },
   {
    "name": "Gluten Free",
    "image":"assets/images/gluten-free.png"
  }
  ],
  "value": 6.48,
  "discount": 1.13,
  "rating": 4.5,
  "description": "Cabbage is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage, and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower; Brussels sprouts; and Savoy cabbage."
}
''';
    }
  }
}
