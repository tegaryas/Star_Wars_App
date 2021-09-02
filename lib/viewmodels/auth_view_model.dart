import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starwars_app/helper/local_storage.dart';
import 'package:starwars_app/models/user_model.dart';
import 'package:starwars_app/screens/control_view.dart';
import 'package:starwars_app/service/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? email, password, name;

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value!.email;

  final LocalStorageData localStorageData = Get.find();

  void initState() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
    // if (_firebaseAuth.currentUser != null) {
    //   getCurrentUserData(_firebaseAuth.currentUser!.uid);
    // }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _firebaseAuth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(ControllView());
    });
  }

  // void getCurrentUserData(String uid) async {
  //   await FireStoreUser().getCurrentUser(uid).then((value) {
  //     setUser(UserModel.fromJson(value.data()));
  //   });
  // }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
