class CityModel {
  Links? links;
  int? page;
  int? perPage;
  int? totalPages;
  int? totalCities;
  List<Cities>? cities;
  String? countryCode;
  String? status;

  CityModel(
      {this.links,
      this.page,
      this.perPage,
      this.totalPages,
      this.totalCities,
      this.cities,
      this.countryCode,
      this.status});

  CityModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    page = json['page'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    totalCities = json['total_cities'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
    countryCode = json['country_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total_pages'] = this.totalPages;
    data['total_cities'] = this.totalCities;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    data['country_code'] = this.countryCode;
    data['status'] = this.status;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? next;
  String? previous;

  Links({this.first, this.last, this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class Cities {
  int? geonameid;
  int? population;
  String? name;
  double? latitude;
  double? longitude;
  Country? country;
  Division? division;

  Cities(
      {this.geonameid,
      this.population,
      this.name,
      this.latitude,
      this.longitude,
      this.country,
      this.division});

  Cities.fromJson(Map<String, dynamic> json) {
    geonameid = json['geonameid'];
    population = json['population'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['geonameid'] = this.geonameid;
    data['population'] = this.population;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    return data;
  }
}

class Country {
  String? code;

  Country({this.code});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class Division {
  String? code;
  int? geonameid;

  Division({this.code, this.geonameid});

  Division.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    geonameid = json['geonameid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['geonameid'] = this.geonameid;
    return data;
  }
}
