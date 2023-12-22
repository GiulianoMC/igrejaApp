import 'package:firebase_auth/firebase_auth.dart';
import 'package:appigreja/provider/auth_provider.dart';
import 'package:appigreja/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterEmailPassScreen extends StatefulWidget {
  const RegisterEmailPassScreen({Key? key}) : super(key: key);

  @override
  State<RegisterEmailPassScreen> createState() =>
      _RegisterEmailPassScreenState();
}

class _RegisterEmailPassScreenState extends State<RegisterEmailPassScreen> {
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
                            'Registrar',
                            style: TextStyle(
                              color: Color(0xFF0C1622),
                              fontSize: 28,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Preencha as informações para fazer Registro',
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
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              // Lógica para o botão
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
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Registrar',
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
