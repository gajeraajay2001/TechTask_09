class InfoModel {
  String? fName;
  String? lName;
  String? gender;
  String? age;
  String? streetNo;
  String? city;
  String? state;
  String? country;

  InfoModel(
      {this.fName,
      this.gender,
      this.age,
      this.city,
      this.country,
      this.lName,
      this.state,
      this.streetNo});
}

class InfoData {
  String? id;
  String? fName;
  String? lName;
  String? age;
  String? city;
  String? country;
  String? gender;
  String? state;
  String? streetNo;

  InfoData(
      {this.id,
      this.fName,
      this.lName,
      this.age,
      this.city,
      this.country,
      this.gender,
      this.state,
      this.streetNo});

  InfoData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fName = json['fName'];
    lName = json['lName'];
    age = json['age'];
    city = json['city'];
    country = json['country'];
    gender = json['gender'];
    state = json['state'];
    streetNo = json['streetNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['age'] = this.age;
    data['city'] = this.city;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['state'] = this.state;
    data['streetNo'] = this.streetNo;
    return data;
  }
}
