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
    setState(() {

    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.white),
          backgroundColor: const Color(0xff219C90),
          title:
              const Text("Home Screen", style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(itemBuilder: (context, index) => productBox(index),itemCount: productName.length,),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff219C90),
          onPressed: () {
            Navigator.of(context).pushNamed('add');
          },
          child: Icon(Icons.add,color: Colors.white),
        ),
      ),
    );
  }
}


Widget productBox(int index)
{
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(15),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xff219C90),width: 1.5),
    ),
    child: ListTile(

      leading: Text('${productName[index]}',style: TextStyle(fontSize: 18),),
      title: Text('${productQty[index]} Qty',style: TextStyle(fontSize: 18),),
      trailing: Text('${productAmount[index]}/-',style: TextStyle(fontSize: 18),),
    ),
  );
}
