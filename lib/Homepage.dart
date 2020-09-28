import 'package:assignment/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectRadioTile;
  int selectRadio;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadioTile =0;
    selectRadio =0;
  }

  setSelectedRadio(int val){
    setState(() {

      selectRadio = val;
      print("${selectRadio}");

    });
  }

  validate(int checkboxValue,String name){
    if(checkboxValue!=0 && name.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: (){
          validate(selectRadio, _controller.text)?Navigator.push(context,MaterialPageRoute(builder: (context)=>nextScreen(payamount: selectRadio,customerName: _controller.text,))):Toast.show("Invalid", context);
        },
      ),
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: RadioListTile(
                  value: 399,
                  groupValue: selectRadio,

                  onChanged: (val){
                    setSelectedRadio(val);
                  },
                    selected: true,

                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Unlimited 800 MB",style: TextStyle(fontSize: 20,color: Colors.black87),),
                          Text("+75 Mins Jio to Non jio",style: TextStyle(color: Colors.black54),)
                        ],
                      ),
                      Text("399 INR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                    ],

                  )

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RadioListTile(
                    activeColor: Colors.blue,
                  value: 599,
                  groupValue: selectRadio,

                  onChanged: (val){
                    setSelectedRadio(val);
                  },
                  selected: true,

                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Unlimited 1000 MB",style: TextStyle(fontSize: 20,color: Colors.black87),),
                          Text("+200 Mins Jio to Non jio",style: TextStyle(color: Colors.black54))
                        ],
                      ),
                      Text("599 INR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                    ],

                  )

            ),
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RadioListTile(
                  activeColor: Colors.blue,
                  value: 699,
                  groupValue: selectRadio,

                  onChanged: (val){
                    setSelectedRadio(val);
                  },
                  selected: true,

                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Unlimited 1200 MB",style: TextStyle(fontSize: 20,color: Colors.black87),),
                          Text("+300 Mins Jio to Non jio",style: TextStyle(color: Colors.black54))
                        ],
                      ),
                      Text("699 INR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                    ],

                  )

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Customer Name",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),

                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
