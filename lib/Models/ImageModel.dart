class ImageModel{
  final String imageUrl; //to show lowered quality picture
  final String downloadUrl; //to download high quality picture

  const ImageModel({
    required this.imageUrl,
    required this.downloadUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'mediumURl': imageUrl,
      'downloadUrl': downloadUrl,
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      downloadUrl: json['src']['large2x'] ?? "",
      imageUrl: json['src']['portrait'] ?? "",
    );
  }
}