class RiderModel {
  static RiderModel? model;
  final String riderAddress;
  final String riderName;
  final String riderImage;
  final String riderMobile;

  RiderModel({

    required this.riderAddress,
    required this.riderName,
    required this.riderImage,
    required this.riderMobile,
  });

  factory RiderModel.fromJson(Map<String, dynamic> json) {
    return RiderModel(
      riderAddress: json['rider_address'],
      riderImage: json['rider_image'],
      riderMobile: json['rider_phone'],
      riderName: json['rider_name'],
    );



  }
  factory RiderModel.toJson(Map<String, dynamic> json) {
    return RiderModel(
      riderAddress: json['rider_address'],
      riderImage: json['rider_image'],
      riderMobile: json['rider_phone'],
      riderName: json['rider_name'],
    );



  }
}
