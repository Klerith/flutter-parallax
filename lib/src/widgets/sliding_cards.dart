import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() { 
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener((){

      setState(()=> pageOffset = pageController.page );

    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Global Design Award 2018',
            date: '4.20-30',
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong',
            date: '4.28-31',
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1
          ),
        ],
      )
    );
  }
}

class SlidingCard extends StatelessWidget {

  final String name;
  final String date;
  final String assetName;
  final double offset;

  SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName, 
    @required this.offset,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: Image.asset(
              'assets/$assetName',
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment( -offset, 0 ),
              fit: BoxFit.none,
            ),
          ),
          SizedBox( height: 8 ),
          Expanded(
            child: CardContent(
              name: name,
              date: date
            )
          )
        ],
      ),
    );
  }

}

class CardContent extends StatelessWidget {

  final String name;
  final String date;

  CardContent({
    @required this.name,
    @required this.date
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
          SizedBox( height: 8 ),
          Text( date, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Row(
            children: <Widget>[
              RaisedButton(
                color: Color(0xFF162A49),
                child: Text('Reserve'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)
                ),
                onPressed: (){},
              ),
              Spacer(),
              Text(
                '0.00 \$',
                style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(width: 16)
            ],
          )
        ],
      ),
    );
  }
  

}


