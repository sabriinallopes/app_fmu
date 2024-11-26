import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TelaConfirmacaoWidget extends StatelessWidget {
  final String especialidade;
  final DateTime dataSelecionada;
  final TimeOfDay horarioSelecionado;
  final String profissional;

  const TelaConfirmacaoWidget({
    Key? key,
    required this.especialidade,
    required this.dataSelecionada,
    required this.horarioSelecionado,
    required this.profissional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formatar a hora no formato de 24 horas (sem AM/PM)
    final formattedTime = _formatTimeTo24Hour(horarioSelecionado);
    final formattedDate = DateFormat('dd/MM/yyyy').format(dataSelecionada);

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Confirmar Consulta',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 250,
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
            color: const Color(0xFFC62828),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: const Color(0xFFC62828),
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
                        // colocar a lógica de sair
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirme os dados abaixo para concluir seu agendamento',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 46, 45, 45)),
            ),
            const SizedBox(height: 20),

            // Médico
            const Text(
              'Profissional',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                profissional,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Data e Hora
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          formattedDate,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          formattedTime,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação de confirmação a consulta
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Consulta confirmada com sucesso!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC62828), // Cor do botão
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirmar e finalizar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para formatar a hora no formato de 24 horas (sem AM/PM)
  String _formatTimeTo24Hour(TimeOfDay timeOfDay) {
    final DateFormat formatter = DateFormat('HH:mm'); // Formato 24 horas
    final DateTime dateTime =
        DateTime(0, 0, 0, timeOfDay.hour, timeOfDay.minute);
    return formatter.format(dateTime);
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
