import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:salesapp/services/graphQldata.dart';
import 'package:salesapp/UserInterface/Components/saleCard.dart';

class SalesList extends StatefulWidget{

  SalesList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SalesListState createState() => new _SalesListState();

}

class _SalesListState extends State<SalesList> {

  Widget build(BuildContext context){

    return Theme(
      //Themedata allows for the dak color in the background to show properly
      //Might consider using the background design of the other widgets
      data: ThemeData(canvasColor: Colors.transparent),
      //Query object of graphql
      child: Query(
        options:
        ///QueryOptions indicates if the Query Object is a:
        ///fetchQuery
        ///mutation
        ///subscription
        ///pollInterval is how often the Query is executed
        QueryOptions(documentNode: gql(fetchQuery()), pollInterval: 1),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //Finally we return a ListView with the result of the Query in this case
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: result.data["sales_report_venta"].length,
            itemBuilder: (BuildContext context, int index) {
              //The SaleCard is built extracting the fields of the query
              return SaleCard(
                key: UniqueKey(),
                timeOfPurchase: result.data["sales_report_venta"][index]
                ["hora_fecha"]
                    .toString(),
                itemName: result.data["sales_report_venta"][index]["item"]
                ["nombre"],
                itemPrice: result.data["sales_report_venta"][index]["item"]
                ["precio"]
                    .toString(),
              );
            },
          );
        },
      ),
    );



  }

}