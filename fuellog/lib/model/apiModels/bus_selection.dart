class BusSelectionData {
  bool? status;
  String? message;
  String? instId;
  BusSelectionDataData? data;

  BusSelectionData({
    this.status,
    this.message,
    this.instId,
    this.data,
  });

  factory BusSelectionData.fromJson(Map<String, dynamic> json) {
    return BusSelectionData(
      status: json['status'],
      instId: json['inst_id'],
      message: json['message'],
      data: json['data'] != null
          ? BusSelectionDataData.fromJson(json['data'])
          : null,
    );
  }
}

class BusSelectionDataData {
  int? dataStatus;
  int? errorStatus;
  String? message;
  DataData? data;
  List<BusDetail>? busDetails;
  List<BusFuelDetail>? busFuelDetails;
  List<VendorDetail>? vendorDetails;

  BusSelectionDataData({
    this.dataStatus,
    this.errorStatus,
    this.message,
    this.data,
    this.busDetails,
    this.busFuelDetails,
    this.vendorDetails,
  });

  factory BusSelectionDataData.fromJson(Map<String, dynamic> json) {
    return BusSelectionDataData(
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
      data: json['data'] != null ? DataData.fromJson(json['data']) : null,
      busDetails: (json['bus_details'] as List<dynamic>?)
          ?.map((e) => BusDetail.fromJson(e))
          .toList(),
      busFuelDetails: (json['bus_fuel_details'] as List<dynamic>?)
          ?.map((e) => BusFuelDetail.fromJson(e))
          .toList(),
      vendorDetails: (json['vendor_details'] as List<dynamic>?)
          ?.map((e) => VendorDetail.fromJson(e))
          .toList(),
    );
  }
}

class BusDetail {
  String? vehId;
  String? vehRegNo;
  String? vehSchoolNo;
  String? vehType;
  String? vehDesc;
  String? vehMake;
  dynamic vehMakeTemp;
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
  dynamic modBy;
  dynamic modDate;
  String? vehVenderId;
  dynamic docCounts;
  dynamic docType;
  dynamic docTypeCount;
  String? vendrName;
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
      vehRegValidity: json['veh_reg_validity'] != null
          ? DateTime.parse(json['veh_reg_validity'])
          : null,
      vehEngineNo: json['veh_engine_no'],
      vehChasisNo: json['veh_chasis_no'],
      vehGpsEmi: json['veh_gps_emi'],
      vehSeatCapacity: json['veh_seat_capacity'],
      vehInsuranceNo: json['veh_insurance_no'],
      vehInsuranceCompany: json['veh_insurance_company'],
      vehInsuranceValidity: json['veh_insurance_validity'] != null
          ? DateTime.parse(json['veh_insurance_validity'])
          : null,
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate:
          json['EntryDate'] != null ? DateTime.parse(json['EntryDate']) : null,
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
      vhactDate: json['vhact_date'] != null
          ? DateTime.parse(json['vhact_date'])
          : null,
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
      entryDate:
          json['EntryDate'] != null ? DateTime.parse(json['EntryDate']) : null,
      modBy: json['ModBy'],
      modDate: json['ModDate'],
    );
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
}

class VendorDetail {
  String? vendorId;
  String? vendorName;
  String? vendorAddress;
  String? vendorPhone;
  String? vendorEmail;

  VendorDetail({
    this.vendorId,
    this.vendorName,
    this.vendorAddress,
    this.vendorPhone,
    this.vendorEmail,
  });

  factory VendorDetail.fromJson(Map<String, dynamic> json) {
    return VendorDetail(
      vendorId: json['vendor_id'],
      vendorName: json['vendor_name'],
      vendorAddress: json['vendor_address'],
      vendorPhone: json['vendor_phone'],
      vendorEmail: json['vendor_email'],
    );
  }
}
