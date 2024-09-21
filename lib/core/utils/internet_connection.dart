// if internet lost
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theming/color_manager.dart';
import 'assets_manager.dart';

class LostConnection extends StatelessWidget {
  const LostConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.originalWhite,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.imgLogo,
              height: MediaQuery.of(context).size.height * 0.4,),
              const SizedBox(
                height: 20.0,
              ),
                Text(
                "Whoops",
                style: TextStyleManager.font20TextColor600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
              ),
                 Text(
                "No internet connection found.\nPlease check your internet setting",
                style: TextStyleManager.font17black400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// function to solve package bug

void lostConnection() async{
  var result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none)
    {
      const LostConnection();
    }
}