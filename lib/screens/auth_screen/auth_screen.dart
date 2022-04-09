import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: double.infinity,
        width: double.infinity,
        color: kPrimaryColor,
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                ),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      elevation: 8,color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          AppText('signup'.tr,color: Colors.black,fontWeight: FontWeight.bold,),
                          AppText('signup_msg'.tr,color: Colors.black,fontWeight: FontWeight.w200,),
                          Form(child: Column(
                            children: [
                              AppText('name'.tr,color: Colors.black,),
                              CustomTextFormField(hintText: 'name_hint'.tr, controller: nameController,
                                  keyboardType: TextInputType.text,radius: 15,),
                              AppText('email'.tr,color: Colors.black,),
                              CustomTextFormField(hintText: 'email_hint'.tr, controller: emailController,
                                  keyboardType: TextInputType.text,radius: 15,),
                              AppText('password'.tr,color: Colors.black,),
                              CustomTextFormField(hintText: 'password_hint'.tr, controller: passwordController,
                                  keyboardType: TextInputType.text,radius: 15,),
                              SizedBox(height: 70,)

                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
