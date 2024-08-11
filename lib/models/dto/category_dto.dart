import 'dart:convert';

class CategoryDto {
  final String name;
  final String image;
  CategoryDto({
    required this.name,
    required this.image,
  });

  CategoryDto copyWith({
    String? name,
    String? image,
  }) {
    return CategoryDto(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    return CategoryDto(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDto.fromJson(String source) =>
      CategoryDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryDto(name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryDto other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
