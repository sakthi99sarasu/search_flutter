List<SearchModel> productsFromJson(dynamic str) => List<SearchModel>.from(
    (str).map((x) => SearchModel.fromJson(x)));

class SearchModel {
  int? id;
  String? category;
  String? sub_category;
  String? sname1;
  String? balance_number;
  String? elemination_number;

  SearchModel(
      {this.id,
      this.category,
      this.sub_category,
      this.sname1,
      this.balance_number,
      this.elemination_number});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    sub_category = json['sub_category'];
    sname1 = json['sname1'];
    balance_number = json['balance_number'];
    elemination_number = json['elemination_number'];

    //print(song_id);
  }
  // String name;
  // String quantity;
  // SearchModel(this.name, this.quantity);
  // factory SearchModel.fromJson(dynamic json) {
  //   return SearchModel(
  //       json['song_album'] as String, json['song_name'] as String);
  // }
  // @override
  // String toString() {
  //   return ' ${this.name}, ${this.quantity} ';
  // }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['category'] = category;
    data['sub_category'] = sub_category;
    data['sname1'] = sname1;
    data['balance_number'] = balance_number;
    data['elemination_number'] = elemination_number;

    return data;
  }
}

// class Tag {
//   String name;
//   String quantity;
//   Tag(this.name, this.quantity);
//   factory Tag.fromJson(dynamic json) {
//     return Tag(json['song_album'] as String, json['song_name'] as String);
//   }
//   @override
//   String toString() {
//     return '{ ${this.name} ,${this.quantity} }';
//   }
// }
