import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearchbarFocused = false;
  bool isSearchbarEmpty = false;
  int textLength = 0;
  List<String> movieArray = ["The Matrix", "Second Hand Lions", "The Bucket List", "Man on Fire",
  "The Bone Collector", "The Silence of the Lambs", "Hannibal", "Inglourious Basterds",
  "The Men Who Stare at Goats", "Atlantis: The Lost Empire", "Howel's Moving Castel",
  "Kiki's Delivery Service"];
  FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onFocusChange() {
    if(isSearchbarFocused){
      setState(() {
        isSearchbarFocused = false;
      });
    }else{
      setState(() {
        isSearchbarFocused = true;
      });
    }
  }

  Widget onType(){
    if(textLength > 0){
      return Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.75, 
        width: MediaQuery.of(context).size.width,
        child:  GridView.count(
          primary: false,
          crossAxisCount: 3,
          childAspectRatio: (1 / 1.5),
          children: List.generate(12, (index) {
            return Center(
              child:Container(
                width: MediaQuery.of(context).size.width * 0.32,
                child : Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.red,
                    child: Image.network('https://source.unsplash.com/random',fit: BoxFit.fill)
                  ),
                ),
              );
            }
        ),
      ),
    );
    }else{
      return Container(
        height: MediaQuery.of(context).size.height * 0.75, 
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20),
        child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        children: List.generate(movieArray.length,(index){
                return (index == 0)?
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Searches",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ):
                Container(
                  height: 90,
                  child :Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 130,
                          child: Card(
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.red,
                            child:  Image.network('https://source.unsplash.com/random',fit: BoxFit.fill)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            movieArray[index],
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        )
      );
    }  
  }

  Widget searchIcon() {
    if(isSearchbarFocused){
      return Icon(Icons.close, color: Color.fromRGBO(105, 105, 105, 1),);
    }else{
      return Icon(Icons.search, color: Color.fromRGBO(105, 105, 105, 1),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: SafeArea(
      child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height, 
          width: MediaQuery.of(context).size.width,
          child: Column(
            children:<Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(38, 38, 38, 1),
                ),              
                height: 36,
                child: TextField(
                  onChanged: (content) {
                    setState((){
                      textLength = content.length;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  focusNode: _focus,
                  decoration: InputDecoration(
                    prefixIcon: searchIcon(),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color.fromRGBO(125, 125, 125, 1),
                  ),
                ),
              ),
            ),
            onType(),
            ],
          )
        )
      ),
    );
  }
}





