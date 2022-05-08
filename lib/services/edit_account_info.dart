import 'package:flutter/material.dart';

class EditAccountInfo extends StatefulWidget {
  const EditAccountInfo({Key? key}) : super(key: key);

  @override
  State<EditAccountInfo> createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {
    final editingInfoFormKey = GlobalKey<FormState>();
    final newNameController = TextEditingController();
    final newPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Info",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      ),
      body: Stack(
        children: <Widget>[
          // صورة الخلفية
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
            key: editingInfoFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                    // color: Color.fromARGB(110, 200, 200, 200),
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(180, 0, 0, 65)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // هاد ال حقل الخاص ب الاسم
                        TextFormField(
                          validator: (enteredNameVal) =>
                          enteredNameVal!.length < 6
                              ? "Name is too short"
                              : null,
                          controller: newNameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "New Name",
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
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        TextFormField(
                          validator: (enteredPhoneVal) =>
                          enteredPhoneVal!.length < 9
                              ? "phone is too short"
                              : null,
                          keyboardType: TextInputType.phone,
                          controller: newPhoneController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.deepOrange,
                            ),
                            label: Text(
                              "New Phone Number",
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
                          height: MediaQuery.of(context).size.height * 0.065,
                        ),
                        //  هي كبسة ال signUp
                        // جوا ال onPressed منحط ال استدعاء تابع ارسال البيانات لل database
                        ElevatedButton(
                          onPressed: () {
                            final changeInfoFormKey = editingInfoFormKey.currentState!;
                            if(changeInfoFormKey.validate()){
                              // تابع ارسال البيانات
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            primary: const Color.fromARGB(255, 10, 150, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Icon(
                                Icons.lock_open_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Accept",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                              MediaQuery.of(context).size.width * 0.15,
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.85,
                            MediaQuery.of(context).size.height * 0.05),
                            primary: const Color.fromARGB(255, 10, 150, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15.0,
                          ),
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
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
}
