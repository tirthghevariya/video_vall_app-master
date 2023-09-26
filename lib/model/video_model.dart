class VideoModel {
  List<String>? _data;

  VideoModel({List<String>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<String>? get data => _data;
  set data(List<String>? data) => _data = data;

  VideoModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this._data;
    return data;
  }
}
