import 'package:flutter/material.dart';
import 'package:salesapp/global/global.dart';

class SaleCard extends StatelessWidget {
  final String timeOfPurchase;
  final String itemName;
  final String itemPrice;

  const SaleCard(
      {Key key,
      this.timeOfPurchase,
      this.itemName,
      this.itemPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding (
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
       child: InkWell(
         onTap: () {
           //write on Tap
         },
         child:Card(
           child: ListTile(
             contentPadding: EdgeInsets.all(0),
             title: Text(itemName,  style: darkGreyFont,),
             trailing: Text(itemPrice, style: darkGreyFont,),
           ),
         )
      )
   );throw UnimplementedError();
  }
}