class SysUser {
  final String uuid;
  final String username;
  final String password;
  final String? googleUid;
  final String realname;
  final String? nickname;
  final String? idnumber;
  final String docfile1;
  final String? docfile2;
  final String? docfile2type;
  final String? phone;
  final String country;
  final String state;
  final String? district;
  final String address;
  final String? zipcode;
  final String? email;
  final int? orgid;
  final String? pveToken;
  final DateTime? createTime;
  final DateTime? modifyTime;
  final String? lastOtp;
  final String? verifyCode;
  final bool? isVerified;
  final DateTime? verifyExpTime;

  SysUser({
    required this.uuid,
    required this.username,
    required this.password,
    this.googleUid,
    required this.realname,
    this.nickname,
    this.idnumber,
    required this.docfile1,
    this.docfile2,
    this.docfile2type,
    this.phone,
    required this.country,
    required this.state,
    this.district,
    required this.address,
    this.zipcode,
    this.email,
    this.orgid,
    this.pveToken,
    this.createTime,
    this.modifyTime,
    this.lastOtp,
    this.verifyCode,
    this.isVerified,
    this.verifyExpTime,
  });

  SysUser copyWith({
    String? uuid,
    String? username,
    String? password,
    String? googleUid,
    String? realname,
    String? nickname,
    String? idnumber,
    String? docfile1,
    String? docfile2,
    String? docfile2type,
    String? phone,
    String? country,
    String? state,
    String? district,
    String? address,
    String? zipcode,
    String? email,
    int? orgid,
    String? pveToken,
    DateTime? createTime,
    DateTime? modifyTime,
    String? lastOtp,
    String? verifyCode,
    bool? isVerified,
    DateTime? verifyExpTime,
  }) {
    return SysUser(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      password: password ?? this.password,
      googleUid: googleUid ?? this.googleUid,
      realname: realname ?? this.realname,
      nickname: nickname ?? this.nickname,
      idnumber: idnumber ?? this.idnumber,
      docfile1: docfile1 ?? this.docfile1,
      docfile2: docfile2 ?? this.docfile2,
      docfile2type: docfile2type ?? this.docfile2type,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      state: state ?? this.state,
      district: district ?? this.district,
      address: address ?? this.address,
      zipcode: zipcode ?? this.zipcode,
      email: email ?? this.email,
      orgid: orgid ?? this.orgid,
      pveToken: pveToken ?? this.pveToken,
      createTime: createTime ?? this.createTime,
      modifyTime: modifyTime ?? this.modifyTime,
      lastOtp: lastOtp ?? this.lastOtp,
      verifyCode: verifyCode ?? this.verifyCode,
      isVerified: isVerified ?? this.isVerified,
      verifyExpTime: verifyExpTime ?? this.verifyExpTime,
    );
  }

  factory SysUser.fromJson(Map<String, dynamic> json) {
    return SysUser(
      uuid: json['uuid'],
      username: json['username'],
      password: json['password'],
      googleUid: json['googleuid'],
      realname: json['realname'],
      nickname: json['nickname'],
      idnumber: json['idnumber'],
      docfile1: json['docfile1'],
      docfile2: json['docfile2'],
      docfile2type: json['docfile2type'],
      phone: json['phone'],
      country: json['country'],
      state: json['state'],
      district: json['district'],
      address: json['address'],
      zipcode: json['zipcode'],
      email: json['email'],
      orgid: json['orgid'],
      pveToken: json['pve_token'],
      createTime: json['create_time'] != null ? DateTime.parse(json['create_time']) : null,
      modifyTime: json['modify_time'] != null ? DateTime.parse(json['modify_time']) : null,
      lastOtp: json['lastotp'],
      verifyCode: json['verifycode'],
      isVerified: json['isverified'],
      verifyExpTime: json['verifyexp_time'] != null ? DateTime.parse(json['verifyexp_time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'username': username,
      'password': password,
      'googleuid': googleUid,
      'realname': realname,
      'nickname': nickname,
      'idnumber': idnumber,
      'docfile1': docfile1,
      'docfile2': docfile2,
      'docfile2type': docfile2type,
      'phone': phone,
      'country': country,
      'state': state,
      'district': district,
      'address': address,
      'zipcode': zipcode,
      'email': email,
      'orgid': orgid,
      'pve_token': pveToken,
      'create_time': createTime?.toIso8601String(),
      'modify_time': modifyTime?.toIso8601String(),
      'lastotp': lastOtp,
      'verifycode': verifyCode,
      'isverified': isVerified,
      'verifyexp_time': verifyExpTime?.toIso8601String(),
    };
  }
}
