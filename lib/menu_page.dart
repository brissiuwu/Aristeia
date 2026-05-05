import 'package:flutter/material.dart';

void main() {
  runApp(const Aristeiaapp());
}

class Aristeiaapp extends StatefulWidget {
  const Aristeiaapp({super.key});

  @override
  State<Aristeiaapp> createState() => _AristeiaappState();
}

class _AristeiaappState extends State<Aristeiaapp> {
  int paginaActual = 0;

  final Color dorado = const Color(0xFFC9A84B);

  final List<String> paginas = [
    'Dashboard',
    'Materias',
    'Análisis',
    'Retroalimentación',
    'Progreso',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            /// FONDO
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fotoolimpo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// OSCURECER
            Container(
              color: Colors.black.withOpacity(0.85),
            ),

            /// CONTENIDO
            Row(
              children: [
                /// SIDEBAR
                Container(
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    border: Border(
                      right: BorderSide(
                        color: dorado.withOpacity(0.2),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      /// LOGO
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: dorado,
                                  width: 2,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/logo.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ARISTEIA',
                                  style: TextStyle(
                                    color: dorado,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  'Excelencia Académica',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      /// BOTONES MENU
                      botonMenu(Icons.dashboard, 'Dashboard', 0),
                      botonMenu(Icons.book, 'Materias', 1),
                      botonMenu(Icons.bar_chart, 'Análisis', 2),
                      botonMenu(Icons.chat, 'Retroalimentación', 3),
                      botonMenu(Icons.trending_up, 'Progreso', 4),

                      const Spacer(),

                      /// PERFIL
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: dorado.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: dorado,
                              child: const Text(
                                'ES',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estudiante',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'estudiante@aristeia.edu',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                /// CONTENIDO PRINCIPAL
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: paginaActual == 0
                        ? dashboard()
                        : paginaActual == 1
                            ? materias()
                            : centro(
                                paginas[paginaActual],
                              ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget botonMenu(IconData icono, String texto, int index) {
    bool activo = paginaActual == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          paginaActual = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: activo ? dorado : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icono,
              color: activo ? Colors.black : Colors.white70,
            ),
            const SizedBox(width: 15),
            Text(
              texto,
              style: TextStyle(
                color: activo ? Colors.black : Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dashboard() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Panel de Control',
            style: TextStyle(
              color: dorado,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Resumen de tu rendimiento académico',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 35),

          Row(
            children: [
              Expanded(
                child: estadistica(
                  '89.5',
                  'Promedio General',
                  Icons.star,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: estadistica(
                  '12',
                  'Exámenes Completados',
                  Icons.book,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: estadistica(
                  '8',
                  'Logros Obtenidos',
                  Icons.emoji_events,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: estadistica(
                  '24h',
                  'Tiempo de Estudio',
                  Icons.access_time,
                ),
              ),
            ],
          ),

          const SizedBox(height: 35),

          Container(
            height: 320,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dorado.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Evolución del Rendimiento',
                  style: TextStyle(
                    color: dorado,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: Center(
                    child: Icon(
                      Icons.show_chart,
                      color: dorado,
                      size: 180,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget estadistica(String numero, String texto, IconData icono) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: dorado.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icono,
            color: dorado,
            size: 28,
          ),

          const Spacer(),

          Text(
            numero,
            style: TextStyle(
              color: dorado,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            texto,
            style: const TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  Widget materias() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mis Materias',
            style: TextStyle(
              color: dorado,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Selecciona una materia para iniciar un examen',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 35),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.2,
            children: [
              tarjetaMateria('Matemáticas', '85%', Icons.calculate),
              tarjetaMateria('Física', '78%', Icons.science),
              tarjetaMateria('Química', '72%', Icons.biotech),
              tarjetaMateria('Literatura', '90%', Icons.menu_book),
              tarjetaMateria('Historia', '80%', Icons.account_balance),
              tarjetaMateria('Biología', '75%', Icons.biotech_outlined),
            ],
          )
        ],
      ),
    );
  }

  Widget tarjetaMateria(String nombre, String progreso, IconData icono) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: dorado.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icono,
                color: dorado,
                size: 32,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white54,
                size: 18,
              )
            ],
          ),

          const SizedBox(height: 25),

          Text(
            nombre,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Curso Académico',
            style: TextStyle(
              color: Colors.white54,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progreso',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              Text(
                progreso,
                style: TextStyle(
                  color: dorado,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: double.parse(
                    progreso.replaceAll('%', ''),
                  ) /
                  100,
              minHeight: 8,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(dorado),
            ),
          )
        ],
      ),
    );
  }

  Widget centro(String texto) {
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          color: dorado,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}