class UserData {
  UserDataData? data;
  bool? status;
  String? message;

  UserData({
    this.data,
    this.status,
    this.message,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      data: json['data'] != null ? UserDataData.fromJson(json['data']) : null,
      status: json['status'],
      message: json['message'],
    );
  }
}

class UserDataData {
  String? instId;
  DataData? data;
  int? dataStatus;
  int? errorStatus;
  String? message;

  UserDataData({
    this.instId,
    this.data,
    this.dataStatus,
    this.errorStatus,
    this.message,
  });

  factory UserDataData.fromJson(Map<String, dynamic> json) {
    return UserDataData(
      instId: json['inst_id'],
      data: json['data'] != null ? DataData.fromJson(json['data']) : null,
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
    );
  }
}

class DataData {
  bool? checkerStatus;
  String? apiKey;
  ConductorDetails? conductorDetails;
  List<VersionDetail>? versionDetails;

  DataData({
    this.checkerStatus,
    this.apiKey,
    this.conductorDetails,
    this.versionDetails,
  });

  factory DataData.fromJson(Map<String, dynamic> json) {
    return DataData(
      checkerStatus: json['checker_status'],
      apiKey: json['api_key'],
      conductorDetails: json['conductor_details'] != null
          ? ConductorDetails.fromJson(json['conductor_details'])
          : null,
      versionDetails: json['version_Details'] != null
          ? List<VersionDetail>.from(
              json['version_Details'].map((x) => VersionDetail.fromJson(x)))
          : null,
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
  String? entryDate;
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
      entryDate: json['EntryDate'],
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

class VersionDetail {
  String? verId;
  String? verAppId;
  String? verTitle;
  String? verStatus;
  String? verUrl;
  String? verNote;
  String? verDate;
  String? active;
  dynamic entryBy;
  String? entryDate;

  VersionDetail({
    this.verId,
    this.verAppId,
    this.verTitle,
    this.verStatus,
    this.verUrl,
    this.verNote,
    this.verDate,
    this.active,
    this.entryBy,
    this.entryDate,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      verId: json['ver_id'],
      verAppId: json['ver_app_id'],
      verTitle: json['ver_title'],
      verStatus: json['ver_status'],
      verUrl: json['ver_url'],
      verNote: json['ver_note'],
      verDate: json['ver_date'],
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: json['EntryDate'],
    );
  }
}
