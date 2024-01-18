// import 'package:flutter/material.dart';

// class RegistreWidget extends StatelessWidget {
//   const RegistreWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double fem = 1.0; // Ajoutez la valeur correcte de fem
//     double ffem = 1.0; // Ajoutez la valeur correcte de ffem

//     return Container(
//       padding: EdgeInsets.fromLTRB(29 * fem, 29 * fem, 46 * fem, 313 * fem),
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Color(0xffffffff),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 130 * fem, 80 * fem),
//             width: double.infinity,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 116 * fem, 0 * fem),
//                   width: 30 * fem,
//                   height: 30 * fem,
//                   child: Image.network(
//                     '[Image URL]', // Remplacez par une URL d'image valide
//                     width: 30 * fem,
//                     height: 30 * fem,
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
//                   child: Text(
//                     'Register',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 18 * ffem,
//                       fontWeight: FontWeight.w600,
//                       height: 1.2575 * ffem / fem,
//                       color: const Color(0xff1b1c25),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin:
//                 EdgeInsets.fromLTRB(128 * fem, 0 * fem, 111 * fem, 21 * fem),
//             padding: EdgeInsets.fromLTRB(
//                 23.46 * fem, 19 * fem, 23.46 * fem, 21 * fem),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: const Color(0xfff3f3f6),
//               borderRadius: BorderRadius.circular(50 * fem),
//             ),
//             child: Center(
//               child: SizedBox(
//                 width: 53.09 * fem,
//                 height: 60 * fem,
//                 child: Image.network(
//                   '[Image URL]', // Remplacez par une URL d'image valide
//                   width: 53.09 * fem,
//                   height: 60 * fem,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
//             child: Text(
//               'Create a New Account',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'SF Pro Display',
//                 fontSize: 18 * ffem,
//                 fontWeight: FontWeight.w600,
//                 height: 1.2575 * ffem / fem,
//                 color: const Color(0xff1b1c25),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 0 * fem, 0 * fem),
//             width: 322 * fem,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11 * fem, 38 * fem),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(
//                         fontFamily: 'SF Pro Display',
//                         fontSize: 13 * ffem,
//                         fontWeight: FontWeight.w400,
//                         height: 1.2575 * ffem / fem,
//                         color: const Color(0xff7a7b84),
//                       ),
//                       children: [
//                         const TextSpan(
//                           text: 'Do you already have an account ?',
//                         ),
//                         TextSpan(
//                           text: ' Sign in',
//                           style: TextStyle(
//                             fontFamily: 'SF Pro Display',
//                             fontSize: 13 * ffem,
//                             fontWeight: FontWeight.w400,
//                             height: 1.2575 * ffem / fem,
//                             color: const Color(0xfff66435),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 15 * fem),
//                   padding: EdgeInsets.fromLTRB(
//                       24 * fem, 14.95 * fem, 24 * fem, 14.05 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xffd7dadf)),
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(8 * fem),
//                   ),
//                   child: Text(
//                     'Enter phone number',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 13 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2575 * ffem / fem,
//                       color: const Color(0xff7a7b84),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 15 * fem),
//                   padding: EdgeInsets.fromLTRB(
//                       25 * fem, 13.8 * fem, 25 * fem, 14.2 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xffd7dadf)),
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(8 * fem),
//                   ),
//                   child: Text(
//                     'Password',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 14 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2857142857 * ffem / fem,
//                       color: const Color(0xff7a7b84),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 23 * fem),
//                   padding: EdgeInsets.fromLTRB(
//                       25 * fem, 13.8 * fem, 25 * fem, 14.2 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xffd7dadf)),
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(8 * fem),
//                   ),
//                   child: Text(
//                     'Confirm Password',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 14 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2857142857 * ffem / fem,
//                       color: const Color(0xff7a7b84),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 46 * fem,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff2245c1),
//                     borderRadius: BorderRadius.circular(5 * fem),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Register',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'SF Pro Display',
//                         fontSize: 16 * ffem,
//                         fontWeight: FontWeight.w600,
//                         height: 1.2575 * ffem / fem,
//                         color: const Color(0xffffffff),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:e_scanner/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'Registre',
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
                SizedBox(height: 20),
                _RegisterForm(),
                SizedBox(height: 40),
                _SocialLogin(),
                SizedBox(height: 40),
                _OtherOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'dashboard');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 20),
                Text('Register', style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class _OtherOptions extends StatelessWidget {
  const _OtherOptions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(color: Colors.blue)),
              Icon(Icons.person),
            ],
          ),
        ),
      ],
    );
  }
}
