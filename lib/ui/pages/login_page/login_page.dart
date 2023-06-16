import 'package:buildpc/controller/general/user_controller.dart';
import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/text_bar/text_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//ignore_for_file: avoid-late-keyword

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final _loginController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final UserController _userController = context.read<UserController>();
    final screenSize = MediaQuery.of(context).size;

    final AppLocalizations? _locale = AppLocalizations.of(context);

    IconData visibilityIcon = Icons.visibility_off;
    if (_passwordVisible) {
      visibilityIcon = Icons.visibility;
    }

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
                child: Text(
                  '${_locale?.login}',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              TextBar(
                icon: Icons.perm_identity,
                label: '${_locale?.login}',
                controller: _loginController,
              ),
              Container(
                height: 50,
                width: 600,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.lock_open),
                      Expanded(
                        child: Text(
                          '${_locale?.password}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(visibilityIcon),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                        ),
                      )
                    ],
                  ),
                ),
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
                    final result = await _userController.authentication(
                      _loginController.text,
                      _passwordController.text,
                    );
                    if (result != null && result.role == ERole.ROLE_ADMIN) {
                      await GoRouter.of(context)
                          .pushNamed(AppRouteConstants.adminRouteName);
                    }
                  },
                  child: Text('${_locale?.enter}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_locale?.notAnAccount}',
                      textAlign: TextAlign.center,
                    ),
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
