import 'dart:async';

import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/text_bar/text_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//ignore_for_file: avoid-late-keyword

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final UserController _userController = context.read<UserController>();
    final screenSize = MediaQuery.of(context).size;
    final _loginController = TextEditingController(text: '');
    final _passwordController = TextEditingController(text: '');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45, bottom: 120),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              TextBar(
                icon: Icons.perm_identity,
                label: 'login',
                controller: _loginController,
              ),
              TextBar(
                icon: Icons.lock_open,
                label: 'password',
                controller: _passwordController,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.only(top: 120),
                height: 40,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final result = await _userController.authentication(
                      _loginController.text,
                      _passwordController.text,
                    );
                    if (result != null && result.roles == ERole.ROLE_ADMIN) {
                       await GoRouter.of(context)
                          .pushNamed(AppRouteConstants.adminRouteName);
                    }
                  },
                  child: const Text('Enter'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not an account?'),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(AppRouteConstants.registrationRouteName);
                      },
                      child: const Text('Register'),
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
