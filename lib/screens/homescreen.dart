import 'package:flutter/material.dart';
import 'package:invoice_generator_2pm/utils/productsdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.white),
          backgroundColor: const Color(0xff219C90),
          title:
              const Text("Home Screen", style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: productName.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xff219C90),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text(
                  "${productName[index]}",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  "${categoryList[index]} | ${productAmount[index]} rs.",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            productName.removeAt(index);
                            productAmount.removeAt(index);
                            categoryList.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 22,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            productName[index] = "Google";
                            productAmount[index] = 100000000000;
                            categoryList[index] = "Company";
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Color(0xff219C90),
                          size: 22,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff219C90),
          onPressed: () {
            setState(() {
              productName.add("Watch");
              productAmount.add(1200);
              categoryList.add("Smart Watch");
            });
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
