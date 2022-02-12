import 'package:flutter/material.dart';
import 'package:h7/test_page.dart';

import 'next_page.dart';


void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DynamicChange(),
    );
  }
}

class DynamicChange extends StatefulWidget  {
  @override
  HomePage createState() => HomePage();
}
class HomePage extends State<DynamicChange> {

  String _pin = '';
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.lock,         // รูปไอคอน
                            size: 80.0,           // ขนาดไอคอน
                            color: Colors.blueGrey,   // สีไอคอน
                          ),
                          Text('Login', style:
                            TextStyle(
                                fontSize: 26.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800)
                            ),
                          Text('Enter PIN to login', style:
                          TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w800)
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _StatusInput(1),
                        _StatusInput(2),
                        _StatusInput(3),
                        _StatusInput(4),
                        _StatusInput(5),
                        _StatusInput(6),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //color: Colors.white70,

                      child: Column(

                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               _buildCircle(context,1),
                               _buildCircle(context,2),
                               _buildCircle(context,3),
                             ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircle(context,4),
                              _buildCircle(context,5),
                              _buildCircle(context,6),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircle(context,7),
                              _buildCircle(context,8),
                              _buildCircle(context,9),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 85),
                                child: _buildCircle(context,0),
                              ),
                              _buildBackSpace(context),


                            ],
                          ),
                        TextButton(onPressed: (){
                          print('pressed forget password');
                        },
                          child:Text('ลืมรหัสผ่าน', style:
                          TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,)
                          ),
                        ),
                        ],
                      ),

                    ),
                  )


                ],
              ),
            )
        ));
  }

  bool _CheckPIN() {
    return _pin == '123456';
  }
_validate() {
    if(_pin.length == 6) {
      if(_CheckPIN()) {
        _pin = '';
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NextPage()
          ),
        );

      } else {
       print('incorrect');
        _pin = '';

       showDialog(
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Incorrect PIN'),
             content: Text('Please try again.'),
             actions: [
               TextButton(
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
                 child: Text('OK'),
               ),
             ],
           );
         },
       );
      }

    }
}

  _buildCircle(BuildContext context,int? num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        child: RaisedButton(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(75 / 2),
          ),
          focusColor: Colors.blueGrey.shade700,
          hoverColor: Colors.blueGrey.shade700,
          highlightColor: Colors.blueGrey,
          onPressed: () {
              setState(() {
                if(_pin.length < 6) {
                  _pin += '$num';



                }
               _validate();
              });


          },
          child: Center(
            child: Text(
              '$num',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

  _buildBackSpace(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,

        child: IconButton(onPressed: (){
          setState(() {
            if(_pin.length > 0) {
              _pin = _pin.substring(0,_pin.length-1);
            }

          });

        }
            , icon: Icon(
            Icons.backspace,         // รูปไอคอน
            size: 35.0,           // ขนาดไอคอน
            color: Colors.blueGrey,   // สีไอคอน
          ),)

      ),
    );
  }

  Widget _buildBackSpaceOld() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Icon(
          Icons.backspace,         // รูปไอคอน
          size: 35.0,           // ขนาดไอคอน
          color: Colors.blueGrey,   // สีไอคอน
        ),
        width: 75.0,
        height: 75.0,
        alignment: Alignment.center,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว

      ),
    );
  }

  Widget _StatusInput(int position) {
    return Container(

      child: Icon(
        Icons.circle,         // รูปไอคอน
        size: 35.0,           // ขนาดไอคอน
        color: _pin.length<position?Colors.blueGrey.shade100:Colors.blueGrey.shade400,   // สีไอคอน
      ),
      width: 50.0,
      height: 50.0,
      alignment: Alignment.center,
      //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว

    );
  }


}
