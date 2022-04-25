import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hudson's project",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 230, 84, 15),
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 0, 0, 65),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "asset/images/background_picture.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(150, 60, 60, 80),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Image.asset(
                  "asset/images/logo.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.085,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Container(
                  color: const Color.fromARGB(140, 0, 0, 65),
                  height: MediaQuery.of(context).size.height * 0.777,
                )
              ],
            ),
            Column(
              children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                ),
                Image.asset("asset/images/project_picture.png",
                  height: MediaQuery.of(context).size.height * 0.63,
                  width: double.infinity,
                  fit: BoxFit.cover,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
