import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appigreja/provider/auth_provider.dart';
import 'package:appigreja/screen/profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  late UserCredential userCredential;

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 105,
                              height: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    22), // Adjust the radius as needed
                                image: DecorationImage(
                                  image: (snapshot.data!.photoURL != null)
                                      ? NetworkImage(
                                          snapshot.data!.photoURL.toString())
                                      : const AssetImage(
                                              'assets/images/avatar2.png')
                                          as ImageProvider,
                                  fit: BoxFit
                                      .cover, // You can adjust this to control how the image is scaled
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.all(0),
                                padding: const EdgeInsets.all(0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF00AEE4),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (_) => ProfileEditScreen(
                                          notifyParent: refresh),
                                    ));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white, // Cor do ícone
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: Text(
                            snapshot.data!.displayName ?? 'Sem Nome',
                            style: const TextStyle(
                              color: Color(0xFF0C1622),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Center(
                          child: Text(
                            snapshot.data!.email ?? '',
                            style: const TextStyle(
                              color: Color(0xFF626872),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Nenhuma ação
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFFABAFB6),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notificações',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFABAFB6), // Cor do ícone
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Nenhuma ação
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFFABAFB6),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meus Alertas',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFABAFB6),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Nenhuma ação
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFFABAFB6),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Minhas Sugestões',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFABAFB6),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Nenhuma ação
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFFABAFB6),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ofertas no WhatsApp',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFABAFB6),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Nenhuma ação
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFFABAFB6),
                                    width: 0.2,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Privacidade e Segurança',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFABAFB6),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 65.0),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  model.logOut();
                                },
                                child: const Text(
                                  'Sair',
                                  style: TextStyle(
                                    color: Color(0xFF0C1622),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.logout),
                                onPressed: () {
                                  model.logOut();
                                },
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Text("Usuário Não Logado");
            },
          ),
        ],
      );
    });
  }
}
