// import 'package:flutter/material.dart';

// class LoginWidget extends StatelessWidget {
//   const LoginWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double fem = 1.0; // Ajoutez la valeur correcte de fem
//     double ffem = 1.0; // Ajoutez la valeur correcte de ffem

//     return Container(
//       padding: EdgeInsets.fromLTRB(0 * fem, 187 * fem, 0 * fem, 263 * fem),
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Color(0xffffffff),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             margin:
//                 EdgeInsets.fromLTRB(121 * fem, 0 * fem, 103 * fem, 45.9 * fem),
//             padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 36 * fem, 0 * fem),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0x3f000000),
//                   offset: Offset(0 * fem, 4 * fem),
//                   blurRadius: 2 * fem,
//                 ),
//               ],
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17 * fem, 0 * fem),
//                   width: 33 * fem,
//                   height: 30 * fem,
//                   child: Image.network(
//                     '[Image URL]',
//                     width: 33 * fem,
//                     height: 30 * fem,
//                   ),
//                 ),
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
//                   child: Text(
//                     'UN Work',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 27 * ffem,
//                       fontWeight: FontWeight.w700,
//                       height: 1.2575 * ffem / fem,
//                       color: const Color(0xff2245c1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(46 * fem, 0 * fem, 46 * fem, 125 * fem),
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(
//                       0 * fem, 0 * fem, 0 * fem, 19.1 * fem),
//                   padding: EdgeInsets.fromLTRB(
//                       23 * fem, 14.95 * fem, 23 * fem, 14.05 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xffd7dadf)),
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(8 * fem),
//                   ),
//                   child: Text(
//                     'Phone number',
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
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 19 * fem),
//                   padding: EdgeInsets.fromLTRB(
//                       23 * fem, 13.8 * fem, 23 * fem, 14.2 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xffd7dadf)),
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
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 28 * fem),
//                   width: double.infinity,
//                   child: Text(
//                     'Forgot password?',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 14 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2857142857 * ffem / fem,
//                       color: const Color(0xfff66435),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(
//                       133.45 * fem, 13.8 * fem, 124.26 * fem, 11.2 * fem),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff2245c1),
//                     borderRadius: BorderRadius.circular(8 * fem),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(
//                             0 * fem, 0 * fem, 8.78 * fem, 0 * fem),
//                         child: Text(
//                           'Login',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'SF Pro Display',
//                             fontSize: 16 * ffem,
//                             fontWeight: FontWeight.w600,
//                             height: 1.2575 * ffem / fem,
//                             color: const Color(0xffffffff),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(
//                             0 * fem, 0 * fem, 0 * fem, 3.14 * fem),
//                         width: 16.51 * fem,
//                         height: 11.73 * fem,
//                         child: Image.network(
//                           '[Image URL]',
//                           width: 16.51 * fem,
//                           height: 11.73 * fem,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 337.5 * fem, 0 * fem),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: TextStyle(
//                   fontFamily: 'SF Pro Display',
//                   fontSize: 14 * ffem,
//                   fontWeight: FontWeight.w400,
//                   height: 1.2857142857 * ffem / fem,
//                   color: const Color(0xffffffff),
//                 ),
//                 children: [
//                   TextSpan(
//                     text: 'Don’t have an account?',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 14 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2857142857 * ffem / fem,
//                       color: const Color(0xff1b1c25),
//                     ),
//                   ),
//                   const TextSpan(
//                     text: ' ',
//                   ),
//                   TextSpan(
//                     text: 'Sign up now',
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontSize: 14 * ffem,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2857142857 * ffem / fem,
//                       color: const Color(0xfff66435),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_scanner/index.dart';
import 'package:e_scanner/registre.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Login',
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
                SizedBox(height: 80),
                _LoginForm(),
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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 40),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
              bool loginSuccess = true;
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 20),
                Text('Login', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
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
      children: [
        const Text(
          ' ',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.google),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const FaIcon(FontAwesomeIcons.github),
            // ),
          ],
        )
      ],
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
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register', style: TextStyle(color: Colors.blue)),
              Icon(Icons.person),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'forgot_password');
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Forgot Password', style: TextStyle(color: Colors.blue)),
              Icon(Icons.replay_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
