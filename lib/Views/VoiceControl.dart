import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/AddVoice.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'Custom/GlobalFunction.dart';

class VoiceControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<VoiceControl>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: Container(
            child:Column(
              children: [

                Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Padding(
                              padding:  EdgeInsets.only(top: 10),
                              child: Icon(Icons.menu,size: 25,),
                            )),

                        Container(
                          height: MediaQuery.of(context).size.height*.13,
                          width: MediaQuery.of(context).size.width*.55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(1000),
                                  bottomRight: Radius.circular(1000)
                              ),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.02,
                            right: MediaQuery.of(context).size.width*.02,
                          ),
                          child: Text(translator.translate('VoiceControl'),textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(top: 8),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),

                      ],
                    ),),
                SizedBox(height: MediaQuery.of(context).size.height*.25,),
                Row(
                  children: [
                  Image.asset("assets/images/voice speak.png",
                  width: MediaQuery.of(context).size.width*.4,
                  ),
                    Container(
                      width: MediaQuery.of(context).size.width*.2,
                      height:  MediaQuery.of(context).size.width*.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(AppTheme.primaryColor)
                      ),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*.05),
                      child: Image.asset("assets/images/microphone 1.png"),
                    ),
                    Image.asset("assets/images/voice speak2.png",
                      width: MediaQuery.of(context).size.width*.4,
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.07,),
                Text(translator.translate('YouSay')+" :"),
                SizedBox(height: 3,),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.025,
                    right: MediaQuery.of(context).size.width*.025,
                    top: 5,bottom: 5
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Color(AppTheme.primaryColor),width: 1),
                    color: Colors.white
                  ),
                  child: Text("Open The Door "),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, GlobalFunction.route(AddVoice()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(translator.translate('DoYouWantCreateListOfVoice?'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                      Text(translator.translate('Create'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        )
      ),
    );

  }
}
