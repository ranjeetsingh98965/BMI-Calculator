import 'package:bmi/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor;
  var txtColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgColor,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40 , left: 20, right: 20, bottom: 20),
          child: Container(
            // margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("BMI" , style: TextStyle(fontSize: 70 , fontFamily: "Bungee"),),
                SizedBox(height: 40,),
                 TextField(
                   controller: wtController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     label: Text("Enter Your Weight"),
                     prefixIcon: Icon(Icons.line_weight),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10)
                     )
                   ),
                 ),
                SizedBox(height: 15,),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height(in feet)"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height(in inch)"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt != "" && ft != "" && inch != "")
                    {
                      //BMI Calculation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift * 12) + iInch;  // convert feet into inch and find all the inches

                      var tCm = tInch * 2.54;   //convert inches into cm

                      var tm = tCm / 100;   //convert cm into meter

                      var bmi = iwt/(tm * tm); // find BMI with formula: weight / (meter ka square)

                      var msg = "";

                      if(bmi > 25)
                        {
                          msg = "You,re OverWeight!";
                          bgColor = Colors.orange.shade200;
                          txtColor = Colors.orange.shade800;
                        }
                      else if(bmi < 18)
                        {
                          msg = "You,re UnderWeight!";
                          bgColor = Colors.red.shade200;
                          txtColor = Colors.red.shade800;
                        }
                      else
                        {
                          msg = "You,re Healthy!";
                          bgColor = Colors.green.shade200;
                          txtColor = Colors.green.shade800;
                        }

                      setState(() {
                        result = " $msg \n Your BMI is: ${bmi.toStringAsFixed(2)} ";
                      });
                    }
                  else
                    {
                      setState(() {
                        result = "Please fill all the required blanks!!";
                      });
                    }
                }, child: Text("CALCULATE" , style: TextStyle(fontSize: 15),)),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 18 , fontFamily: "TitanOne" , color: txtColor),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
