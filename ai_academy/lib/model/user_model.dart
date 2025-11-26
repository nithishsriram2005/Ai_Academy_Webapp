class AppUser {
  final String uid;
  final String name;
  final String dob;
  final String email;
  final String mobile;
  final String linkedin;
  final String github;
  final String resumeUrl;

  AppUser({
    required this.uid,
    required this.name,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.linkedin,
    required this.github,
    required this.resumeUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'dob': dob,
      'email': email,
      'mobile': mobile,
      'linkedin': linkedin,
      'github': github,
      'resumeUrl': resumeUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      name: map['name'],
      dob: map['dob'],
      email: map['email'],
      mobile: map['mobile'],
      linkedin: map['linkedin'],
      github: map['github'],
      resumeUrl: map['resumeUrl'],
    );
  }
}
