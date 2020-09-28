import 'package:assignment/Model/pinkvillaModel.dart';
import 'package:assignment/network/networkHandler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:toast/toast.dart';
class nextScreen extends StatefulWidget {
  final int payamount;
  final String customerName;



  const nextScreen({Key key, this.payamount, this.customerName}) : super(key: key);

  @override
  _nextScreenState createState() => _nextScreenState();
}

class _nextScreenState extends State<nextScreen> {
  static final  now = new DateTime.now();
  String formatter = DateFormat('dd-MM-yyyy').format(now);
  int len_Data;
  static Random random = new Random();
  String giftedBy="";

  List<PinkVillaModel> _pinkVilaModelData = <PinkVillaModel>[];
  Future getData() async{
    final Stream<PinkVillaModel> stream = await fetchingResponse();
    stream.listen((PinkVillaModel pinkVillaModel) { 
      _pinkVilaModelData.add(pinkVillaModel);
      return _pinkVilaModelData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator(),);
            default:
              if(snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("name"),
                        leading: Icon(Icons.person),
                        trailing: Text(widget.customerName.toString(),style: TextStyle(fontSize: 20),),
                      ),
                      ListTile(
                        title: Text("Amount"),
                        leading: Icon(Icons.attach_money),
                        trailing: Text("INR ${widget.payamount}",style: TextStyle(fontSize: 20),),
                      ),
                      ListTile(
                        title: Text("Date"),
                        leading: Icon(Icons.date_range),
                        trailing: Text(formatter.toString(),style: TextStyle(fontSize: 20),),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Visibility(
                        visible: giftedBy.isEmpty?false:true,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.blueGrey,
                            child: ListTile(

                              title: Text("Gifted By", style: TextStyle(color: Colors.white),),
                              leading: Icon(Icons.card_giftcard,color: Colors.white,),
                              trailing: Text(giftedBy.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                            ),
                          ),
                        ),
                      ),


                      Center(
                        child:  FlatButton(
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text("Get Data From API"),
                          onPressed: (){

                            setState(() {
                              int randomNumber = random.nextInt(7);
                              giftedBy = _pinkVilaModelData[randomNumber].name;


                            });




                          },
                        ),
                      )


                    ],
                  ),
                );
          }
        },
      ),


    );
  }
}
