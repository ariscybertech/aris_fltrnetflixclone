import 'package:flutter/material.dart';
import 'package:netflix_clone/LoginScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'assets/netflix-1.jpg',
                    body: 'Trying to \n join Netflix?',
                    desc: "You can't sign up for Netflix in the \n app. We know it's a hassle. After \n you're a member, you can start \n watching in the app.",
                    color: Color.fromRGBO(130,172,38, 1)),
                _buildPageContent(
                    isShowImageOnTop: true,
                    image: 'assets/netflix-2.png',
                    body: 'Watch on \n any device',
                    desc: "Stream on your phone, tablet, laptop, and TV.",
                    color: Color.fromRGBO(255,141,104, 1)),
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'assets/netflix-3.png',
                    body: '3,2, 1... Download!',
                    desc: "Always have something to watch offline",
                    color: Color.fromRGBO(195,169,255, 1)),
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'assets/netflix-4.png',
                    body: 'No pesky contracts',
                    desc: "Cancel anytime",
                    color: Color.fromRGBO(195,169,255, 1))
              ],
            ),
            Positioned(
              top: 5,
              left: MediaQuery.of(context).size.width * .03,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Image.asset("assets/netflix.png"),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text("Help", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text("Privacy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * .03,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (int i = 0; i < _totalPages; i++) i == _currentPage ? _buildPageIndicator(true) : _buildPageIndicator(false)
                        ]
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .94,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color:Color.fromRGBO(213,0,2, 1),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("SIGN IN", style: TextStyle(color: Colors.white),)
                          ]
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                                new SignInScreen() 
                              )
                            );
                        },
                      ) 
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({String image, String body, String desc, Color color, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image,),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 200),
              child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35,  fontWeight: FontWeight.w800, color: Colors.white),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, height: 1.2, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 7.5 : 7.5,
      width: isCurrentPage ? 7.5 : 7.5,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.red : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}