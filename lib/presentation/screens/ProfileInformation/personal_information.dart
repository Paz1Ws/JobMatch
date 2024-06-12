import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  late CollectionReference _candidatesRef =
      FirebaseFirestore.instance.collection('candidates');

  @override
  void initState() {
    super.initState();
    _candidatesRef = _firestore.collection('candidates');
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _professionController = TextEditingController();
  final _studyCenterController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de candidato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Personal Info
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombres',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su nombre completo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su correo electrónico';
                    }
                    if (!RegExp(
                            r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                        .hasMatch(value)) {
                      return 'Ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Education Info
                TextFormField(
                  controller: _professionController,
                  decoration: const InputDecoration(
                    labelText: 'Profesión',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su profesión';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _studyCenterController,
                  decoration: const InputDecoration(
                    labelText: 'Centro de estudios',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su centro de estudios';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Skills Info
                TextFormField(
                  controller: _skillsController,
                  decoration: const InputDecoration(
                    labelText: 'Habilidades (separadas por coma)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese sus habilidades';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final candidateData = {
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'profession': _professionController.text,
                        'studyCenter': _studyCenterController.text,
                        'skills': _skillsController.text
                            .split(',')
                            .map((skill) => skill.trim())
                            .toList(),
                      };
                      _candidatesRef.add(candidateData);
                    }
                  },
                  child: const Text('Guardar cambios'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
