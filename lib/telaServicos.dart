import 'package:flutter/material.dart';
import 'telaAgendamento.dart'; // Importe a tela de agendamento

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TelaServicos(),
    );
  }
}

class TelaServicos extends StatelessWidget {
  const TelaServicos({super.key});

  @override
  Widget build(BuildContext context) {
    // Defina a chave para o scaffold que irá controlar o menu lateral
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Atribuindo a chave do scaffold
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Ícone de menu
          onPressed: () {
            // Abre o menu lateral (Drawer) ao clicar no ícone
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Qual especialidade?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter Tight',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 250,
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFC62828), // Cor do menu lateral
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Color(0xFFC62828),
                child: Center(
                  child: Text(
                    'FMU Clínicas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Inter Tight',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _createDrawerItem(
                      text: 'Minhas Consultas',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      text: 'Meus Pagamentos',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      text: 'Sair',
                      onTap: () {
                        // Adicione a lógica para logout ou navegação
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            EspecialidadeButton(
              label: 'Dentista',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TelaAgendamentoWidget(especialidade: 'Dentista'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            EspecialidadeButton(
              label: 'Fisioterapia',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaAgendamentoWidget(
                        especialidade: 'Fisioterapia'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            EspecialidadeButton(
              label: 'Fonoaudiologia',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaAgendamentoWidget(
                        especialidade: 'Fonoaudiologia'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            EspecialidadeButton(
              label: 'Terapia Ocupacional',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaAgendamentoWidget(
                        especialidade: 'Terapia Ocupacional'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem({
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}

class EspecialidadeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const EspecialidadeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter Tight',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_sharp,
                  color: Color(0xFF14181B)),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
