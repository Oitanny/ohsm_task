import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  String hotelname="HotelVista";
  List<String> hotels=['HotelVista', 'Cozy Lofts', 'Miu Lodge'];
  TextEditingController dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.green,)),
        title: Text("Sales"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded, size: 30, color:Colors.grey))
        ],

      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Align(
                alignment:Alignment.topRight,
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    
                    border:Border.all(width: 1.0, color: Colors.grey, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child:DropdownButtonHideUnderline(child:  DropdownButton<String>(
                    isExpanded: true,
                    isDense: true,
                    hint: Text('Please choose a location'),
                    value: hotelname,
                    icon: Transform.rotate(angle:-1.6 , child: Icon(Icons.arrow_back_ios_new),),
                    items: hotels.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        hotelname=value.toString();

                      });
                    },
                  ),),
                ),
              ),
              SizedBox(height: 6,),
              Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
              SizedBox(height: 6,),
              Container(
                width: 100,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF6B2B1)
                ),
                child: Center(
                  child: Text(

                    "New Entry",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Date*", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onTap: (){
                        selectDate();
                      },
                      controller: dateController,
                      decoration: InputDecoration(

                        hintText:"Select a date",
                        suffixIcon: Icon(Icons.calendar_month, color: Colors.grey),
                        border: OutlineInputBorder(
                        )

                      ),
                      readOnly: true,
                    )
                  ],

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  Future<void> selectDate() async{
    DateTime? _picked= await showDatePicker(context: context, initialDate:DateTime.now(),firstDate: DateTime(2000), lastDate: DateTime(2100));
    if(_picked!=null){
      setState(() {
        dateController.text=_picked.toString().split(" ")[0];
      });
    }
  }
}
