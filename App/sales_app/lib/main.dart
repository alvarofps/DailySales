import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:salesapp/UserInterface/SalesPage/sales_page.dart';
import 'package:salesapp/services/graphQldata.dart';
import 'package:flutter/foundation.dart';
import 'package:salesapp/UserInterface/SplashScreen/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      GraphQLProvider(
        client: graphQlObject.client,
        child: CacheProvider(
          child: MaterialApp(
            theme: ThemeData.light(),
            home: SplashPage(),

          ),
        ),
      )
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily sales',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

