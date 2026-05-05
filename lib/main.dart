import 'package:flutter/material.dart';
import 'menu_page.dart';

void main() {
  runApp(const AristeiaApp());
}

class AristeiaApp extends StatelessWidget {
  const AristeiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aristeia',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Cormorant',
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool esLogin = true;

  final Color dorado = const Color(0xFFC9A84B);

  final List<Map<String, String>> frases = [
    {
      "texto": "La excelencia no es un acto, sino un hábito.",
      "autor": "Aristóteles"
    },
    {
      "texto":
          "La educación es el arma más poderosa para cambiar el mundo.",
      "autor": "Nelson Mandela"
    },
    {
      "texto":
          "El éxito es la suma de pequeños esfuerzos repetidos día tras día.",
      "autor": "Robert Collier"
    },
    {
      "texto":
          "Nunca consideres el estudio como una obligación, sino como una oportunidad.",
      "autor": "Albert Einstein"
    },
  ];

  int fraseActual = 0;

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 5));

      if (!mounted) return false;

      setState(() {
        fraseActual = (fraseActual + 1) % frases.length;
      });

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final frase = frases[fraseActual];

    return Scaffold(
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
            color: Colors.black.withOpacity(0.6),
          ),

          /// CONTENIDO
          Center(
            child: Container(
              width: 1000,
              height: 580,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: dorado.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: dorado.withOpacity(0.2),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: [

                  /// PANEL IZQUIERDO
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        border: Border(
                          right: BorderSide(
                            color: dorado.withOpacity(0.2),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            '"',
                            style: TextStyle(
                              fontSize: 90,
                              color: dorado.withOpacity(0.5),
                            ),
                          ),

                          const SizedBox(height: 20),

                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              frase["texto"]!,
                              key: ValueKey(frase["texto"]),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 28,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "— ${frase["autor"]}",
                            style: TextStyle(
                              color: dorado,
                              letterSpacing: 2,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// PANEL DERECHO
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          /// LOGO
                          Container(
                            width: 90,
                            height: 90,
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

                          const SizedBox(height: 20),

                          /// TITULO
                          Text(
                            "ARISTEIA",
                            style: TextStyle(
                              color: dorado,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 6,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Supérate · Perfecciónate · Trasciende",
                            style: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 40),

                          /// TABS
                          Row(
                            children: [

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      esLogin = true;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "INICIAR SESIÓN",
                                        style: TextStyle(
                                          color: esLogin
                                              ? dorado
                                              : Colors.white54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 2,
                                        color: esLogin
                                            ? dorado
                                            : Colors.transparent,
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      esLogin = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "REGISTRARSE",
                                        style: TextStyle(
                                          color: !esLogin
                                              ? dorado
                                              : Colors.white54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 2,
                                        color: !esLogin
                                            ? dorado
                                            : Colors.transparent,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          /// LOGIN
                          if (esLogin) ...[

                            campoTexto(
                              "Correo institucional",
                              Icons.email_outlined,
                            ),

                            const SizedBox(height: 15),

                            campoTexto(
                              "Contraseña",
                              Icons.lock_outline,
                              oculto: true,
                            ),

                            const SizedBox(height: 25),

                            botonDorado("Ingresar"),

                          ] else ...[

                            /// REGISTRO
                            campoTexto(
                              "Nombre completo",
                              Icons.person_outline,
                            ),

                            const SizedBox(height: 15),

                            campoTexto(
                              "Correo institucional",
                              Icons.email_outlined,
                            ),

                            const SizedBox(height: 15),

                            campoTexto(
                              "Contraseña",
                              Icons.lock_outline,
                              oculto: true,
                            ),

                            const SizedBox(height: 15),

                            campoTexto(
                              "Confirmar contraseña",
                              Icons.lock_outline,
                              oculto: true,
                            ),

                            const SizedBox(height: 25),

                            botonDorado("Crear Cuenta"),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget campoTexto(
    String texto,
    IconData icono, {
    bool oculto = false,
  }) {
    return TextField(
      obscureText: oculto,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: texto,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(
          icono,
          color: dorado,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: dorado.withOpacity(0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: dorado.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: dorado,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget botonDorado(String texto) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: dorado,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Aristeiaapp(),
            ),
          );

        },

        child: Text(
          texto.toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}