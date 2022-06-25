class CommentModel {
  String? doctorName;
  String? massage;

  CommentModel({this.doctorName, this.massage});

  CommentModel.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctorName'];
    massage = json['massage'];
  }

  Map<String, dynamic> get toMap => {
        "doctorName": doctorName,
        "massage": massage,
      };
}
