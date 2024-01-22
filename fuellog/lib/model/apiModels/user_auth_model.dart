class UserData {
  DataData? data;
  bool? status;
  String? message;

  UserData({
    this.data,
    this.status,
    this.message,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      data: DataData.fromJson(json['data']),
      status: json['status'],
      message: json['message'],
    );
  }
}

class DataData {
  String? instId;
  DataDetails? data;
  int? dataStatus;
  int? errorStatus;
  String? message;

  DataData({
    this.instId,
    this.data,
    this.dataStatus,
    this.errorStatus,
    this.message,
  });

  factory DataData.fromJson(Map<String, dynamic> json) {
    return DataData(
      instId: json['inst_id'],
      data: DataDetails.fromJson(json['data']),
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
    );
  }
}

class DataDetails {
  bool? checkerStatus;
  String? apiKey;
  ConductorDetails? conductorDetails;

  DataDetails({
    this.checkerStatus,
    this.apiKey,
    this.conductorDetails,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) {
    return DataDetails(
      checkerStatus: json['checker_status'],
      apiKey: json['api_key'],
      conductorDetails: ConductorDetails.fromJson(json['conductor_details']),
    );
  }
}

class ConductorDetails {
  String? clientId;
  String? condId;
  String? condName;
  String? condEmpId;
  dynamic condType;
  String? condEmail;
  String? condPhone;
  String? condUsername;
  String? condPassword;
  dynamic condImage;
  String? condSalary;
  String? condIsChecker;
  String? active;
  String? entryBy;
  DateTime? entryDate;
  dynamic modBy;
  dynamic modDate;
  String? tripconId;
  String? tripconTripId;
  String? tripconConductorId;
  String? tripconStartDate;
  String? tripconEndDate;
  dynamic tripconType;

  ConductorDetails({
    this.clientId,
    this.condId,
    this.condName,
    this.condEmpId,
    this.condType,
    this.condEmail,
    this.condPhone,
    this.condUsername,
    this.condPassword,
    this.condImage,
    this.condSalary,
    this.condIsChecker,
    this.active,
    this.entryBy,
    this.entryDate,
    this.modBy,
    this.modDate,
    this.tripconId,
    this.tripconTripId,
    this.tripconConductorId,
    this.tripconStartDate,
    this.tripconEndDate,
    this.tripconType,
  });

  factory ConductorDetails.fromJson(Map<String, dynamic> json) {
    return ConductorDetails(
      clientId: json['ClientId'],
      condId: json['cond_id'],
      condName: json['cond_name'],
      condEmpId: json['cond_emp_id'],
      condType: json['cond_type'],
      condEmail: json['cond_email'],
      condPhone: json['cond_phone'],
      condUsername: json['cond_username'],
      condPassword: json['cond_password'],
      condImage: json['cond_image'],
      condSalary: json['cond_salary'],
      condIsChecker: json['cond_is_checker'],
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: DateTime.parse(json['EntryDate']),
      modBy: json['ModBy'],
      modDate: json['ModDate'],
      tripconId: json['tripcon_id'],
      tripconTripId: json['tripcon_trip_id'],
      tripconConductorId: json['tripcon_conductor_id'],
      tripconStartDate: json['tripcon_start_date'],
      tripconEndDate: json['tripcon_end_date'],
      tripconType: json['tripcon_type'],
    );
  }
}
