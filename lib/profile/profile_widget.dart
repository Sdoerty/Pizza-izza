import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../style/style.dart';

class ProfileModel extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _phoneController = TextEditingController();

  Future<String?> signInWithPhone(String phone, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async{
        await _auth.signInWithCredential(credential);
        UserCredential result = await _auth.signInWithCredential(credential);
        User? user = result.user;
        if(user != null){
          print(user);
        }else{
          print("Error");
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = 'xxxx';
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileModel(),
        child: ProfileDetailWidget());
  }
}

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileModel>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        width: 200,
                        child: Image.asset('assets/pizza_logo.png')),
                    SizedBox(height: 15),
                    Text('Вход', style: titleStyle()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                  width: double.infinity,
                  child: Text(
                      'Введите имя и номер телефона, чтобы зарегистрироваться и продолжить оформление заказа',
                      overflow: TextOverflow.clip)),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Имя',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: model._phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Номер телефона',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final phone = model._phoneController.text.trim();
                  model.signInWithPhone(phone, context);
                },
                child: Text('Войти'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(40, 12, 40, 12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

