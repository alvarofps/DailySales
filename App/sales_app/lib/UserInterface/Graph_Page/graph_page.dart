import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salesapp/global/global.dart';
import 'package:salesapp/UserInterface/Graph_Page/chart.dart';



class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(0.075),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitleWithMoreIcon(),
                    SizedBox(height: 15),
                    buildCaseNumber(context),
                    SizedBox(height: 15),
                    Text(
                      "En Ambato",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: kTextMediumColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    WeeklyChart(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildInfoTextWithPercentage(
                          percentage: "6.43",
                          title: "Desde la semana pasada",
                        ),
                        buildInfoTextWithPercentage(
                          percentage: "9.43",
                          title: "Ganancia",
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Global",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SvgPicture.asset("icons/more.svg")
                      ],
                    ),
                    SizedBox(height: 10),
                    //Map was here before
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: mediumBlue,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "547",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: kPrimaryColorG, height: 1.2),
        ),
        Text(
          "USD",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: primaryBlue, height: 2.7),

        ),
        Container(
          width: 20,
        ),
        Text(
          "5.9% ",
          style: TextStyle(color: mediumBlue),
        ),
        SvgPicture.asset("icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Ventas",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("icons/more.svg")
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: mediumBlue,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

