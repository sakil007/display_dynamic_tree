class ResponseModel {
  String? title;
  bool hasParent = false;
  List<ResponseModel> items = [];
  ResponseModel({
    this.title,
    this.hasParent = false,
    required this.items,
  });
  ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null) {
      title = json['title'];
    }
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(ResponseModel.fromJson(v));
      });
    }
  }
}
