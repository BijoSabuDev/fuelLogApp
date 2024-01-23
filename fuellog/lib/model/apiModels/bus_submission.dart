import 'dart:convert';

BusSubmittedResponse busSubmittedResponseFromJson(String str) => BusSubmittedResponse.fromJson(json.decode(str));

String busSubmittedResponseToJson(BusSubmittedResponse data) => json.encode(data.toJson());

class BusSubmittedResponse {
    bool? status;
    String? message;
    BusSubmittedResponseData? data;

    BusSubmittedResponse({
        this.status,
        this.message,
        this.data,
    });

    factory BusSubmittedResponse.fromJson(Map<String, dynamic> json) => BusSubmittedResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : BusSubmittedResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class BusSubmittedResponseData {
    int? dataStatus;
    int? errorStatus;
    String? message;
    DataData? data;

    BusSubmittedResponseData({
        this.dataStatus,
        this.errorStatus,
        this.message,
        this.data,
    });

    factory BusSubmittedResponseData.fromJson(Map<String, dynamic> json) => BusSubmittedResponseData(
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
    String? apiKey;

    DataData({
        this.apiKey,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        apiKey: json["api_key"],
    );

    Map<String, dynamic> toJson() => {
        "api_key": apiKey,
    };
}
