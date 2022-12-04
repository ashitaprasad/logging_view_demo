class MenuModel {
  Menu? menu;

  MenuModel({this.menu});

  MenuModel.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    return data;
  }
}

class Menu {
  String? header;
  List<Items>? items;

  Menu({this.header, this.items});

  Menu.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['header'] = header;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? label;

  Items({this.id, this.label});

  Items.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    label = json?['label'];
  }

  Map<String, dynamic>? toJson() {
    if (id == null && label == null) return null;
    Map<String, dynamic> data = {};
    data['id'] = id;
    if (label != null) data['label'] = label;
    return data;
  }
}
