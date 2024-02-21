class BusHistoryData {
  final bool? status;
  final String? message;
  final String? regNo;
  final String? fuelType;
  final String? busNo;
  final ApiData? data;

  BusHistoryData({
    this.status,
    this.message,
    this.regNo,
    this.fuelType,
    this.busNo,
    this.data,
  });

  factory BusHistoryData.fromJson(Map<String, dynamic> json) {
    return BusHistoryData(
      status: json['status'],
      message: json['message'],
      regNo: json['reg_no'],
      fuelType: json['fuel_type'],
      busNo: json['bus_no'],
      data: json['data'] != null ? ApiData.fromJson(json['data']) : null,
    );
  }
}

class ApiData {
  final int? dataStatus;
  final int? errorStatus;
  final String? message;
  final Data? data;

  ApiData({
    this.dataStatus,
    this.errorStatus,
    this.message,
    this.data,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      dataStatus: json['data_status'],
      errorStatus: json['error_status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final String? apiKey;
  final List<VehicleActivityHistory>? vehicleActivityHistory;
  final List<dynamic>? vehicleDocumentsHistory;
  final List<dynamic>? vehicleJobHistory;
  final List<VehicleContractHistory>? vehicleContractHistory;
  final List<VehicleTripHistory>? vehicleTripHistory;

  Data({
    this.apiKey,
    this.vehicleActivityHistory,
    this.vehicleDocumentsHistory,
    this.vehicleJobHistory,
    this.vehicleContractHistory,
    this.vehicleTripHistory,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      apiKey: json['api_key'],
      vehicleActivityHistory: json['VEHICLE_ACTIVITY_HISTORY'] != null
          ? (json['VEHICLE_ACTIVITY_HISTORY'] as List)
              .map((e) => VehicleActivityHistory.fromJson(e))
              .toList()
          : null,
      vehicleDocumentsHistory: json['VEHICLE_DOCUMENTS_HISTORY'],
      vehicleJobHistory: json['VEHICLE_JOB_HISTORY'],
      vehicleContractHistory: json['VEHICLE_CONTRACT_HISTORY'] != null
          ? (json['VEHICLE_CONTRACT_HISTORY'] as List)
              .map((e) => VehicleContractHistory.fromJson(e))
              .toList()
          : null,
      vehicleTripHistory: json['VEHICLE_TRIP_HISTORY'] != null
          ? (json['VEHICLE_TRIP_HISTORY'] as List)
              .map((e) => VehicleTripHistory.fromJson(e))
              .toList()
          : null,
    );
  }
}

class VehicleActivityHistory {
  final String? clientId;
  final String? acdYear;
  final String? vhactId;
  final String? vhactVehId;
  final String? vhactContractId;
  final String? vhactType;
  final String? vhactDate;
  final String? vhactDesc;
  final String? vhactReadingStatus;
  final String? vhactReading;
  final String? vhactResetReading;
  final String? vhactVendor;
  final String? vhactQuantity;
  final String? vhactRate;
  final String? vhactAmount;
  final String? vhactBill;
  final String? vhactFile;
  final String? vhactVehImage;
  final String? active;
  final String? entryBy;
  final String? entryDate;
  final String? modBy;
  final String? modDate;
  final String? activityType;
  final String? vendrName;
  final String? vendrId;
  final String? vhactDateDisplay;
  final String? distance;
  final String? expense;
  final String? millage;

  VehicleActivityHistory({
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
    this.activityType,
    this.vendrName,
    this.vendrId,
    this.vhactDateDisplay,
    this.distance,
    this.expense,
    this.millage,
  });

  factory VehicleActivityHistory.fromJson(Map<String, dynamic> json) {
    return VehicleActivityHistory(
      clientId: json['ClientId'],
      acdYear: json['AcdYear'],
      vhactId: json['vhact_id'],
      vhactVehId: json['vhact_veh_id'],
      vhactContractId: json['vhact_contract_id'],
      vhactType: json['vhact_type'],
      vhactDate: json['vhact_date'],
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
      entryDate: json['EntryDate'],
      modBy: json['ModBy'],
      modDate: json['ModDate'],
      activityType: json['activity_type'],
      vendrName: json['vendr_name'],
      vendrId: json['vendr_id'],
      vhactDateDisplay: json['vhact_date_display'],
      distance: json['distance'],
      expense: json['expense'],
      millage: json['millage'],
    );
  }
}

class VehicleContractHistory {
  final String? vconvehId;
  final String? vconvehContractId;
  final String? vconvehVehicleId;
  final String? active;
  final String? entryBy;
  final String? entryDate;
  final String? modBy;
  final String? modDate;
  final String? contrName;
  final String? cliName;
  final String? vcontrId;
  final String? vcontrStartDateDisp;
  final String? vcontrEndDateDisp;
  final String? service;

  VehicleContractHistory({
    this.vconvehId,
    this.vconvehContractId,
    this.vconvehVehicleId,
    this.active,
    this.entryBy,
    this.entryDate,
    this.modBy,
    this.modDate,
    this.contrName,
    this.cliName,
    this.vcontrId,
    this.vcontrStartDateDisp,
    this.vcontrEndDateDisp,
    this.service,
  });

  factory VehicleContractHistory.fromJson(Map<String, dynamic> json) {
    return VehicleContractHistory(
      vconvehId: json['vconveh_id'],
      vconvehContractId: json['vconveh_contract_id'],
      vconvehVehicleId: json['vconveh_vehicle_id'],
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: json['EntryDate'],
      modBy: json['ModBy'],
      modDate: json['ModDate'],
      contrName: json['contr_name'],
      cliName: json['cli_name'],
      vcontrId: json['vcontr_id'],
      vcontrStartDateDisp: json['vcontr_start_date_disp'],
      vcontrEndDateDisp: json['vcontr_end_date_disp'],
      service: json['service'],
    );
  }
}

class VehicleTripHistory {
  final String? clientId;
  final String? tripvhId;
  final String? tripvhTripId;
  final String? tripvhVehId;
  final String? tripvhStartDate;
  final String? tripvhEndDate;
  final String? tripvhType;
  final String? active;
  final String? entryBy;
  final String? entryDate;
  final String? modBy;
  final String? modDate;
  final String? tripName;
  final String? tripType;
  final String? tripRoute;
  final String? tripDriver;
  final String? tripConductor;

  VehicleTripHistory({
    this.clientId,
    this.tripvhId,
    this.tripvhTripId,
    this.tripvhVehId,
    this.tripvhStartDate,
    this.tripvhEndDate,
    this.tripvhType,
    this.active,
    this.entryBy,
    this.entryDate,
    this.modBy,
    this.modDate,
    this.tripName,
    this.tripType,
    this.tripRoute,
    this.tripDriver,
    this.tripConductor,
  });

  factory VehicleTripHistory.fromJson(Map<String, dynamic> json) {
    return VehicleTripHistory(
      clientId: json['ClientId'],
      tripvhId: json['tripvh_id'],
      tripvhTripId: json['tripvh_trip_id'],
      tripvhVehId: json['tripvh_veh_id'],
      tripvhStartDate: json['tripvh_start_date'],
      tripvhEndDate: json['tripvh_end_date'],
      tripvhType: json['tripvh_type'],
      active: json['Active'],
      entryBy: json['EntryBy'],
      entryDate: json['EntryDate'],
      modBy: json['ModBy'],
      modDate: json['ModDate'],
      tripName: json['trip_name'],
      tripType: json['trip_type'],
      tripRoute: json['trip_route'],
      tripDriver: json['trip_driver'],
      tripConductor: json['trip_conductor'],
    );
  }
}
