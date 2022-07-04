import 'package:flutter/material.dart';
import 'package:project_mohammad/authentication/log_in_page.dart';
import 'package:project_mohammad/components/snack_bar.dart';
import 'package:project_mohammad/project/home/dash_board_pages/Settings/change_password_page.dart';
import 'package:project_mohammad/project/projects_page.dart';

import '../../../../Api/controller/User/account_user.dart';

class DashBoardVerificationCodePage extends StatefulWidget {
  final String   currectnum;
  const DashBoardVerificationCodePage({required this.currectnum,Key? key}) : super(key: key);

  @override
  State<DashBoardVerificationCodePage> createState() => _DashBoardVerificationCodePageState(currectnum);
}

class _DashBoardVerificationCodePageState extends State<DashBoardVerificationCodePage> {
  // هاد ال controller
  // مشان ال textField
late String current ;
  _DashBoardVerificationCodePageState(String current)
  {
    this.current=current;
  }
  final verificationCodeController = TextEditingController();
  String dashBoardCorrectVerificationCode = "123456";
  bool buttonStatus = false;
  String buttonDisplayText = "Enter Code";
  Widget showIcon = Container(
    width: 10,
  );
  final verificationCodeFormKey = GlobalKey<FormState>();
String? mycode;

  //متغير ل تحديد طهور ال password
  bool passwordVisibility = true;
late Future<String> date;


  @override
  void initState() {
    verificationCodeController.addListener(() {
      bool isButtonActivate = verificationCodeController.text.length >= 6;
      setState(() {
        buttonStatus = isButtonActivate;
        isButtonActivate
            ? buttonDisplayText = "Submit"
            : buttonDisplayText = "Enter Code";
        isButtonActivate
            ? showIcon = const Icon(Icons.check)
            : const Icon(Icons.numbers);
      });
    });
    super.initState();
        date = Account_User.get_varvecation_code();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Verisy",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          // هاد container بيحوي صورة الخلفية
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "asset/images/background_picture.png",
              fit: BoxFit.cover,
            ),
          ),
          //هاد لون فوق الخلفية مشات وضوح الكتابة
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(150, 60, 60, 100),
          ),
          // هاد مشان لما نفتح ال keyboard
          // ما يعطي pixels rendered out error
          // يعني مشات  ما تطلع ال pixels  من الشاشة
          Form(
            key: verificationCodeFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  //  هاد logo  الشركة
                  Image.asset(
                    "asset/images/logo.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // هاد ال container اللي بيحتوي ع ال textFields
                  // هون شغل الربط
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        // هاد ال حقل الخاص ب ال code تبع التحقق
                        FutureBuilder(
                            future:date,
                       builder: (context, snapshot) {

                              if(snapshot.hasData)
                                {
                                  mycode=snapshot.data.toString();
                                  print('the code is $mycode');
                                }
                              return const CircularProgressIndicator();
                          },



                        )
                     ,

                        TextFormField(
                          validator: (enteredCode) =>
                          enteredCode == dashBoardCorrectVerificationCode
                              ? "inCorrect Code"
                              : null,
                          controller: verificationCodeController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              //هون انا عدلت تعديل  بالايقونة
                              Icons.ten_k,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "Code",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.deepOrange,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        //  هي كبسة ال Submit
                        // جوا ال onPressed منحط ال استدعاء تابع
                        // مقارنة الكود اللي اجا من ال database
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                            onPressed: buttonStatus
                                ? () {
                              if (verificationCodeController.text ==
                                  dashBoardCorrectVerificationCode) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => const ChangePasswordPage(),
                                  ),
                                );
                                // TheSnackBar(
                                //   context,
                                //   "Ac",
                                //   const Color.fromARGB(255, 10, 150, 10),
                                // );
                              } else {
                                final currentCode =
                                verificationCodeFormKey.currentState!;
                                // if (currentCode.validate()) {
                                //   print("accepted");
                                // }
                                TheSnackBar(
                                  context,
                                  "Please Enter A Valid Code",
                                  const Color.fromARGB(255, 150, 10, 10),
                                );
                              }
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              onSurface: Colors.grey,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal:
                                MediaQuery.of(context).size.width * 0.1,
                              ),
                              primary: const Color.fromARGB(255, 10, 150, 10),
                              elevation: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                showIcon,
                                Text(
                                  buttonDisplayText,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkVerificationCode() {
    if (verificationCodeController.text == dashBoardCorrectVerificationCode) {

    } else if (verificationCodeController.text == '') {
      TheSnackBar(
        context,
        "Please Enter Verification Code",
        const Color.fromARGB(255, 150, 10, 10),
      );
    } else {
      TheSnackBar(
        context,
        "Please Enter Verification Code",
        const Color.fromARGB(255, 150, 10, 10),
      );
    }
  }

}
