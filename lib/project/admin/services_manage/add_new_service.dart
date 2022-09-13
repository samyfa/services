import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/Admin Level Operation/admin_level_cubit.dart';
import '/Api/controller/Admin/add_service_controller.dart';
import '../../../components/snack_bar.dart';

class AddNewService extends StatefulWidget {
  const AddNewService({Key? key}) : super(key: key);

  @override
  State<AddNewService> createState() => _AddNewServiceState();
}

class _AddNewServiceState extends State<AddNewService> {
  List<String> servicesList = [];

  final serviceNameController = TextEditingController();
  List<String> streetsList = [
    "WoodWard",
    "Farmer",
    "BothStreet"
  ];
  String? selectedStreet = "Select Street";
  final StreetName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Service",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontStyle: FontStyle.italic,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: const Color.fromARGB(180, 0, 0, 65),
      ),
      body: Builder(builder: (context) {
        return Stack(
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

            BlocConsumer<AdminLevelCubit, AdminLevelState>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is SuccessStatus) {
      Navigator.pop(context);
      TheSnackBar(
        context,
        'Service Add Successfully',
        const Color.fromARGB(255, 10, 150, 10),
      );
     print("success");

    }


    //في حال دخل كلمة سر خطأ
    if(state is FailureStatus)
    {
      TheSnackBar(
        context,
        "couldn't connect to server",
        const Color.fromARGB(255, 150, 10, 10),
      );
      //هون حط توست ماسج انو كلمة السر غلط
      print("رسالة الخطأ ");

    }
  },
  builder: (context, state) {
    var cubit=AdminLevelCubit.get(context);
    return SingleChildScrollView(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 40,
                      right: 40,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.704,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Color.fromARGB(180, 0, 0, 65),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          SizedBox(
                            width: 220,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3.7,
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              hint:Text("Select Street" , style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,

                              ),),
                              items: streetsList
                                  .map(
                                    (street) => DropdownMenuItem<String>(
                                      value: street,
                                      child: Text(
                                        street,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (street) => setState(() {
                                selectedStreet = street;
                                StreetName.text = street!;
                              }),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          TextField(
                            controller: serviceNameController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.add,
                                color: Colors.deepOrange,
                                size: 40,
                              ),
                              label: Text(
                                "Service Name",
                                style: TextStyle(
                                  fontSize: 24,
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
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          // buttonOfManageServices(
                          //   context,
                          //   () {
                          //      setState(() {
                          //
                          //            checkNewService(selectedStreet!, serviceNameController.text);
                          //            Add_service_Admin().Add_Service(serviceNameController.text, StreetName.text);
                          //      });
                          //   },
                          //   "Add Service",
                          //   const Color.fromARGB(255, 10, 150, 10),
                          // ),
                          ConditionalBuilder(
                              condition: state is RefreshLevelState || state is AdminLevelInitial,
                              builder: (context) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if(checkNewService(selectedStreet!,
                                        serviceNameController.text)){
                                      cubit.addService(
                                          serviceNameController.text,
                                          StreetName.text);
                                    }

                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 60),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                                  ),
                                  primary: const Color.fromARGB(255, 10, 150, 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 30.0,
                                ),
                                child: const Text(
                                  "Add Service",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ))

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  },
),
          ],
        );
      }),
    );
  }

  bool checkNewService(String selectedStreet, String serviceName) {
    if (selectedStreet == "Select Street") {
      TheSnackBar(
        context,
        'Please Select Street',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else if (serviceName == '') {
      TheSnackBar(
        context,
        'Please Enter Service Name',
        const Color.fromARGB(255, 150, 10, 10),
      );
      return false;
    } else {
      for (var service in servicesList) {
        if (serviceName == service) {
          TheSnackBar(
            context,
            'Service Name Exited',
            const Color.fromARGB(255, 150, 10, 10),
          );
          return false;
        }
      }

      return true;
    }
  }
}
