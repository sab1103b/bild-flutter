import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<Eventos> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Tres pestañas
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos de Fotografía'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Por realizarse'),
            Tab(text: 'En curso'),
            Tab(text: 'Finalizados'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEventsList('Por realizarse'),  // Lista de eventos por realizarse
          _buildEventsList('En curso'),       // Lista de eventos en curso
          _buildEventsList('Finalizados'),   // Lista de eventos finalizados
        ],
      ),
    );
  }

  Widget _buildEventsList(String status) {
    // Aquí puedes cargar dinámicamente los eventos basados en su estado.
    // Por ahora, solo muestra un mensaje de ejemplo.
    return Center(
      child: Text('Eventos $status'),
    );
  }
}
