import 'package:flutter/material.dart';

void main() => runApp(const CyberpunkLabApp());

class CyberpunkLabApp extends StatelessWidget {
  const CyberpunkLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2: Cyber-Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF03001C), 
      ),
      home: const CyberProfileScreen(),
    );
  }
}

class CyberProfileScreen extends StatelessWidget {
  const CyberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CyberBackground(),
          const ScanlineOverlay(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CyberHeader(),
                  const SizedBox(height: 30),
                  const NeonInfoCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CyberBackground extends StatelessWidget {
  const CyberBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.8, -0.6),
          radius: 1.5,
          colors: [Color(0xFF301934), Color(0xFF03001C)],
        ),
      ),
    );
  }
}

class CyberHeader extends StatelessWidget {
  const CyberHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.memory_rounded, size: 80, color: Color(0xFF00F3FF)),
        const SizedBox(height: 10),
        Text(
          'Laboratory 2 Activity',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF0055),
            letterSpacing: 6,
            shadows: [
              Shadow(blurRadius: 10, color: const Color(0xFFFF0055).withOpacity(0.8)),
            ],
          ),
        ),
      ],
    );
  }
}

class NeonInfoCard extends StatelessWidget {
  const NeonInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(2), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00F3FF).withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF00F3FF), Color(0xFFFF0055)],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF03001C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column( 
          children: [
            CyberTile(icon: Icons.face, label: 'NAME', value: 'Egagamao, Brian Angelo C.'),
            Divider(color: Color(0xFF301934)),
            CyberTile(icon: Icons.code_rounded, label: 'COURSE', value: 'BS Information Technology'),
            Divider(color: Color(0xFF301934)),
            CyberTile(icon: Icons.bolt, label: 'SECTION', value: '3.6'),
          ],
        ),
      ),
    );
  }
}

class CyberTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CyberTile({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF0055), size: 24),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Color(0xFF00F3FF), fontSize: 10, letterSpacing: 2)),
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScanlineOverlay extends StatelessWidget {
  const ScanlineOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity( 
                opacity: 0.05,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.transparenttextures.com/patterns/carbon-fibre.png'),
              repeat: ImageRepeat.repeat,
            ),
          ),
        ),
      ),
    );
  }
}