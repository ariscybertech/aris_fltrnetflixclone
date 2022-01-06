import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
 const SignInScreen({Key key}) : super(key: key);
  
  @override
  _SignInScreenState createState() => new _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen>{
  final textControllerUser = TextEditingController(), 
    textControllerPassword = TextEditingController();

  bool bMatch = false;
  @override
  void initState() {
    super.initState();

    textControllerUser.addListener(_printLatestValue);
    textControllerPassword.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${textControllerUser.text}");
    setState(() {
      if(textControllerUser.text.length > 0 && textControllerPassword.text.length > 0){
        bMatch = true;
      }else if(textControllerUser.text.length == 0 || textControllerPassword.text.length == 0){
        bMatch = false;
      }  
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            new Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Text("Help", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
            ) 
          ],
          elevation: 0,
        ),
        body: Center(
          child: new SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 40.0, left: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(48,45,45, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: new TextFormField(
                    controller: textControllerUser,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusColor: Colors.white,
                      labelText: 'Email or phone number', 
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                ) 
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 40.0, left: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(48,45,45, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: new TextFormField(
                    controller: textControllerPassword,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusColor: Colors.white,
                      labelText: 'Password', 
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                )       
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: (bMatch == true) ? Color.fromRGBO(213,0,2, 1) : Colors.transparent,
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Center(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Recover Password", style: TextStyle(color: Colors.white),)
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .80,
                  child: Center(
                    child: RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: "Sign in is protected by Google reCAPTCHA to ensure you're note a bot. ", style: TextStyle(color: Colors.grey)),
                          new TextSpan(text: 'Learn More', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ) 
                  ) 
                )
              )
            ],
          ),
        ),
      )
    );
  }

}