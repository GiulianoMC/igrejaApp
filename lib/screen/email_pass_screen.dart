import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appigreja/provider/auth_provider.dart';
import 'package:appigreja/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appigreja/screen/register_email_pass_screen.dart';

import '../widgets/auth_button.dart';

class EmailPassScreen extends StatefulWidget {
  const EmailPassScreen({Key? key}) : super(key: key);

  @override
  State<EmailPassScreen> createState() => _EmailPassScreenState();
}

class _EmailPassScreenState extends State<EmailPassScreen> {
  bool isToggleActive = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor:
                      Colors.white, // Definir a cor de fundo como branca
                  automaticallyImplyLeading:
                      false, // Isso remove o botão de retorno
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF0C1622),
                              fontSize: 28,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Preencha as informações para fazer login',
                            style: TextStyle(
                              color: Color(0xFF626872),
                              fontSize: 14,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: 350,
                            height: 56,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFF0F1F5)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.email,
                                            color: Colors.grey),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: SizedBox(
                                            child: TextFormField(
                                              controller: model.emailController,
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(7),
                                                hintText: 'abc@email.com',
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Inter'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            width: 350,
                            height: 56,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFF0F1F5)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.lock,
                                            color: Colors.grey),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                model.passwordController,
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(7),
                                              hintText: 'Senha',
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Inter'),
                                            ),
                                            obscureText:
                                                !isPasswordVisible, // Toggle para ocultar/mostrar senha
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPasswordVisible =
                                                  !isPasswordVisible;
                                            });
                                          },
                                          child: Icon(
                                            isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: FlutterSwitch(
                                  value: isToggleActive,
                                  onToggle: (value) {
                                    setState(() {
                                      isToggleActive = value;
                                    });
                                  },
                                  width: 42.0,
                                  height: 24.0,
                                  toggleSize: 18.0,
                                  borderRadius: 12.0,
                                  activeColor: const Color(0xFF00ABDF),
                                  activeText: 'Ativado',
                                  inactiveText: 'Desativado',
                                  inactiveColor: Colors.grey,
                                ),
                              ),
                              const Text(
                                '  Lembrar de mim',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF0C1622),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.10,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right:
                                        15.0), // Adicione o espaçamento à direita desejado
                                child: TextButton(
                                  onPressed: () {
                                    model.resetPassword(context);
                                  },
                                  child: const Text(
                                    'Esqueceu a senha?',
                                    style: TextStyle(
                                      color: Color(0xFF626872),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              width: 350,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00ABDF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    model.authenticate();
                                    //Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Ainda não possui uma conta?',
                                style: TextStyle(
                                  color: Color(0xFF626872),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          const RegisterEmailPassScreen()));
                                },
                                child: const Text(
                                  'Criar conta',
                                  style: TextStyle(
                                    color: Color(
                                        0xFF00ABDF), // Defina a cor desejada para o texto "Criar conta"
                                    fontSize:
                                        14, // Pode ajustar o tamanho da fonte, se necessário
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Container(
                            width: 350,
                            height: 32,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 85,
                                  height: 1,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFF0F1F5),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const SizedBox(
                                  width: 108,
                                  height: 20,
                                  child: Text(
                                    'ou continue com',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF93989F),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 85,
                                  height: 1,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFF0F1F5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          AuthButton(
                            iconData: FontAwesomeIcons.apple,
                            title: " Login com Apple",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const EmailPassScreen()));
                            },
                            iconColor: Colors
                                .black, // Cor desejada para o ícone do Google
                          ),
                          const SizedBox(height: 15),
                          AuthButton(
                            iconData: FontAwesomeIcons.facebook,
                            title: " Login com Facebook",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const EmailPassScreen()));
                            },
                            iconColor: Colors
                                .blue, // Cor desejada para o ícone do Facebook
                          ),
                          const SizedBox(height: 15),
                          AuthButton(
                            iconData: FontAwesomeIcons.google,
                            title: " Login com Google",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const EmailPassScreen()));
                            },
                            iconColor: Colors
                                .red, // Cor desejada para o ícone do Google
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const HomeScreen();
            }
          });
    });
  }
}
