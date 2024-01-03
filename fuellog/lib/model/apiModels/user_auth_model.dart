class UserData {
  final UserInnerData? data;
  final bool? status;
  final String? message;

  UserData({
    this.data,
    this.status,
    this.message,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      data: UserInnerData.fromJson(json['data']),
      status: json['status'],
      message: json['message'],
    );
  }
}

class UserInnerData {
  final UserDataDetails? data;
  final int? dataStatus;
  final int? errorStatus;
  final String? message;

  UserInnerData({
    this.data,
    this.dataStatus,
    this.errorStatus,
    this.message,
  });

  factory UserInnerData.fromJson(Map<String, dynamic> json) {
    return UserInnerData(
      data: UserDataDetails.fromJson(json['data']),
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
    );
  }
}

class UserDataDetails {
  final bool? checkerStatus;
  final String? apiKey;
  final ConductorDetails? conductorDetails;

  UserDataDetails({
    this.checkerStatus,
    this.apiKey,
    this.conductorDetails,
  });

  factory UserDataDetails.fromJson(Map<String, dynamic> json) {
    return UserDataDetails(
      checkerStatus: json['checker_status'],
      apiKey: json['api_key'],
      conductorDetails: ConductorDetails.fromJson(json['conductor_details']),
    );
  }
}

class ConductorDetails {
  final String? clientId;
  final String? condId;
  final String? condName;
  final String? condEmpId;
  final dynamic condType;
  final String? condEmail;
  final String? condPhone;
  final String? condUsername;
  final String? condPassword;
  final dynamic condImage;
  final String? condSalary;
  final String? condIsChecker;
  final String? active;
  final String? entryBy;
  final DateTime? entryDate;
  final dynamic modBy;
  final dynamic modDate;
  final String? tripconId;
  final String? tripconTripId;
  final String? tripconConductorId;
  final String? tripconStartDate;
  final String? tripconEndDate;
  final dynamic tripconType;

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
