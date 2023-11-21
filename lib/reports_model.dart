class ReportsModel {
  String? title;
  String? url;

  ReportsModel({
    this.title,
    this.url,
  });

  ReportsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['url'] = url;
    return json;
  }
}
