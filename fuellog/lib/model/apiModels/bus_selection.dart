class BusSelectionData {
  bool? status;
  String? message;
  BusSelectionDataData? data;

  BusSelectionData({
    this.status,
    this.message,
    this.data,
  });

  factory BusSelectionData.fromJson(Map<String, dynamic> json) {
    return BusSelectionData(
      status: json['status'],
      message: json['message'],
      data: BusSelectionDataData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class BusSelectionDataData {
  int? dataStatus;
  int? errorStatus;
  String? message;
  DataData? data;
  List<BusDetail>? busDetails;
  List<BusFuelDetail>? busFuelDetails;

  BusSelectionDataData({
    this.dataStatus,
    this.errorStatus,
    this.message,
    this.data,
    this.busDetails,
    this.busFuelDetails,
  });

  factory BusSelectionDataData.fromJson(Map<String, dynamic> json) {
    return BusSelectionDataData(
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
      data: DataData.fromJson(json['data']),
      busDetails: (json['bus_details'] as List?)
          ?.map((e) => BusDetail.fromJson(e))
          .toList(),
      busFuelDetails: (json['bus_fuel_details'] as List?)
          ?.map((e) => BusFuelDetail.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data_status': dataStatus,
      'error_status': errorStatus,
      'message': message,
      'data': data?.toJson(),
      'bus_details': busDetails?.map((e) => e.toJson()).toList(),
      'bus_fuel_details': busFuelDetails?.map((e) => e.toJson()).toList(),
    };
  }
}

class BusDetail {
  String? vehId;
  String? vehRegNo;
  String? vehSchoolNo;
  String? vehType;
  String? vehDesc;
  String? vehMake;
  String? vehMakeTemp;
  String? vehFuelType;
  String? vehRegYear;
  DateTime? vehRegValidity;
  String? vehEngineNo;
  String? vehChasisNo;
  String? vehGpsEmi;
  String? vehSeatCapacity;
  String? vehInsuranceNo;
  String? vehInsuranceCompany;
  DateTime? vehInsuranceValidity;
  String? active;
  String? entryBy;
  DateTime? entryDate;
  String? modBy;
  String? modDate;
  dynamic vehVenderId;
  dynamic docCounts;
  dynamic docType;
  dynamic docTypeCount;
  dynamic vendrName;
  String? vehInsuranceValidityDisplay;
  String? fuel;
  String? vehMakeName;
  String? vehTypeName;

  BusDetail({
    this.vehId,
    this.vehRegNo,
    this.vehSchoolNo,
    this.vehType,
    this.vehDesc,
    this.vehMake,
    this.vehMakeTemp,
    this.vehFuelType,
    this.vehRegYear,
    this.vehRegValidity,
    this.vehEngineNo,
    this.vehChasisNo,
    this.vehGpsEmi,
    this.vehSeatCapacity,
    this.vehInsuranceNo,
    this.vehInsuranceCompany,
    this.vehInsuranceValidity,
    this.active,
    this.entryBy,
    this.entryDate,
    this.modBy,
    this.modDate,
    this.vehVenderId,
    this.docCounts,
    this.docType,
    this.docTypeCount,
    this.vendrName,
    this.vehInsuranceValidityDisplay,
    this.fuel,
    this.vehMakeName,
    this.vehTypeName,
  });

  factory BusDetail.fromJson(Map<String, dynamic> json) {
    return BusDetail(
      vehId: json['veh_id'],
      vehRegNo: json['veh_reg_no'],
      vehSchoolNo: json['veh_school_no'],
      vehType: json['veh_type'],
      vehDesc: json['veh_desc'],
      vehMake: json['veh_make'],
      vehMakeTemp: json['veh_make_temp'],
      vehFuelType: json['veh_fuel_type'],
      vehRegYear: json['veh_reg_year'],
      vehRegValidity: DateTime.parse(json['veh_reg_validity']),
      vehEngineNo: json['veh_engine_no'],
      vehChasisNo: json['veh_chasis_no'],
      vehGpsEmi: json['veh_gps_emi'],
      vehSeatCapacity: json['veh_seat_capacity'],
      vehInsuranceNo: json['veh_insurance_no'],
      vehInsuranceCompany: json['veh_insurance_company'],
      vehInsuranceValidity: DateTime.parse(json['veh_insurance_validity']),
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: DateTime.parse(json['EntryDate']),
      modBy: json['ModBy'],
      modDate: json['ModDate'],
      vehVenderId: json['veh_vender_id'],
      docCounts: json['doc_counts'],
      docType: json['doc_type'],
      docTypeCount: json['doc_type_count'],
      vendrName: json['vendr_name'],
      vehInsuranceValidityDisplay: json['veh_insurance_validity_display'],
      fuel: json['fuel'],
      vehMakeName: json['veh_make_name'],
      vehTypeName: json['veh_type_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'veh_id': vehId,
      'veh_reg_no': vehRegNo,
      'veh_school_no': vehSchoolNo,
      'veh_type': vehType,
      'veh_desc': vehDesc,
      'veh_make': vehMake,
      'veh_make_temp': vehMakeTemp,
      'veh_fuel_type': vehFuelType,
      'veh_reg_year': vehRegYear,
      'veh_reg_validity': vehRegValidity?.toIso8601String(),
      'veh_engine_no': vehEngineNo,
      'veh_chasis_no': vehChasisNo,
      'veh_gps_emi': vehGpsEmi,
      'veh_seat_capacity': vehSeatCapacity,
      'veh_insurance_no': vehInsuranceNo,
      'veh_insurance_company': vehInsuranceCompany,
      'veh_insurance_validity': vehInsuranceValidity?.toIso8601String(),
      'Active': active,
      'EntryBy': entryBy,
      'EntryDate': entryDate?.toIso8601String(),
      'ModBy': modBy,
      'ModDate': modDate,
      'veh_vender_id': vehVenderId,
      'doc_counts': docCounts,
      'doc_type': docType,
      'doc_type_count': docTypeCount,
      'vendr_name': vendrName,
      'veh_insurance_validity_display': vehInsuranceValidityDisplay,
      'fuel': fuel,
      'veh_make_name': vehMakeName,
      'veh_type_name': vehTypeName,
    };
  }
}

class BusFuelDetail {
  String? clientId;
  String? acdYear;
  String? vhactId;
  String? vhactVehId;
  dynamic vhactContractId;
  String? vhactType;
  DateTime? vhactDate;
  String? vhactDesc;
  String? vhactReadingStatus;
  String? vhactReading;
  String? vhactResetReading;
  String? vhactVendor;
  String? vhactQuantity;
  String? vhactRate;
  String? vhactAmount;
  String? vhactBill;
  dynamic vhactFile;
  dynamic vhactVehImage;
  String? active;
  String? entryBy;
  DateTime? entryDate;
  dynamic modBy;
  dynamic modDate;

  BusFuelDetail({
    this.clientId,
    this.acdYear,
    this.vhactId,
    this.vhactVehId,
    this.vhactContractId,
    this.vhactType,
    this.vhactDate,
    this.vhactDesc,
    this.vhactReadingStatus,
    this.vhactReading,
    this.vhactResetReading,
    this.vhactVendor,
    this.vhactQuantity,
    this.vhactRate,
    this.vhactAmount,
    this.vhactBill,
    this.vhactFile,
    this.vhactVehImage,
    this.active,
    this.entryBy,
    this.entryDate,
    this.modBy,
    this.modDate,
  });

  factory BusFuelDetail.fromJson(Map<String, dynamic> json) {
    return BusFuelDetail(
      clientId: json['ClientId'],
      acdYear: json['AcdYear'],
      vhactId: json['vhact_id'],
      vhactVehId: json['vhact_veh_id'],
      vhactContractId: json['vhact_contract_id'],
      vhactType: json['vhact_type'],
      vhactDate: DateTime.parse(json['vhact_date']),
      vhactDesc: json['vhact_desc'],
      vhactReadingStatus: json['vhact_reading_status'],
      vhactReading: json['vhact_reading'],
      vhactResetReading: json['vhact_reset_reading'],
      vhactVendor: json['vhact_vendor'],
      vhactQuantity: json['vhact_quantity'],
      vhactRate: json['vhact_rate'],
      vhactAmount: json['vhact_amount'],
      vhactBill: json['vhact_bill'],
      vhactFile: json['vhact_file'],
      vhactVehImage: json['vhact_veh_image'],
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: DateTime.parse(json['EntryDate']),
      modBy: json['ModBy'],
      modDate: json['ModDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ClientId': clientId,
      'AcdYear': acdYear,
      'vhact_id': vhactId,
      'vhact_veh_id': vhactVehId,
      'vhact_contract_id': vhactContractId,
      'vhact_type': vhactType,
      'vhact_date': vhactDate?.toIso8601String(),
      'vhact_desc': vhactDesc,
      'vhact_reading_status': vhactReadingStatus,
      'vhact_reading': vhactReading,
      'vhact_reset_reading': vhactResetReading,
      'vhact_vendor': vhactVendor,
      'vhact_quantity': vhactQuantity,
      'vhact_rate': vhactRate,
      'vhact_amount': vhactAmount,
      'vhact_bill': vhactBill,
      'vhact_file': vhactFile,
      'vhact_veh_image': vhactVehImage,
      'Active': active,
      'EntryBy': entryBy,
      'EntryDate': entryDate?.toIso8601String(),
      'ModBy': modBy,
      'ModDate': modDate,
    };
  }
}

class DataData {
  String? apiKey;

  DataData({
    this.apiKey,
  });

  factory DataData.fromJson(Map<String, dynamic> json) {
    return DataData(
      apiKey: json['api_key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api_key': apiKey,
    };
  }
}
