import 'package:flutter/material.dart';

class AlertasRecomendacoesScreen extends StatelessWidget {
  const AlertasRecomendacoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas e Recomendações'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alertas de Segurança',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 8),
            AlertBox(
              title: 'Senha Fraca',
              message: 'Evite usar senhas curtas ou que contenham apenas letras. Tente misturar números e caracteres especiais.',
              icon: Icons.warning,
              iconColor: Colors.orange,
            ),
            AlertBox(
              title: 'Uso de Senhas Repetidas',
              message: 'Senhas repetidas em diferentes contas aumentam o risco de vazamento. Use senhas únicas para cada serviço.',
              icon: Icons.error,
              iconColor: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'Recomendações de Segurança',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            RecommendationBox(
              title: 'Habilite Autenticação de Dois Fatores',
              message: 'Ative a autenticação de dois fatores (2FA) para aumentar a segurança das suas contas.',
              icon: Icons.shield,
              iconColor: Colors.green,
            ),
            RecommendationBox(
              title: 'Use um Gerenciador de Senhas',
              message: 'Guarde suas senhas em um gerenciador seguro. Evite armazenar senhas em notas ou documentos desprotegidos.',
              icon: Icons.lock,
              iconColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;

  const AlertBox({
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
      ),
    );
  }
}

class RecommendationBox extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;

  const RecommendationBox({
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
      ),
    );
  }
}
