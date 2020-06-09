import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphQlObject {
  static HttpLink httpLink = HttpLink(
    uri: 'https://sales-report-app.herokuapp.com/v1/graphql',
  );
  static AuthLink authLink = AuthLink();
  static Link link = httpLink as Link;
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}

GraphQlObject graphQlObject = new GraphQlObject();


String fetchQuery() {
  return (
      """
      query GetAllSales {
  sales_report_venta {
    id
    hora_fecha
    item {
      id
      nombre
      precio
    }
  }
}
""");
}

String getIdAndPriceByName(){
  return (
  """
  query GetIdAndPriceByName {
  sales_report_item(where: {nombre: {_eq: "Rodela"}}) {
    id
    precio
  }
}
  """);}

String addVentaByItemId(id){
  return("""mutation insertVentaByItemId {
  insert_sales_report_venta(objects: {item_id: "$id"}) {
    returning {
      item {
        nombre
        precio
        id
      }
    }
  }
}""");}

