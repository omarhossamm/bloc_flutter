import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/Home_page/Homepage_bloc.dart';
import 'package:mobile_shop/Home_page/Homepage_states.dart' as homestate;
import 'package:mobile_shop/Repository/Homepage_repository.dart';
import 'package:mobile_shop/Ui/Homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider<Homepagebloc>(
    create: (context) => Homepagebloc(homestate.initiat_state(), Homepagerepository()),
    child: Home_screen(),
    
  )
  ,
  );
}
