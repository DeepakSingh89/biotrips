// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);


import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.employeeDetails,
        required this.group,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.otp,
        required this.profileImg,
        required this.route,
    });

    String id;
    String name;
    String phone;
    String email;
    EmployeeDetails employeeDetails;
    int group;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    dynamic otp;
    String profileImg;
    List<Route> route;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        employeeDetails: EmployeeDetails.fromJson(json["employeeDetails"]),
        group: json["group"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
        profileImg: json["profileImg"],
        route: List<Route>.from(json["route"].map((x) => Route.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "employeeDetails": employeeDetails.toJson(),
        "group": group,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "otp": otp,
        "profileImg": profileImg,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
    };
}

class EmployeeDetails {
    EmployeeDetails({
        required this.employeeId,
        required this.emergencyNumber,
        required this.company,
    });

    String employeeId;
    String emergencyNumber;
    Company company;

    factory EmployeeDetails.fromJson(Map<String, dynamic> json) => EmployeeDetails(
        employeeId: json["employee_id"],
        emergencyNumber: json["emergency_number"],
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "emergency_number": emergencyNumber,
        "company": company.toJson(),
    };
}

class Company {
    Company({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.group,
        required this.companyDetails,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.vendorDetails,
    });

    String id;
    String name;
    String phone;
    String email;
    int group;
    CompanyDetails companyDetails;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    VendorDetails vendorDetails;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        group: json["group"],
        companyDetails: CompanyDetails.fromJson(json["companyDetails"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        vendorDetails: VendorDetails.fromJson(json["vendorDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "group": group,
        "companyDetails": companyDetails.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "vendorDetails": vendorDetails.toJson(),
    };
}

class CompanyDetails {
    CompanyDetails({
        required this.vendors,
        required this.ownerName,
        required this.gstNumber,
        required this.zone,
    });

    List<String> vendors;
    String ownerName;
    String gstNumber;
    List<dynamic> zone;

    factory CompanyDetails.fromJson(Map<String, dynamic> json) => CompanyDetails(
        vendors: List<String>.from(json["vendors"].map((x) => x)),
        ownerName: json["owner_name"],
        gstNumber: json["gst_number"],
        zone: List<dynamic>.from(json["zone"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "vendors": List<dynamic>.from(vendors.map((x) => x)),
        "owner_name": ownerName,
        "gst_number": gstNumber,
        "zone": List<dynamic>.from(zone.map((x) => x)),
    };
}

class VendorDetails {
    VendorDetails({
        required this.gstNumber,
        required this.logo,
        required this.ownerName,
    });

    String gstNumber;
    String logo;
    String ownerName;

    factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
        gstNumber: json["gst_number"],
        logo: json["logo"],
        ownerName: json["owner_name"],
    );

    Map<String, dynamic> toJson() => {
        "gst_number": gstNumber,
        "logo": logo,
        "owner_name": ownerName,
    };
}

class Route {
    Route({
        required this.id,
        required this.days,
        required this.employees,
        required this.tagEmployees,
        required this.status,
        required this.routeType,
        required this.pickupTripDates,
        required this.dropTripDates,
        required this.name,
        required this.company,
        required this.shift,
        required this.pickupRoute,
        required this.dropRoute,
        required this.locality,
        required this.v,
        required this.vendor,
        required this.cab,
    });

    String id;
    List<String> days;
    List<String> employees;
    List<dynamic> tagEmployees;
    String status;
    String routeType;
    List<dynamic> pickupTripDates;
    List<dynamic> dropTripDates;
    String name;
    String company;
    String shift;
    PRoute pickupRoute;
    PRoute dropRoute;
    String locality;
    int v;
    String vendor;
    String cab;

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json["_id"],
        days: List<String>.from(json["days"].map((x) => x)),
        employees: List<String>.from(json["employees"].map((x) => x)),
        tagEmployees: List<dynamic>.from(json["tagEmployees"].map((x) => x)),
        status: json["status"],
        routeType: json["routeType"],
        pickupTripDates: List<dynamic>.from(json["pickupTripDates"].map((x) => x)),
        dropTripDates: List<dynamic>.from(json["dropTripDates"].map((x) => x)),
        name: json["name"],
        company: json["company"],
        shift: json["shift"],
        pickupRoute: PRoute.fromJson(json["pickupRoute"]),
        dropRoute: PRoute.fromJson(json["dropRoute"]),
        locality: json["locality"],
        v: json["__v"],
        vendor: json["vendor"],
        cab: json["cab"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "days": List<dynamic>.from(days.map((x) => x)),
        "employees": List<dynamic>.from(employees.map((x) => x)),
        "tagEmployees": List<dynamic>.from(tagEmployees.map((x) => x)),
        "status": status,
        "routeType": routeType,
        "pickupTripDates": List<dynamic>.from(pickupTripDates.map((x) => x)),
        "dropTripDates": List<dynamic>.from(dropTripDates.map((x) => x)),
        "name": name,
        "company": company,
        "shift": shift,
        "pickupRoute": pickupRoute.toJson(),
        "dropRoute": dropRoute.toJson(),
        "locality": locality,
        "__v": v,
        "vendor": vendor,
        "cab": cab,
    };
}

class PRoute {
    PRoute({
        required this.pickupTime,
    });

    String pickupTime;

    factory PRoute.fromJson(Map<String, dynamic> json) => PRoute(
        pickupTime: json["pickupTime"],
    );

    Map<String, dynamic> toJson() => {
        "pickupTime": pickupTime,
    };
}
