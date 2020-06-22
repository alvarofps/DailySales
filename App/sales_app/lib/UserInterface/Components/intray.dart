import 'dart:math';

import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/Components//saleCard.dart';
import 'package:salesapp/models/classes/sale.dart';
import 'package:salesapp/models/global.dart';

class IntrayPage extends StatefulWidget {


  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {

List <Venta> ventaList = [];

  @override
  Widget build(BuildContext context) {
    ventaList = getList();

    return Container(
      color: darkGreyColor,
      child: _buildReorderableListSimple(context),
    );
  }

  List<Venta> getList()
  {
    for(int i = 0; i < 21; i++)
      {
        Venta t = new Venta( DateTime.now(), "Item_" + i.toString(), Random(i).nextDouble()*100);
        ventaList.add(t);
      }
    return ventaList;
  }

  Widget _buildListTile(BuildContext context, Venta venta)
  {
    return SaleCard(
      key: UniqueKey(),
      timeOfPurchase: venta.timeOfPurchase.toString(),
      itemName: venta.itemName,
      itemPrice: venta.itemPrice.toStringAsFixed(2),

    );
  }

  Widget _buildReorderableListSimple(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent
      ),
      child: ReorderableListView(
        padding: EdgeInsets.only(top: 210.0),
        children: ventaList.map((Venta item) => _buildListTile(context, item)).toList(),
        onReorder: (oldIndex, newIndex){
          setState(() {
            Venta item = ventaList[oldIndex];
            ventaList.remove(item);
            ventaList.insert(newIndex, item);
          });
        },
      ),
    );
  }

}