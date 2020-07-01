import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:salesapp/UserInterface/Components/fab_bottom_app_bar.dart';
import 'package:salesapp/UserInterface/Components/saleCard.dart';
import 'package:salesapp/services/graphQldata.dart';
import 'package:salesapp/global/global.dart';
import 'package:flutter/foundation.dart';
import 'package:salesapp/global/text.dart';
import 'package:salesapp/UserInterface/Graph_Page/background.dart';
import 'package:salesapp/UserInterface/SalesList/sales_list.dart';

class SalesPageStateful extends StatefulWidget{

  SalesPageStateful({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SalesPageStatefulState createState() => new _SalesPageStatefulState();

}


class _SalesPageStatefulState extends State<SalesPageStateful> with TickerProviderStateMixin{

  ///This is the graphql client that allows for data to be added and displayed
  GraphQLClient client;

  ///Text editing controller, helps with the pop up when adding a sale
  final TextEditingController controller = new TextEditingController();

  ///Keeps track of the tabs
  int _lastSelected =  0;


  ///Initialize the client with this context
  initMethod(context) {
    client = GraphQLProvider.of(context).value;
  }

  void _selectedTab(int index){
    setState(() {
      _lastSelected = index;
      print("Tab $_lastSelected");
    });
  }


  @override
  Widget build(BuildContext context) {
    //Necessary to avoid weird error
    WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));

    ///Widget list of the pages to route
    final List<Widget> children = [
      SalesList(),
      Background(),
      Background(),
      Background()

    ];

    return Scaffold(
      backgroundColor: darkBlue,
      extendBody: true,
      //Instead of appBar add safe space to show date or similar
      body: Center(
        child: children[_lastSelected],
      ),
      ///The bottom navigation bar is built
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        backgroundColor: Colors.white,
        color: mediumBlue,
        ///Color when the button is touched
        selectedColor: brightBlue,
        //Shape of the notch
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
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

  ///Mehtod to build the bottom Fab
  Widget _buildFab(BuildContext context) {
    return FloatingActionButton(
      //Color of the button
      backgroundColor: lightBlue,
      hoverElevation: 10.0,
      ///On the onPressed method is where the popup to add a sale is displayed
      onPressed: () {
        showDialog(
            context: context,
            ///Do not know exactly why it should be context1
            builder: (BuildContext context1) {
              ///AlertDialog is built
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  title: Text(INGRESAR_VENTA),
                  ///This form is where the id of the sale is added
                  content: Form(
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        TextField(
                          controller: controller,
                          decoration: InputDecoration(labelText: VENTA),
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
                                      ///The mutation is callled with the client method
                                      ///.mutate
                                      ///In this method the query is indicated and the text is passed as an argument
                                      await client.mutate(
                                        MutationOptions(
                                          documentNode: gql(
                                              addVentaByItemId(controller.text)),
                                        ),
                                      );
                                      ///This serves to close the navigator
                                      ///It should be good practice to wrap it like so
                                      ///void _close()
                                      ///{
                                      ///  Navigator.pop(context);
                                      ///}
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      INGRESAR,
                                      style: TextStyle(color: Colors.white),
                                    ))))
                      ])));
            });
      },
      //This text is displayed when the user long-presses on the button and is used for accessibility.
      tooltip: INGRESAR_VENTA,
      child: Icon(Icons.add),
      elevation: 10.0,
    );
  }





}