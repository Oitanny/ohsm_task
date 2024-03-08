import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelvista/controller/food_item.dart';
import 'package:hotelvista/models/item.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<FoodItem> items = foodItems;
  List<FoodItem> items2 = foodItems;
  String hotelname = "HotelVista";
  List<String> hotels = ['HotelVista', 'Cozy Lofts', 'Miu Lodge'];
  String paym = "RazorPay";
  List<String> newFoodItems = foodItems.map((e) => e.name).toList();
  String? newFoodName;
  double? newFoodPrice;
  List<String> paymentMode = ['RazorPay', 'Credit Card', 'Debit Card'];
  List<List<String>> addedFoods = [];
  TextEditingController dateController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController guestnameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  TextEditingController _searchController2 = TextEditingController();

  double x = 0;
  double y = 0;

  TextEditingController qcont = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFDFFFEC),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            )),
        title: Text("Sales"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded, size: 30, color: Colors.grey))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFDFFFEC),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        isDense: true,
                        value: hotelname,
                        icon: Transform.rotate(
                          angle: -1.6,
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                        items: hotels.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            hotelname = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFF6B2B1)),
                  child: Center(
                    child: Text(
                      "New Entry",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 12),
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
                      Text(
                        "Date*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {
                          selectDate();
                        },
                        controller: dateController,
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Select a date",
                            suffixIcon:
                                Icon(Icons.calendar_month, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20))),
                        readOnly: true,
                      )
                    ],
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
                      Text(
                        "Phone Number*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: phnController,
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "+91 XXXXX XXXXX",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20))),
                      )
                    ],
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
                      Text(
                        "Guest Name*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: guestnameController,
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "John Doe",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
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
                      Text(
                        "Sales Category*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: categoryController,
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter a category",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add Item",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _searchController,
                      onChanged: (value) => {searchFood(value)},
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search a food item",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),

                    Visibility(
                      visible: _searchController.text.length != 0,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final food = items[index];
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0)),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    x = food.price;
                                    _searchController.clear();
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return newalertFilled(
                                            food.name, food.price);
                                      });
                                    },
                                  );
                                },
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(food.name),
                                      Text(food.price.toString())
                                    ]),
                              ),
                            );
                          }),
                    )
                    // Container(
                    //   padding: EdgeInsets.all(7),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //       color: Colors.black
                    //     ),
                    //       borderRadius: BorderRadius.circular(20)
                    //       // isDense: true,
                    //       // filled: true,
                    //       // fillColor: Colors.white,
                    //       // hintText:"Enter a category",
                    //       // border: OutlineInputBorder(
                    //       //     borderRadius: BorderRadius.circular(20)
                    //       //
                    //       // )
                    //
                    //   ),
                    //   child: Autocomplete<String>(
                    //     optionsBuilder: (TextEditingValue textEditingValue){
                    //       List<String> formattedFoodItems = controller!.foodItems.map((foodItem) => '${foodItem.name.toLowerCase()} ${foodItem.price.toStringAsFixed(2)}').toList();
                    //       if (textEditingValue.text == '') {
                    //         return const Iterable<String>.empty();
                    //       }
                    //       return  formattedFoodItems.where((String option) {
                    //         return option.contains(textEditingValue.text.toLowerCase());
                    //       });
                    //     },
                    //     onSelected: (String selection) {
                    //       debugPrint('You just selected $selection');
                    //     },
                    //
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: addedFoods.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#$index",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 23),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        setState(() {
                                          addedFoods.removeAt(index);

                                        });
                                      },
                                      icon: Icon(
                                          Icons.close,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [

                                      Text(addedFoods[index][0]),

                                    Text("INR ${addedFoods[index][1]}"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sub Total"),
                                    Text(
                                        "${addedFoods[index][1]} x ${addedFoods[index][2]} = INR ${double.parse(addedFoods[index][1]) * int.parse(addedFoods[index][2])}"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total"),
                                    Text(
                                        "INR ${double.parse(addedFoods[index][1]) * int.parse(addedFoods[index][2])}"),
                                  ],
                                ),
                              ],
                            ));
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR 80.00",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_box, color: Colors.pink),
                              Text(
                                "Total Amount:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            "INR 80.00",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Balance Due:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Text(
                            "INR 0.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return newalertNotFilled();
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Item +',
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mode of Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.0,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            value: paym,
                            icon: Transform.rotate(
                              angle: -1.6,
                              child: Icon(Icons.arrow_back_ios_new),
                            ),
                            items: paymentMode.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                paym = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
                      Text(
                        "Notes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: categoryController,
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width, 60),
                      shape: RoundedRectangleBorder()),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  void searchFood(String query) {
    final suggestions = items.where((element) {
      final foodTitle = element.name.toLowerCase();
      final foodPrice = element.price;
      final input = query.toLowerCase();
      return foodTitle.contains(input);
    }).toList();
    setState(() {
      if (query.isEmpty) {
        items = items2;
      } else if (suggestions.isNotEmpty) {
        items = suggestions;
      } else {
        items = [];
      }
    });
  }

  Widget newalertFilled(String name, double price){
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Item Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: name,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
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
                    Text(
                      "Quantity/Unit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: qcont,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => {
                        setState(() {
                          if (value.isNotEmpty) {
                            double rate = int.parse(value) * price;
                            x = rate;
                          } else {
                            x = 0.0;
                          }
                          print(x);
                        })
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter amount",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
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
                    Text(
                      "Rate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: x.toString(),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                List<String> newFood = [name, price.toString(), qcont.text];
                addedFoods.add(newFood);
                print(newFood);
                qcont.text="1";
                Navigator.of(context).pop();
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                List<String> newFood = [name, price.toString(), qcont.text];
                addedFoods.add(newFood);
                print(newFood);
                qcont.text="1";
                x=0;
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                        builder: (context, setState) {
                          return newalertNotFilled();
                        });
                  },
                );
              },
              child: Text('Save & New'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
            ),
          ),
        ],
      );
    });
  }


///-----------------------------------------------------------------------------------------------------------------------------------

  Widget newalertNotFilled() {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Item Name",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Autocomplete<String>(
                          optionsBuilder:(TextEditingValue textEditingValue){
                            if(textEditingValue.text==""){
                              return const Iterable<String>.empty();
                            }
                            return newFoodItems.where((element) {
                              return element.toLowerCase().contains(textEditingValue.text.toLowerCase());
                            }
                            );
                          },
                          onSelected: (item){
                            setState((){
                              newFoodName=item;
                              FoodItem fitem = foodItems.firstWhere((element) => element.name == item);
                              double? price = fitem != null ? fitem.price : null;
                              newFoodPrice=price;
                              x=price!;
                            });
                          },
                      ),
                    )
                  ],
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
                    Text(
                      "Quantity/Unit",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: qcont,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => {
                        setState(() {
                          if (value.isNotEmpty) {
                            double rate = int.parse(value) * newFoodPrice!;
                            x = rate;
                          } else {
                            x = 0.0;
                          }
                          print(x);
                        })
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter amount",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
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
                    Text(
                      "Rate",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: x.toString(),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                List<String> newFood = [newFoodName!, newFoodPrice.toString(), qcont.text];
                addedFoods.add(newFood);
                print(newFood);
                qcont.text="1";
                Navigator.of(context).pop();
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                List<String> newFood = [newFoodName!, newFoodPrice.toString(), qcont.text];
                addedFoods.add(newFood);
                print(newFood);
                qcont.text="1";
                x=0;
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                        builder: (context, setState) {
                          return newalertNotFilled();
                        });
                  },
                );

              },
              child: Text('Save & New'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
            ),
          ),
        ],
      );
    });
  }
}
