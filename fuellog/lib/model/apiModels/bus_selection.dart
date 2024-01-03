// ignore_for_file: unnecessary_question_mark

class BusSelectionData {
  String? busID;
  bool? status;
  String? message;
  Data? data;

  BusSelectionData({this.busID, this.status, this.message, this.data});

  BusSelectionData.fromJson(Map<String, dynamic> json) {
    busID = json['busID'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['busID'] = busID;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? dataStatus;
  int? errorStatus;
  String? message;
  BusDetails? busDetails;
  List<BusFuelDetails>? busFuelDetails;

  Data(
      {this.dataStatus,
      this.errorStatus,
      this.message,
      this.busDetails,
      this.busFuelDetails});

  Data.fromJson(Map<String, dynamic> json) {
    dataStatus = json['data_status'];
    errorStatus = json['error_status'];
    message = json['message'];
    busDetails = json['bus_details'] != null
        ? BusDetails.fromJson(json['bus_details'])
        : null;
    if (json['bus_fuel_details'] != null) {
      busFuelDetails = <BusFuelDetails>[];
      json['bus_fuel_details'].forEach((v) {
        busFuelDetails!.add(BusFuelDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_status'] = dataStatus;
    data['error_status'] = errorStatus;
    data['message'] = message;
    if (busDetails != null) {
      data['bus_details'] = busDetails!.toJson();
    }
    if (busFuelDetails != null) {
      data['bus_fuel_details'] =
          busFuelDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusDetails {
  String? vehId;
  String? vehRegNo;
  String? vehSchoolNo;
  String? vehType;
  String? vehDesc;
  String? vehMake;
  String? vehMakeTemp;
  String? vehFuelType;
  String? vehRegYear;
  String? vehRegValidity;
  String? vehEngineNo;
  String? vehChasisNo;
  String? vehGpsEmi;
  String? vehSeatCapacity;
  String? vehInsuranceNo;
  String? vehInsuranceCompany;
  String? vehInsuranceValidity;
  String? active;
  String? entryBy;
  String? entryDate;
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

  BusDetails(
      {this.vehId,
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
      this.vehTypeName});

  BusDetails.fromJson(Map<String, dynamic> json) {
    vehId = json['veh_id'];
    vehRegNo = json['veh_reg_no'];
    vehSchoolNo = json['veh_school_no'];
    vehType = json['veh_type'];
    vehDesc = json['veh_desc'];
    vehMake = json['veh_make'];
    vehMakeTemp = json['veh_make_temp'];
    vehFuelType = json['veh_fuel_type'];
    vehRegYear = json['veh_reg_year'];
    vehRegValidity = json['veh_reg_validity'];
    vehEngineNo = json['veh_engine_no'];
    vehChasisNo = json['veh_chasis_no'];
    vehGpsEmi = json['veh_gps_emi'];
    vehSeatCapacity = json['veh_seat_capacity'];
    vehInsuranceNo = json['veh_insurance_no'];
    vehInsuranceCompany = json['veh_insurance_company'];
    vehInsuranceValidity = json['veh_insurance_validity'];
    active = json['Active'];
    entryBy = json['EntryBy'];
    entryDate = json['EntryDate'];
    modBy = json['ModBy'];
    modDate = json['ModDate'];
    vehVenderId = json['veh_vender_id'];
    docCounts = json['doc_counts'];
    docType = json['doc_type'];
    docTypeCount = json['doc_type_count'];
    vendrName = json['vendr_name'];
    vehInsuranceValidityDisplay = json['veh_insurance_validity_display'];
    fuel = json['fuel'];
    vehMakeName = json['veh_make_name'];
    vehTypeName = json['veh_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['veh_id'] = vehId;
    data['veh_reg_no'] = vehRegNo;
    data['veh_school_no'] = vehSchoolNo;
    data['veh_type'] = vehType;
    data['veh_desc'] = vehDesc;
    data['veh_make'] = vehMake;
    data['veh_make_temp'] = vehMakeTemp;
    data['veh_fuel_type'] = vehFuelType;
    data['veh_reg_year'] = vehRegYear;
    data['veh_reg_validity'] = vehRegValidity;
    data['veh_engine_no'] = vehEngineNo;
    data['veh_chasis_no'] = vehChasisNo;
    data['veh_gps_emi'] = vehGpsEmi;
    data['veh_seat_capacity'] = vehSeatCapacity;
    data['veh_insurance_no'] = vehInsuranceNo;
    data['veh_insurance_company'] = vehInsuranceCompany;
    data['veh_insurance_validity'] = vehInsuranceValidity;
    data['Active'] = active;
    data['EntryBy'] = entryBy;
    data['EntryDate'] = entryDate;
    data['ModBy'] = modBy;
    data['ModDate'] = modDate;
    data['veh_vender_id'] = vehVenderId;
    data['doc_counts'] = docCounts;
    data['doc_type'] = docType;
    data['doc_type_count'] = docTypeCount;
    data['vendr_name'] = vendrName;
    data['veh_insurance_validity_display'] = vehInsuranceValidityDisplay;
    data['fuel'] = fuel;
    data['veh_make_name'] = vehMakeName;
    data['veh_type_name'] = vehTypeName;
    return data;
  }
}

class BusFuelDetails {
  String? clientId;
  String? acdYear;
  String? vhactId;
  String? vhactVehId;
  dynamic vhactContractId;
  String? vhactType;
  String? vhactDate;
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
  String? active;
  String? entryBy;
  String? entryDate;
  dynamic modBy;
  dynamic modDate;

  BusFuelDetails(
      {this.clientId,
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
      this.active,
      this.entryBy,
      this.entryDate,
      this.modBy,
      this.modDate});

  BusFuelDetails.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    acdYear = json['AcdYear'];
    vhactId = json['vhact_id'];
    vhactVehId = json['vhact_veh_id'];
    vhactContractId = json['vhact_contract_id'];
    vhactType = json['vhact_type'];
    vhactDate = json['vhact_date'];
    vhactDesc = json['vhact_desc'];
    vhactReadingStatus = json['vhact_reading_status'];
    vhactReading = json['vhact_reading'];
    vhactResetReading = json['vhact_reset_reading'];
    vhactVendor = json['vhact_vendor'];
    vhactQuantity = json['vhact_quantity'];
    vhactRate = json['vhact_rate'];
    vhactAmount = json['vhact_amount'];
    vhactBill = json['vhact_bill'];
    vhactFile = json['vhact_file'];
    active = json['Active'];
    entryBy = json['EntryBy'];
    entryDate = json['EntryDate'];
    modBy = json['ModBy'];
    modDate = json['ModDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ClientId'] = clientId;
    data['AcdYear'] = acdYear;
    data['vhact_id'] = vhactId;
    data['vhact_veh_id'] = vhactVehId;
    data['vhact_contract_id'] = vhactContractId;
    data['vhact_type'] = vhactType;
    data['vhact_date'] = vhactDate;
    data['vhact_desc'] = vhactDesc;
    data['vhact_reading_status'] = vhactReadingStatus;
    data['vhact_reading'] = vhactReading;
    data['vhact_reset_reading'] = vhactResetReading;
    data['vhact_vendor'] = vhactVendor;
    data['vhact_quantity'] = vhactQuantity;
    data['vhact_rate'] = vhactRate;
    data['vhact_amount'] = vhactAmount;
    data['vhact_bill'] = vhactBill;
    data['vhact_file'] = vhactFile;
    data['Active'] = active;
    data['EntryBy'] = entryBy;
    data['EntryDate'] = entryDate;
    data['ModBy'] = modBy;
    data['ModDate'] = modDate;
    return data;
  }
}
