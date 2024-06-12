class Welcome {
  Users users;

  Welcome({
    required this.users,
  });

  Welcome copyWith({
    Users? users,
  }) =>
      Welcome(
        users: users ?? this.users,
      );
}

class Users {
  UserId userId;

  Users({
    required this.userId,
  });

  Users copyWith({
    UserId? userId,
  }) =>
      Users(
        userId: userId ?? this.userId,
      );
}

class UserId {
  String uid;
  PersonalInfo personalInfo;
  UserInfo userInfo;
  JobInfo jobInfo;
  Education education;
  Contact contact;
  Experience experience;
  List<String> skills;

  UserId({
    required this.uid,
    required this.personalInfo,
    required this.userInfo,
    required this.jobInfo,
    required this.education,
    required this.contact,
    required this.experience,
    required this.skills,
  });

  UserId copyWith({
    String? uid,
    PersonalInfo? personalInfo,
    UserInfo? userInfo,
    JobInfo? jobInfo,
    Education? education,
    Contact? contact,
    Experience? experience,
    List<String>? skills,
  }) =>
      UserId(
        uid: uid ?? this.uid,
        personalInfo: personalInfo ?? this.personalInfo,
        userInfo: userInfo ?? this.userInfo,
        jobInfo: jobInfo ?? this.jobInfo,
        education: education ?? this.education,
        contact: contact ?? this.contact,
        experience: experience ?? this.experience,
        skills: skills ?? this.skills,
      );
}

class Contact {
  String email;
  String phone;
  List<String> profiles;

  Contact({
    required this.email,
    required this.phone,
    required this.profiles,
  });

  Contact copyWith({
    String? email,
    String? phone,
    List<String>? profiles,
  }) =>
      Contact(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        profiles: profiles ?? this.profiles,
      );
}

class Education {
  String status;
  String profession;
  String studyCenter;
  String educationYield;
  String infoAditional;

  Education({
    required this.status,
    required this.profession,
    required this.studyCenter,
    required this.educationYield,
    required this.infoAditional,
  });

  Education copyWith({
    String? status,
    String? profession,
    String? studyCenter,
    String? educationYield,
    String? infoAditional,
  }) =>
      Education(
        status: status ?? this.status,
        profession: profession ?? this.profession,
        studyCenter: studyCenter ?? this.studyCenter,
        educationYield: educationYield ?? this.educationYield,
        infoAditional: infoAditional ?? this.infoAditional,
      );
}

class Experience {
  List<Professional> professional;
  List<Certificate> certificates;
  List<Language> language;

  Experience({
    required this.professional,
    required this.certificates,
    required this.language,
  });

  Experience copyWith({
    List<Professional>? professional,
    List<Certificate>? certificates,
    List<Language>? language,
  }) =>
      Experience(
        professional: professional ?? this.professional,
        certificates: certificates ?? this.certificates,
        language: language ?? this.language,
      );
}

class Certificate {
  String name;
  String organization;
  String startDate;
  String expirationDate;
  String credentialId;
  String credentialUrl;
  List<String> skills;

  Certificate({
    required this.name,
    required this.organization,
    required this.startDate,
    required this.expirationDate,
    required this.credentialId,
    required this.credentialUrl,
    required this.skills,
  });

  Certificate copyWith({
    String? name,
    String? organization,
    String? startDate,
    String? expirationDate,
    String? credentialId,
    String? credentialUrl,
    List<String>? skills,
  }) =>
      Certificate(
        name: name ?? this.name,
        organization: organization ?? this.organization,
        startDate: startDate ?? this.startDate,
        expirationDate: expirationDate ?? this.expirationDate,
        credentialId: credentialId ?? this.credentialId,
        credentialUrl: credentialUrl ?? this.credentialUrl,
        skills: skills ?? this.skills,
      );
}

class Language {
  String name;
  String type;

  Language({
    required this.name,
    required this.type,
  });

  Language copyWith({
    String? name,
    String? type,
  }) =>
      Language(
        name: name ?? this.name,
        type: type ?? this.type,
      );
}

class Professional {
  bool active;
  String company;
  String position;
  String startDate;
  String endDate;
  List<String> skills;

  Professional({
    required this.active,
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.skills,
  });

  Professional copyWith({
    bool? active,
    String? company,
    String? position,
    String? startDate,
    String? endDate,
    List<String>? skills,
  }) =>
      Professional(
        active: active ?? this.active,
        company: company ?? this.company,
        position: position ?? this.position,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        skills: skills ?? this.skills,
      );
}

class JobInfo {
  bool jobOffers;
  String availability;
  String cv;

  JobInfo({
    required this.jobOffers,
    required this.availability,
    required this.cv,
  });

  JobInfo copyWith({
    bool? jobOffers,
    String? availability,
    String? cv,
  }) =>
      JobInfo(
        jobOffers: jobOffers ?? this.jobOffers,
        availability: availability ?? this.availability,
        cv: cv ?? this.cv,
      );
}

class PersonalInfo {
  String names;
  String birthdate;
  String civilStatus;
  String gender;
  String country;
  String city;
  String province;
  String address;

  PersonalInfo({
    required this.names,
    required this.birthdate,
    required this.civilStatus,
    required this.gender,
    required this.country,
    required this.city,
    required this.province,
    required this.address,
  });

  PersonalInfo copyWith({
    String? names,
    String? birthdate,
    String? civilStatus,
    String? gender,
    String? country,
    String? city,
    String? province,
    String? address,
  }) =>
      PersonalInfo(
        names: names ?? this.names,
        birthdate: birthdate ?? this.birthdate,
        civilStatus: civilStatus ?? this.civilStatus,
        gender: gender ?? this.gender,
        country: country ?? this.country,
        city: city ?? this.city,
        province: province ?? this.province,
        address: address ?? this.address,
      );
}

class UserInfo {
  String email;
  String password;
  String description;

  UserInfo({
    required this.email,
    required this.password,
    required this.description,
  });

  UserInfo copyWith({
    String? email,
    String? password,
    String? description,
  }) =>
      UserInfo(
        email: email ?? this.email,
        password: password ?? this.password,
        description: description ?? this.description,
      );
}
