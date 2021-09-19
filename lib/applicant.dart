class Applicant {
  String sId;
  AppliedBy appliedBy;
  String applicantName;
  String citizenshipNumber;
  String applicantAddress;
  String applicantDOB;
  String applicantGender;
  String applicantPhoto;
  String transportationOffice;
  String licenseType;
  String createdAt;
  String updatedAt;
  int iV;

  Applicant(
      {this.sId,
        this.appliedBy,
        this.applicantName,
        this.citizenshipNumber,
        this.applicantAddress,
        this.applicantDOB,
        this.applicantGender,
        this.applicantPhoto,
        this.transportationOffice,
        this.licenseType,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Applicant.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appliedBy = json['appliedBy'] != null
        ? new AppliedBy.fromJson(json['appliedBy'])
        : null;
    applicantName = json['applicantName'];
    citizenshipNumber = json['citizenshipNumber'];
    applicantAddress = json['applicantAddress'];
    applicantDOB = json['applicantDOB'];
    applicantGender = json['applicantGender'];
    applicantPhoto = json['applicantPhoto'];
    transportationOffice = json['transportationOffice'];
    licenseType = json['licenseType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.appliedBy != null) {
      data['appliedBy'] = this.appliedBy.toJson();
    }
    data['applicantName'] = this.applicantName;
    data['citizenshipNumber'] = this.citizenshipNumber;
    data['applicantAddress'] = this.applicantAddress;
    data['applicantDOB'] = this.applicantDOB;
    data['applicantGender'] = this.applicantGender;
    data['applicantPhoto'] = this.applicantPhoto;
    data['transportationOffice'] = this.transportationOffice;
    data['licenseType'] = this.licenseType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class AppliedBy {
  String sId;
  String userName;

  AppliedBy({this.sId, this.userName});

  AppliedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    return data;
  }
}
