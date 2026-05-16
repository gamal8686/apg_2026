class Admin {

  static final List<AdminModel> admins = [

    AdminModel(
      name: "Ahmed",
      password: "1234",
    ),

    AdminModel(
      name: "Ali",
      password: "0000",
    ),

  ];

  static AdminModel? currentAdmin;

  static bool login(String password) {

    try {

      currentAdmin = admins.firstWhere(
            (admin) => admin.password == password,
      );

      return true;

    } catch (e) {

      currentAdmin = null;

      return false;
    }
  }

  static bool get isAdmin => currentAdmin != null;

  static void logout() {
    currentAdmin = null;
  }
}

class AdminModel {

  final String name;
  final String password;

  AdminModel({
    required this.name,
    required this.password,
  });
}