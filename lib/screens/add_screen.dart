import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/screens/addEcortInfo_screen.dart';
import 'package:flutter_application_1/screens/addPaitientInfo_screen.dart';

class AddScreen extends StatelessWidget {
  //const AddScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF2E266D),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return AddPatientInfo();
                })));
              }),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0XFF2E266D),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Add Patient',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return AddEscortInfo();
                })));
              }),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0XFF2E266D),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Add Escort',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Container(        
// decoration: BoxDecoration(          
// image: DecorationImage(        
//     image: AssetImage('lib/assets/login.png'),       
//      fit: BoxFit.cover,       
//    ),         
//),         
//child: ,