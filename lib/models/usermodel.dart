
class UserModel {
  String uid;
  String email;

  UserModel({
    this.uid="uid",
    this.email="email",
  });
}
//   UserModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
//     uid = doc.documentID;
//     email = doc.data['email'];
//     accountCreated = doc.data['accountCreated'];
//     fullName = doc.data['fullName'];
//     groupId = doc.data['groupId'];
//     notifToken = doc.data['notifToken'];
//   }
// }
