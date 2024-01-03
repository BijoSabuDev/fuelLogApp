// To parse this JSON data, do
//
//     final busHistory = busHistoryFromJson(jsonString);

import 'dart:convert';

BusHistory busHistoryFromJson(String str) => BusHistory.fromJson(json.decode(str));

String busHistoryToJson(BusHistory data) => json.encode(data.toJson());

class BusHistory {
    bool? status;
    String? message;
    BusHistoryData? data;

    BusHistory({
        this.status,
        this.message,
        this.data,
    });

    factory BusHistory.fromJson(Map<String, dynamic> json) => BusHistory(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : BusHistoryData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class BusHistoryData {
    int? dataStatus;
    int? errorStatus;
    String? message;
    DataData? data;

    BusHistoryData({
        this.dataStatus,
        this.errorStatus,
        this.message,
        this.data,
    });

    factory BusHistoryData.fromJson(Map<String, dynamic> json) => BusHistoryData(
        dataStatus: json["data_status"],
        errorStatus: json["error_status"],
        message: json["message"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data_status": dataStatus,
        "error_status": errorStatus,
        "message": message,
        "data": data?.toJson(),
    };
}

class DataData {
    List<Map<String, String?>>? vehicleActivityHistory;
    List<dynamic>? vehicleDocumentsHistory;
    List<dynamic>? vehicleJobHistory;
    List<VehicleContractHistory>? vehicleContractHistory;
    List<VehicleTripHistory>? vehicleTripHistory;

    DataData({
        this.vehicleActivityHistory,
        this.vehicleDocumentsHistory,
        this.vehicleJobHistory,
        this.vehicleContractHistory,
        this.vehicleTripHistory,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        vehicleActivityHistory: json["VEHICLE_ACTIVITY_HISTORY"] == null ? [] : List<Map<String, String?>>.from(json["VEHICLE_ACTIVITY_HISTORY"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        vehicleDocumentsHistory: json["VEHICLE_DOCUMENTS_HISTORY"] == null ? [] : List<dynamic>.from(json["VEHICLE_DOCUMENTS_HISTORY"]!.map((x) => x)),
        vehicleJobHistory: json["VEHICLE_JOB_HISTORY"] == null ? [] : List<dynamic>.from(json["VEHICLE_JOB_HISTORY"]!.map((x) => x)),
        vehicleContractHistory: json["VEHICLE_CONTRACT_HISTORY"] == null ? [] : List<VehicleContractHistory>.from(json["VEHICLE_CONTRACT_HISTORY"]!.map((x) => VehicleContractHistory.fromJson(x))),
        vehicleTripHistory: json["VEHICLE_TRIP_HISTORY"] == null ? [] : List<VehicleTripHistory>.from(json["VEHICLE_TRIP_HISTORY"]!.map((x) => VehicleTripHistory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "VEHICLE_ACTIVITY_HISTORY": vehicleActivityHistory == null ? [] : List<dynamic>.from(vehicleActivityHistory!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "VEHICLE_DOCUMENTS_HISTORY": vehicleDocumentsHistory == null ? [] : List<dynamic>.from(vehicleDocumentsHistory!.map((x) => x)),
        "VEHICLE_JOB_HISTORY": vehicleJobHistory == null ? [] : List<dynamic>.from(vehicleJobHistory!.map((x) => x)),
        "VEHICLE_CONTRACT_HISTORY": vehicleContractHistory == null ? [] : List<dynamic>.from(vehicleContractHistory!.map((x) => x.toJson())),
        "VEHICLE_TRIP_HISTORY": vehicleTripHistory == null ? [] : List<dynamic>.from(vehicleTripHistory!.map((x) => x.toJson())),
    };
}

class VehicleContractHistory {
    String? vconvehId;
    String? vconvehContractId;
    String? vconvehVehicleId;
    String? active;
    String? entryBy;
    DateTime? entryDate;
    dynamic modBy;
    dynamic modDate;
    String? contrName;
    String? cliName;
    String? vcontrId;
    String? vcontrStartDateDisp;
    String? vcontrEndDateDisp;
    String? service;

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

    factory VehicleContractHistory.fromJson(Map<String, dynamic> json) => VehicleContractHistory(
        vconvehId: json["vconveh_id"],
        vconvehContractId: json["vconveh_contract_id"],
        vconvehVehicleId: json["vconveh_vehicle_id"],
        active: json["Active"],
        entryBy: json["EntryBy"],
        entryDate: json["EntryDate"] == null ? null : DateTime.parse(json["EntryDate"]),
        modBy: json["ModBy"],
        modDate: json["ModDate"],
        contrName: json["contr_name"],
        cliName: json["cli_name"],
        vcontrId: json["vcontr_id"],
        vcontrStartDateDisp: json["vcontr_start_date_disp"],
        vcontrEndDateDisp: json["vcontr_end_date_disp"],
        service: json["service"],
    );

    Map<String, dynamic> toJson() => {
        "vconveh_id": vconvehId,
        "vconveh_contract_id": vconvehContractId,
        "vconveh_vehicle_id": vconvehVehicleId,
        "Active": active,
        "EntryBy": entryBy,
        "EntryDate": entryDate?.toIso8601String(),
        "ModBy": modBy,
        "ModDate": modDate,
        "contr_name": contrName,
        "cli_name": cliName,
        "vcontr_id": vcontrId,
        "vcontr_start_date_disp": vcontrStartDateDisp,
        "vcontr_end_date_disp": vcontrEndDateDisp,
        "service": service,
    };
}

class VehicleTripHistory {
    String? clientId;
    String? tripvhId;
    String? tripvhTripId;
    String? tripvhVehId;
    String? tripvhStartDate;
    String? tripvhEndDate;
    dynamic tripvhType;
    String? active;
    String? entryBy;
    DateTime? entryDate;
    dynamic modBy;
    dynamic modDate;
    String? tripName;
    String? tripType;
    String? tripRoute;
    String? tripDriver;
    String? tripConductor;

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

    factory VehicleTripHistory.fromJson(Map<String, dynamic> json) => VehicleTripHistory(
        clientId: json["ClientId"],
        tripvhId: json["tripvh_id"],
        tripvhTripId: json["tripvh_trip_id"],
        tripvhVehId: json["tripvh_veh_id"],
        tripvhStartDate: json["tripvh_start_date"],
        tripvhEndDate: json["tripvh_end_date"],
        tripvhType: json["tripvh_type"],
        active: json["Active"],
        entryBy: json["EntryBy"],
        entryDate: json["EntryDate"] == null ? null : DateTime.parse(json["EntryDate"]),
        modBy: json["ModBy"],
        modDate: json["ModDate"],
        tripName: json["trip_name"],
        tripType: json["trip_type"],
        tripRoute: json["trip_route"],
        tripDriver: json["trip_driver"],
        tripConductor: json["trip_conductor"],
    );

    Map<String, dynamic> toJson() => {
        "ClientId": clientId,
        "tripvh_id": tripvhId,
        "tripvh_trip_id": tripvhTripId,
        "tripvh_veh_id": tripvhVehId,
        "tripvh_start_date": tripvhStartDate,
        "tripvh_end_date": tripvhEndDate,
        "tripvh_type": tripvhType,
        "Active": active,
        "EntryBy": entryBy,
        "EntryDate": entryDate?.toIso8601String(),
        "ModBy": modBy,
        "ModDate": modDate,
        "trip_name": tripName,
        "trip_type": tripType,
        "trip_route": tripRoute,
        "trip_driver": tripDriver,
        "trip_conductor": tripConductor,
    };
}
