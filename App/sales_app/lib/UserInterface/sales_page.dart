import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:salesapp/models/fab_bottom_app_bar.dart';
import 'package:salesapp/models/fab_with_icons.dart';
import 'package:salesapp/models/layout.dart';
import 'package:salesapp/UserInterface/intray/saleCard.dart';
import 'package:salesapp/services/graphQldata.dart';
import 'package:salesapp/models/global.dart';
import 'package:flutter/foundation.dart';


class SalesPage extends StatelessWidget{
  GraphQLClient client;
  final TextEditingController controller = new TextEditingController();
  initMethod(context) {
    client = GraphQLProvider.of(context).value;
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));

    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Theme(
          data: ThemeData(
              canvasColor: Colors.transparent
          ),
          child: Query(
            options: QueryOptions(documentNode: gql(fetchQuery()), pollInterval: 1),
            builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.loading) {
                return Center(child: CircularProgressIndicator(),);
              }

              return ListView.builder(
                itemCount: result.data["sales_report_venta"].length,
                itemBuilder: (BuildContext context, int index) {
                  return SaleCard(
                    key: UniqueKey(),
                    timeOfPurchase: result.data["sales_report_venta"][index]["hora_fecha"].toString(),
                    itemName: result.data["sales_report_venta"][index]["item"]["nombre"],
                    itemPrice: result.data["sales_report_venta"][index]["item"]["precio"].toString(),
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        backgroundColor: Colors.white,
        color: mediumBlue,
        selectedColor: brightBlue,
        notchedShape: CircularNotchedRectangle(),
        //onTabSelected: //Iplement on tabSelected,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: lightBlue,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context1) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  title: Text("Add task"),
                  content: Form(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(labelText: "Task"),
                            ),
                            Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: RaisedButton(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        color: Colors.black,
                                        onPressed: () async {
                                          await client.mutate(
                                            MutationOptions(
                                              documentNode: gql(addVentaByItemId(
                                                  controller.text)),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Add",
                                          style: TextStyle(color: Colors.white),
                                        ))))
                          ])));
            });
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
      elevation: 2.0,
    );
  }



}