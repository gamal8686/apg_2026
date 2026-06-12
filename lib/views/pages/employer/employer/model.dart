// class EmployeeModel {
//   final String id;
//   final String name;
//   final String department;
//   final String jobTitle;
//   final String phone;
//   final String email;
//   final String image;
//   final String shift;
//
//   EmployeeModel({
//     required this.id,
//     required this.name,
//     required this.department,
//     required this.jobTitle,
//     required this.phone,
//     required this.email,
//     required this.image,
//     required this.shift,
//   });
// }


class DepartmentModel {
  final int id;
  final String name;

  DepartmentModel({
    required this.id,
    required this.name,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
class EmployeeModel {
  final int id;
  final String name;
  final String phone;
  final String image;
  final String jobTitle;
  final String department;
  final String email;
  final String authUserId;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.jobTitle,
    required this.department,
    required this.email,
    required this.authUserId,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'] ?? '',
      jobTitle: json['job_title'],
      email: json['email'] ?? '',
      department: json['departments'] != null
          ? json['departments']['name']
          : '',
      authUserId: json['auth_user_id'] ?? '',

    );
  }}