import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _pokeBallController;
  late AnimationController _textController;
  late AnimationController _particlesController;
  late AnimationController _progressController;

  late Animation<double> _pokeBallRotation;
  late Animation<double> _pokeBallGlow;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _particlesOpacity;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _initializeAnimations();
    _startAnimationSequence();
  }

  void _initializeAnimations() {
    _pokeBallController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _particlesController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _pokeBallRotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _pokeBallController, curve: Curves.easeInOut),
    );

  
    _pokeBallGlow = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pokeBallController, curve: Curves.easeInOut),
    );

    _textOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _particlesOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particlesController, curve: Curves.easeInOut),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
  }

  void _startAnimationSequence() async {
    _particlesController.forward();

    _pokeBallController.forward();

    _pokeBallController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pokeBallController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _pokeBallController.forward();
      }
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    _textController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _progressController.forward();

    await Future.delayed(const Duration(milliseconds: 4000));
    _navigateToNext();
  }

  void _navigateToNext() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/home/0');
    });
  }

  @override
  void dispose() {
    _pokeBallController.dispose();
    _textController.dispose();
    _particlesController.dispose();
    _progressController.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  Widget _buildPokeBall() {
    return AnimatedBuilder(
      animation: _pokeBallController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _pokeBallRotation.value * 0.5,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.4 * _pokeBallGlow.value),
                  spreadRadius: 10 * _pokeBallGlow.value,
                  blurRadius: 25,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/pokebola2.jpg', 
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingParticle(
    double left,
    double top,
    double size,
    Color color,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: AnimatedBuilder(
        animation: _particlesController,
        builder: (context, child) {
          return Opacity(
            opacity: _particlesOpacity.value * 0.7,
            child: Transform.translate(
              offset: Offset(
                20 * _particlesController.value * (left > 200 ? -1 : 1),
                -30 * _particlesController.value,
              ),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.6),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A365D), Color(0xFF2C5282), Color(0xFF3182CE)],
          ),
        ),
        child: Stack(
          children: [
            _buildFloatingParticle(50, 150, 12, const Color(0xFFFFD700)),
            _buildFloatingParticle(320, 200, 8, const Color(0xFF48BB78)),
            _buildFloatingParticle(80, 400, 10, const Color(0xFFE53E3E)),
            _buildFloatingParticle(280, 450, 14, const Color(0xFF9F7AEA)),
            _buildFloatingParticle(150, 600, 6, const Color(0xFF38B2AC)),
            _buildFloatingParticle(250, 100, 9, const Color(0xFFF56565)),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPokeBall(),

                  const SizedBox(height: 50),

                  AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      return SlideTransition(
                        position: _textSlide,
                        child: FadeTransition(
                          opacity: _textOpacity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'PokéDex',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFD700),
                                  letterSpacing: 3,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(3, 3),
                                      blurRadius: 6,
                                    ),
                                    Shadow(
                                      color: const Color(
                                        0xFFFFD700,
                                      ).withOpacity(0.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Tu enciclopedia Pokémon',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.9),
                                  letterSpacing: 1.5,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(1, 1),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '¡Hazte el mejor entrenador!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xFF48BB78),
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 80),

                  AnimatedBuilder(
                    animation: _progressController,
                    builder: (context, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 250,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                color: const Color(0xFFFFD700).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 250 * _progressAnimation.value,
                                height: 6,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFD700),
                                      Color(0xFFFFA500),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFFFFD700,
                                      ).withOpacity(0.6),
                                      blurRadius: 12,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Preparando tu aventura...',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '© 2025 PokéDex App',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Versión 1.0.0',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
