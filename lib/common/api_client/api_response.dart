class ApiResponse {
  ApiResponse({this.success, this.data, this.message});

  ApiResponse.fromJson(Map<String?, dynamic> json) {
    success = json['success'] == true;
    data = json['data'];
    message = json['message'];
  }

  bool? success;
  dynamic data;
  String? message;

  bool isSuccess() => success ?? false;
}
