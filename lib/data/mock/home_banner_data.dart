class HomeBannerData {
  static String json = '''
{
"banners": [
  {
    "url": "assets/images/banner-01.jpeg"
  },
  {
    "url": "assets/images/banner-01.jpeg"
  },
  {
    "url": "assets/images/banner-01.jpeg"
  }
],
"categories": [
  {
  "name": "Vegan",
  "image":"assets/icons/vegan.png"
  },
   {
  "name": "Meat",
  "image":"assets/icons/meat.png"
  },
   {
  "name": "Fruits",
  "image":"assets/icons/fruit.png"
  },
   {
  "name": "Milk",
  "image":"assets/icons/milk.png"
  },
   {
  "name": "Fish",
  "image":"assets/icons/fish.png"
  }
],
"default_category": "Vegan",
"recommendations": 
[
  {
    "name" : "Orange",
    "image" : "assets/images/orange.png",
    "value" : 1.99,
    "rating" : 4.7
  },
    {
    "name" : "Cabbage",
    "image" : "assets/images/cabbage.png",
    "value" : 2.46,
    "rating" : 4.5
  }
]
}
''';
}
