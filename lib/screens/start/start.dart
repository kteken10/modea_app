import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
  

    return Scaffold(
      body: Stack(
        children: [
          // Fond gradient (conservé comme dans votre version originale)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary.withOpacity(0.3),
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary.withOpacity(0.6),
                  AppColors.primary,
                  Color.lerp(AppColors.primary, AppColors.ternary, 0.1)!,
                ],
                stops: const [0.0, 0.3, 0.6, 0.9, 1.0],
              ),
            ),
          ),

        
          Center(
            child: SizedBox(
              height: screenSize.height * 0.79,
              width: screenSize.width * 0.9,
              child: Image.asset(
                'assets/images/girl_smile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Nom de la marque, en deux lignes, sur l'image
          Positioned(
            top: screenSize.height * 0.4, // Ajustez la position verticale
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Première ligne : MOD
                  const Text(
                    "MOD",
                    style: TextStyle(
                      fontSize: 140, // Taille du texte
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                       letterSpacing: 20.0, // Espacement horizontal des lettres
                    ),
                  ),
                  // Deuxième ligne : ÉA
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize:100, // Taille du texte
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Facultatif : police personnalisée
                         letterSpacing: 20.0, // Espacement horizontal des lettres
                      ),
                      children: [
                        TextSpan(
                          text: "É",
                          style: TextStyle(color: AppColors.primary), // Orange
                        ),
                        TextSpan(
                          text: "A",
                          style: TextStyle(color: Colors.white), // Blanc
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bouton et icône en bas
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Bouton principal
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 0),
                 
                    child: Button(
                      text: "Let's Get Started",
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth');
                      },
                    
                      borderRadius: 30,
                    ),
                  ),
                ),

                // Cercle avec icône
                Container(
                  width: 50,
                 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 24),
                    color: AppColors.primary,
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}