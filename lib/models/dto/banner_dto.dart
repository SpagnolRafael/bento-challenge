import 'dart:convert';

class BannerDto {
  final String url;
  BannerDto({
    required this.url,
  });

  BannerDto copyWith({
    String? url,
  }) {
    return BannerDto(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory BannerDto.fromMap(Map<String, dynamic> map) {
    return BannerDto(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerDto.fromJson(String source) =>
      BannerDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BannerDto(url: $url)';

  @override
  bool operator ==(covariant BannerDto other) {
    if (identical(this, other)) return true;

    return other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
