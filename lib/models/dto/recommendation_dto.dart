import 'dart:convert';

class RecommendationDto {
  final String id;
  final String name;
  final num value;
  final num rating;
  final String? image;
  RecommendationDto({
    required this.id,
    required this.name,
    required this.value,
    required this.rating,
    this.image,
  });

  RecommendationDto copyWith({
    String? id,
    String? name,
    num? value,
    num? rating,
    String? image,
  }) {
    return RecommendationDto(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      rating: rating ?? this.rating,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'value': value,
      'rating': rating,
      'image': image,
    };
  }

  factory RecommendationDto.fromMap(Map<String, dynamic> map) {
    return RecommendationDto(
      id: map['id'] as String,
      name: map['name'] as String,
      value: map['value'] as num,
      rating: map['rating'] as num,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendationDto.fromJson(String source) =>
      RecommendationDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecommendationDto(id: $id, name: $name, value: $value, rating: $rating, image: $image)';
  }

  @override
  bool operator ==(covariant RecommendationDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.value == value &&
        other.rating == rating &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        value.hashCode ^
        rating.hashCode ^
        image.hashCode;
  }
}
