import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appigreja/provider/auth_provider.dart';

class ProfileEditScreen extends StatefulWidget {
  final Function() notifyParent;
  const ProfileEditScreen({Key? key, required this.notifyParent})
      : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreen();
}

class _ProfileEditScreen extends State<ProfileEditScreen> {
  late UserCredential userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  _loadProfileData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
        _nameController.text = user.displayName!;
        _emailController.text = user.email!;
      });
    }
  }

  void _saveProfile() async {
    if (_user != null) {
      await _user?.updateDisplayName(_nameController.text);
      await _user?.updateEmail(_emailController.text);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user?.uid)
          .set({'displayName': _emailController.text});

      widget.notifyParent();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Perfil atualizado com sucesso.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Editar Perfil',
            style: TextStyle(
              color: Color(0xFF0C1622),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: (snapshot.data!.photoURL !=
                                                  null)
                                              ? NetworkImage(snapshot
                                                  .data!.photoURL
                                                  .toString())
                                              : AssetImage(
                                                      'assets/images/avatar2.png')
                                                  as ImageProvider,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Adicione a funcionalidade de edição de foto aqui
                                      },
                                      child: const Text(
                                        'Editar Foto',
                                        style: TextStyle(
                                          color: Color(0xFF0C1622),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    'Nome',
                                    style: TextStyle(
                                      color: Color(0xFF0C1622),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              Expanded(
                                                child: SizedBox(
                                                  child: TextFormField(
                                                    controller: _nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(10),
                                                      hintText: 'Lucas',
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
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Color(0xFF93989F),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                              Expanded(
                                                child: SizedBox(
                                                  child: TextFormField(
                                                    controller:
                                                        _emailController,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(10),
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
                                const SizedBox(
                                  height: 26,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Text("Usuário Não Logado");
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
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
                        _saveProfile();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Salvar alterações',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
    });
  }
}
