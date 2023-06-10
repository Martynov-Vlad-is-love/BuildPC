import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/text_bar/text_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //ignore: avoid-late-keyword
  late UserController _userController;

  @override
  void initState() {
    _userController = Provider.of<UserController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _loginController = TextEditingController(text: '');
    final _passwordController = TextEditingController(text: '');
    final _nameController = TextEditingController(text: '');
    final _emailController = TextEditingController(text: '');

    return Scaffold(
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
                  'Registration',
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
              TextBar(
                icon: Icons.badge_outlined,
                label: 'name',
                controller: _nameController,
              ),
              TextBar(
                icon: Icons.badge_outlined,
                label: 'eMail',
                controller: _emailController,
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
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final result = await _userController.registration(
                      _loginController.text,
                      _passwordController.text,
                      _emailController.text,
                      _nameController.text,
                    );
                    if (result != null) {
                      await GoRouter.of(context)
                          .pushNamed(AppRouteConstants.loginRouteName);
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
