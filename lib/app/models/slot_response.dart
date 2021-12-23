class SlotResponse {
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  SlotResponse({bool? status, String? message, Data? data}) {
    _status = status;
    _message = message;
    _data = data;
  }

  SlotResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  String? _id;
  String? _name;
  String? _email;
  String? _labAddress;
  String? _longitude;
  String? _latitude;
  String? _image;
  List<TimeSlots>? _timeSlots;
  SelectedTest? _selectedTest;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get labAddress => _labAddress;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get image => _image;
  List<TimeSlots>? get timeSlots => _timeSlots;
  SelectedTest? get selectedTest => _selectedTest;

  Data(
      {String? id,
      String? name,
      String? email,
      String? labAddress,
      String? longitude,
      String? latitude,
      String? image,
      List<TimeSlots>? timeSlots,
      SelectedTest? selectedTest}) {
    _id = id;
    _name = name;
    _email = email;
    _labAddress = labAddress;
    _longitude = longitude;
    _latitude = latitude;
    _image = image;
    _timeSlots = timeSlots;
    _selectedTest = selectedTest;
  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _labAddress = json["lab_address"];
    _longitude = json["longitude"];
    _latitude = json["latitude"];
    _image = json["image"];
    if (json["time_slots"] != null) {
      _timeSlots = [];
      json["time_slots"].forEach((v) {
        _timeSlots?.add(TimeSlots?.fromJson(v));
      });
    }
    _selectedTest = json["selected_test"] != null
        ? SelectedTest.fromJson(json["selected_test"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["email"] = _email;
    map["lab_address"] = _labAddress;
    map["longitude"] = _longitude;
    map["latitude"] = _latitude;
    map["image"] = _image;
    if (_timeSlots != null) {
      map["time_slots"] = _timeSlots?.map((v) => v.toJson()).toList();
    }
    if (_selectedTest != null) {
      map["selected_test"] = _selectedTest?.toJson();
    }
    return map;
  }
}

class SelectedTest {
  String? _id;
  String? _testId;
  String? _name;
  String? _price;
  String? _preparation;
  String? _useOfTest;
  String? _components;
  String? _testInfo;
  String? _doDont;
  String? _image;
  List<Test>? _test;

  String? get id => _id;
  String? get testId => _testId;
  String? get name => _name;
  String? get price => _price;
  String? get preparation => _preparation;
  String? get useOfTest => _useOfTest;
  String? get components => _components;
  String? get testInfo => _testInfo;
  String? get doDont => _doDont;
  String? get image => _image;
  List<Test>? get test => _test;

  SelectedTest(
      {String? id,
      String? testId,
      String? name,
      String? price,
      String? preparation,
      String? useOfTest,
      String? components,
      String? testInfo,
      String? doDont,
      String? image,
      List<Test>? test}) {
    _id = id;
    _testId = testId;
    _name = name;
    _price = price;
    _preparation = preparation;
    _useOfTest = useOfTest;
    _components = components;
    _testInfo = testInfo;
    _doDont = doDont;
    _image = image;
    _test = test;
  }

  SelectedTest.fromJson(dynamic json) {
    _id = json["id"];
    _testId = json["test_id"];
    _name = json["name"];
    _price = json["price"];
    _preparation = json["preparation"];
    _useOfTest = json["use_of_test"];
    _components = json["components"];
    _testInfo = json["test_info"];
    _doDont = json["do_dont"];
    _image = json["image"];
    if (json["test"] != null) {
      _test = [];
      json["test"].forEach((v) {
        _test?.add(Test.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["test_id"] = _testId;
    map["name"] = _name;
    map["price"] = _price;
    map["preparation"] = _preparation;
    map["use_of_test"] = _useOfTest;
    map["components"] = _components;
    map["test_info"] = _testInfo;
    map["do_dont"] = _doDont;
    map["image"] = _image;
    if (_test != null) {
      map["test"] = _test?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Test {
  String? _id;
  String? _name;
  String? _price;
  String? _preparation;
  String? _useOfTest;
  String? _components;
  String? _testInfo;
  String? _doDont;
  String? _image;

  String? get id => _id;
  String? get name => _name;
  String? get price => _price;
  String? get preparation => _preparation;
  String? get useOfTest => _useOfTest;
  String? get components => _components;
  String? get testInfo => _testInfo;
  String? get doDont => _doDont;
  String? get image => _image;

  Test(
      {String? id,
      String? name,
      String? price,
      String? preparation,
      String? useOfTest,
      String? components,
      String? testInfo,
      String? doDont,
      String? image}) {
    _id = id;
    _name = name;
    _price = price;
    _preparation = preparation;
    _useOfTest = useOfTest;
    _components = components;
    _testInfo = testInfo;
    _doDont = doDont;
    _image = image;
  }

  Test.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _price = json["price"];
    _preparation = json["preparation"];
    _useOfTest = json["use_of_test"];
    _components = json["components"];
    _testInfo = json["test_info"];
    _doDont = json["do_dont"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["preparation"] = _preparation;
    map["use_of_test"] = _useOfTest;
    map["components"] = _components;
    map["test_info"] = _testInfo;
    map["do_dont"] = _doDont;
    map["image"] = _image;
    return map;
  }
}

class TimeSlots {
  TimeSlots({
    this.date,
    this.week,
    this.openTime,
    this.closeTime,
    this.slot,
    this.bookedDate,
  });

  String? date;
  String? week;
  String? openTime;
  String? closeTime;
  List<String>? slot;
  dynamic bookedDate;

  factory TimeSlots.fromJson(Map<String, dynamic> json) => TimeSlots(
        date: json["date"],
        week: json["week"],
        openTime: json["open_time"] == null ? null : json["open_time"],
        closeTime: json["close_time"] == null ? null : json["close_time"],
        slot: List<String>.from(json["slot"]?.map((x) => x == null ? '' : x)),
        bookedDate: json["booked_date"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "week": week,
        "open_time": openTime == null ? null : openTime,
        "close_time": closeTime == null ? null : closeTime,
        "slot": List<dynamic>.from(slot!.map((x) => x)),
        "booked_date": bookedDate,
      };
}
