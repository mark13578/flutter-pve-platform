class Organization {
  final String uuid;
  final String orgname;
  final String tel;
  final String ext;
  final String guinumber;
  final String adminUuid;
  final String techUuid;
  final String accUuid;

  Organization({
    required this.uuid,
    required this.orgname,
    required this.tel,
    required this.ext,
    required this.guinumber,
    required this.adminUuid,
    required this.techUuid,
    required this.accUuid,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      uuid: json['uuid'],
      orgname: json['orgname'],
      tel: json['tel'],
      ext: json['ext'],
      guinumber: json['guinumber'],
      adminUuid: json['admin_uuid'],
      techUuid: json['tech_uuid'],
      accUuid: json['acc_uuid'],
    );
  }
}