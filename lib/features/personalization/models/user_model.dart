import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  // Keep those values in final which you don,t want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  ///Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///Helper function to get full name.
  String get fullName => '$firstName $lastName';

  ///Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  ///Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///Static function to generate a username from a full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "lgx_$camelCaseUsername"; // Add "lgx_" prefix
    return usernameWithPrefix;
  }

  ///Static function to create an empty user model.
  static UserModel empty() =>
      UserModel(id: '',
          firstName: '',
          lastName: '',
          userName: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');

  ///Convert model to json structure for storing data in Firebase.
  Map <String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  ///Factory method to create a USerModel  from a Firebase document snapshot.
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(id: document.id,
  //         firstName: data['FirstName'] ?? '',
  //         lastName: data['LastName'] ?? '',
  //         userName: data['Username'] ?? '',
  //         email: data['Email'] ?? '',
  //         phoneNumber: data['PhoneNumber'] ?? '',
  //         profilePicture: data['ProfilePicture'] ?? '',
  //     );
  //   }
  // }

}
