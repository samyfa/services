import 'package:flutter/material.dart';
import 'package:project_mohammad/project/home/home_page.dart';


import 'Api/shred_preference.dart';
import 'authentication/choose_auth_type.dart';
import 'project/projects_page.dart';
//import 'splash_screen.dart';

//String tokenUser  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';

//String tokenAdmin = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTM3MTVmNTA3MDc5ODhjNDQxMGJhODA3NjVlNzEwNGQwYTExYWRkMzIxOWY0YTA3ZDQ4ZmRhNWZhYjFiMTAzNTU3MjE0NTc5YjkyMTVmYzgiLCJpYXQiOjE2NTY1NDM0MzEuNjczMTEyLCJuYmYiOjE2NTY1NDM0MzEuNjczMTE2LCJleHAiOjE2ODgwNzk0MzEuNjY2OTc5LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.bcUsdGdE_kADK3JewonGItp4c53U90unMqGFG4z3KUQF_ZGivNOvclpf9le-gGxs5Cd-aX6EAjie1yuqs36N5O5GE2yeSph5eac3VtfktIWHc5Z7vwJNohoRG6P2UHFVFIPdRLXgVbRrG8Zo6FB_nRoS5_1u_l1yCa46jL0JxSZEObpVe1hYcaa-CmnJXx5Zm-ot-aqOOD5Dcb06qdoTaYc1UCl8fEnzZU4-1lEeVys7dgiARNniJqWshVo3rRJ25_P8m4O4YIUtP_WPcs2AqZoDdVv96Uc1R2FZbDekiM-GV1QN7dckodMpziToIUkJKc2Lg8psi9D7BiBYrn419rYi6ib3X0SbkQSokzJns5sYp7vZafXpMbd0NXqfVspJixhdaJHmsUfOMl0enbM2h6Y8SZ1XFlJfR9bykPikSbdFeVceI5Yhy5AlZNyCoWXg5O-3RkLugAzLXvK4YgD6MX0hsGnOoUWNgU8uDP8Z9YIPAZQyGAcdIpAmz6uZGi_jSt8Kk5cwkBM8RLvOx1ODX9ZO4f0-W_Q4qCSts247ZpmEkli2dSlgzRJLi476cc8T_usiHhE2Ejecxf1EWwegfwr2P-FaMyOasYf8cCs9qgzljVq7wMNWn1FDBSO2MxlNxGecMFM5megpUbg9tNssJa77ZVebfWXLDuaWPlOIap4';



String tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMThiOTJmYzBlNWE0YThkZjQ0NDM3NmRhODI0M2Q4NTc5ZDY4YmZkYzQ5MGFmN2Q2MDU4MWZlY2Y3ZjllYmVjNjRmNjFjYzExNTI2MTU2YzAiLCJpYXQiOjE2NjI2NTg3MzguNDA5MTIxLCJuYmYiOjE2NjI2NTg3MzguNDA5MTMzLCJleHAiOjE2OTQxOTQ3MzguMzgyMTQsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.JglZtVeEXuCX-y9lyoG101CDevE-s5EevM2wCDP7uDI-DLsPYrxGsK5noIei3o0xWi8bz0JjX-VVDDaAsxdmF7jhT3nBuLqy-Hqqq5Tagx_ritDwcsIuSecFirsTkoF3YHUPz5j2Z6_ZKmNfufp65gCDsKyYy_c_OBfAXnHTIsKU1n1LHseDxipD1hxOYp5RG8b23LRq2GdsGXIPh-Q7H_yfCx3H7fAYiye60D01dt_rVBD2DcneojvOqCOVGNI99syPHjz01dYFpLTpAgtrpT4Jgxi7x_bcDUVEsIWqJHSaxVWai8IGNKllJol7hRmyECz5bbZtsPdcilXygA_kpTJeziLUr8bIDuMI_q3-CbVzXnkOAyTAl5ChllVhKkrrsFdUtSe7mvud14XholKMA9-hwjznZRYvLD_e8yH-0pQ_6tVxgUZ_PAPjCtQr6-7UCUbzEEICLZ7-NqEi6WO-NLSxNqE_XULuTnmRYGVtzCnrQViqDVWl9b5AolKWWLm8rcSa83uDddOnKs6HZwY1RAqH5V1zZ63q0wU_yhW7UI7_Zpjjd-90EjYUFicg5jj-mSaMcvlQpicISIvimt8veMJXoLd_PuY_tG5x3cPZWPpteCE2OzYwM0PNnXN7xfNB8_sLSgZsE8auq3BcvU0JtNuY7vL6Q1F2KfLj_ofuHLE';


String tokenAdmin='';
Future main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//  await splashSc();
  // WidgetsFlutterBinding.ensureInitialized();
     tokenUser='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMThiOTJmYzBlNWE0YThkZjQ0NDM3NmRhODI0M2Q4NTc5ZDY4YmZkYzQ5MGFmN2Q2MDU4MWZlY2Y3ZjllYmVjNjRmNjFjYzExNTI2MTU2YzAiLCJpYXQiOjE2NjI2NTg3MzguNDA5MTIxLCJuYmYiOjE2NjI2NTg3MzguNDA5MTMzLCJleHAiOjE2OTQxOTQ3MzguMzgyMTQsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.JglZtVeEXuCX-y9lyoG101CDevE-s5EevM2wCDP7uDI-DLsPYrxGsK5noIei3o0xWi8bz0JjX-VVDDaAsxdmF7jhT3nBuLqy-Hqqq5Tagx_ritDwcsIuSecFirsTkoF3YHUPz5j2Z6_ZKmNfufp65gCDsKyYy_c_OBfAXnHTIsKU1n1LHseDxipD1hxOYp5RG8b23LRq2GdsGXIPh-Q7H_yfCx3H7fAYiye60D01dt_rVBD2DcneojvOqCOVGNI99syPHjz01dYFpLTpAgtrpT4Jgxi7x_bcDUVEsIWqJHSaxVWai8IGNKllJol7hRmyECz5bbZtsPdcilXygA_kpTJeziLUr8bIDuMI_q3-CbVzXnkOAyTAl5ChllVhKkrrsFdUtSe7mvud14XholKMA9-hwjznZRYvLD_e8yH-0pQ_6tVxgUZ_PAPjCtQr6-7UCUbzEEICLZ7-NqEi6WO-NLSxNqE_XULuTnmRYGVtzCnrQViqDVWl9b5AolKWWLm8rcSa83uDddOnKs6HZwY1RAqH5V1zZ63q0wU_yhW7UI7_Zpjjd-90EjYUFicg5jj-mSaMcvlQpicISIvimt8veMJXoLd_PuY_tG5x3cPZWPpteCE2OzYwM0PNnXN7xfNB8_sLSgZsE8auq3BcvU0JtNuY7vL6Q1F2KfLj_ofuHLE';
  tokenAdmin='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzA1YWI4ZWVhOWMzYWI0ZDY5NzgyMGI2NjFlNTBiZDNkNzg5ZTQ3NzBkNjZkZmI3Y2IwZmZhNGNmOTkwMzk5NjAzMTE2NjM0ZWM3OTQ3NDkiLCJpYXQiOjE2NjI2NTczOTYuNDkwNzg0LCJuYmYiOjE2NjI2NTczOTYuNDkwNzk2LCJleHAiOjE2OTQxOTMzOTYuMzAxMzg2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.vF0oXaTeSKQumoVcGyMRkIjBSVIW3QYH4-lEkeZ58Rj7jg3Kp5l4qYWphwOpE2VN1nAC7IcnfwSORCZdQYndT9RLSNmfpp-bu9K9CrKJSkGQADsBtEzt87vOxOI9snDY7mqqs_hkVBPMtbBAJm2-_B6txFaafJX4sfizyb5H6996GwYqptDI2Jd3BHIM8STuU52BGlvgkQVCJGzSE5LsKrMA8CwySFY3y-07jaNMQw7IzyH9PofrAoEFJSzJoxL-KT8DVbWB286g-LvxW10Z38YJbYi6vC0uzSbK1QuChNUF33VSzVenqqN38b6zVoEj34DBgrAAr0uph2cdwkExTuIOwNgtBtAXRRCMdNALXfWB78J5xsm1DmX0ECncnMxWn8Pko8nQKbGiUW4_4RTA1O_49cu3cMm4PnS9AwflN4JbMwq8zwkNFLSJbxlUHjQ2A3RbFRqrVxZD5ffZQdrh05KqkXmxPWooJuXCT74UOLUDJQqq30KzAkYAyloiOcjzRjzC77QjapK-2xLKOKuEhFgqqDNT-pkdySX7DqyIZxb8iBU7t3Ba7CNgY-_ryI0-RtSOWZXQNALSC7qKpnFegxdZRjAL5Bit1XQB9bYVB-9jrxQrB9ihJCUToJdL9ZGcdRD7vMtjDcTeV7LC_CNlCyB9WMgj9Wa13Q3Gcm6Fz14';
  runApp(const MyApp());

  await getshared();

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Barton Malow",
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MyHomePage();
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  // Widget build(BuildContext context) => const DeleteService();

 Widget build(BuildContext context) =>  ProjectsPage(false);
/*
  Widget build(BuildContext context) =>
      (tokenUser == '' && tokenAdmin == '')
          ? AuthChoosingPage()
          : (tokenAdmin == '' ? ProjectsPage(false)
                              : ProjectsPage(true));

 */
}
