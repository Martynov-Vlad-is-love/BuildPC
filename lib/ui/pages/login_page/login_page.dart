import 'package:buildpc/ui/widgets/text_bar/text_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.grey,
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
              const TextBar(
                icon: Icons.perm_identity,
                label: 'login',
              ),
              const TextBar(
                icon: Icons.lock_open,
                label: 'password',
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
                  onPressed: () {
                    return;
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
                        Navigator.of(context)
                            .pushNamed('/registration', arguments: context);
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