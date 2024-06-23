class PersonalInfo {
  final String? names;
  final String? birthdate;
  final String? civilStatus;
  final String? gender;
  final String? country;
  final String? city;
  final String? province;
  final String? address;

  PersonalInfo({
    required this.names,
    this.birthdate,
    this.civilStatus,
    this.gender,
    this.country,
    required this.city,
    required this.province,
    required this.address,
  });

  factory PersonalInfo.fromJson(Map<String?, dynamic> json) => PersonalInfo(
        names: json['names'] as String?,
        birthdate: json['birthdate'] as String?,
        civilStatus: json['civilStatus'] as String?,
        gender: json['gender'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
        province: json['province'] as String?,
        address: json['address'] as String?,
      );
}

class UserInfo {
  final String? description; // Allow null for optional fields

  UserInfo({
    this.description,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        description: json['description'] as String?,
      );
}

class Education {
  final String? status;
  final String? profession;
  final String? studyCenter;
  final String? yield;
  final String? infoAditional;

  Education({
    this.status,
    this.profession,
    required this.studyCenter,
    this.yield,
    this.infoAditional,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        status: json['status'] as String?,
        profession: json['profession'] as String?,
        studyCenter: json['studyCenter'] as String?,
        yield: json['yield'] as String?,
        infoAditional: json['infoAditional'] as String?,
      );
}

class ProfessionalExperience {
  final bool? active;
  final String? company;
  final String? description; // Allow null for optional fields
  final String? position;
  final String? startDate;
  final String? endDate;
  final List<String?> skills;

  ProfessionalExperience({
    required this.active,
    required this.company,
    this.description,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.skills,
  });

  factory ProfessionalExperience.fromJson(Map<String, dynamic> json) =>
      ProfessionalExperience(
        active: json['active'] as bool?,
        company: json['company'] as String?,
        description: json['description'] as String?,
        position: json['position'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        skills: (json['skills'] as List<dynamic>).cast<String?>(),
      );
}

class Experience {
  final List<ProfessionalExperience> professional;
  final List<dynamic>
      proyects; // Keep proyects dynamic as its structure might be unknown
  final List<dynamic> certificates; // Similar to proyects
  final List<dynamic> language; // Similar to proyects

  Experience({
    required this.professional,
    required this.proyects,
    required this.certificates,
    required this.language,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        professional: (json['professional'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map((exp) => ProfessionalExperience.fromJson(exp))
            .toList(),
        proyects: json['proyects'] as List<dynamic>,
        certificates: json['certificates'] as List<dynamic>,
        language: json['language'] as List<dynamic>,
      );
}

class User {
  final PersonalInfo personalInfo;
  final UserInfo userInfo;
  final Education education;
  final Experience experience;
  final List<dynamic>
      skills; // Keep skills dynamic as its structure might be unknown

  User({
    required this.personalInfo,
    required this.userInfo,
    required this.education,
    required this.experience,
    required this.skills,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        personalInfo: PersonalInfo.fromJson(json['personalInfo']),
        userInfo: UserInfo.fromJson(json['userInfo']),
        education: Education.fromJson(json['education']),
        experience: Experience.fromJson(json['experience']),
        skills: json['skills'] as List<dynamic>,
      );
}
