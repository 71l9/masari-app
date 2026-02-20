import 'package:flutter/material.dart';

void main() {
  runApp(const MasariApp());
}

class MasariApp extends StatelessWidget {
  const MasariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'SA'),
      home: MasariOnboarding(),
    );
  }
}

/* =========================
        MODEL
========================= */

class OnboardingModel {
  final String title;
  final String desc;
  final String icon;
  final Color color;

  const OnboardingModel({
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
  });
}

/* =========================
     ONBOARDING SCREEN
========================= */

class MasariOnboarding extends StatefulWidget {
  const MasariOnboarding({super.key});

  @override
  State<MasariOnboarding> createState() => _MasariOnboardingState();
}

class _MasariOnboardingState extends State<MasariOnboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingData = const [
    OnboardingModel(
      title: "حقق أهدافك",
      desc: "قسم أهدافك الكبيرة إلى مهام صغيرة قابلة للتحقيق",
      icon: "🎯",
      color: Color(0xFF4A47F5),
    ),
    OnboardingModel(
      title: "عادات يومية",
      desc: "تابع عاداتك اليومية واحتفل بإنجازاتك",
      icon: "📅",
      color: Color(0xFFFF5722),
    ),
    OnboardingModel(
      title: "كافئ نفسك",
      desc: "اكسب شارات وجوائز مع كل إنجاز تحققه",
      icon: "🏅",
      color: Color(0xFF4CAF50),
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage == onboardingData.length - 1) {
      // انتقال مستقبلي
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = onboardingData[_currentPage].color;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              currentColor.withOpacity(0.85),
              Colors.deepPurple,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    return MasariContent(
                      key: ValueKey(data.title),
                      title: data.title,
                      desc: data.desc,
                      icon: data.icon,
                      iconBgColor: data.color,
                    );
                  },
                ),
              ),

              /* ======= Dots ======= */

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                      (index) => buildDot(index),
                ),
              ),

              const SizedBox(height: 40),

              /* ======= Buttons ======= */

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // زر التالي
                    ElevatedButton(
                      onPressed: nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: currentColor,
                        shape: const StadiumBorder(),
                        elevation: 8,
                        shadowColor: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        _currentPage ==
                            onboardingData.length - 1
                            ? "ابدأ مساري الآن"
                            : "التالي",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    // زر السابق مع ظل
                    if (_currentPage > 0)
                      ElevatedButton(
                        onPressed: previousPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          foregroundColor: currentColor,
                          shape: const StadiumBorder(),
                          elevation: 8,
                          shadowColor: Colors.black45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        child: const Text(
                          "السابق",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    else
                      const SizedBox(width: 90),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: _currentPage == index ? 25 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Colors.white
            : Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

/* =========================
        CONTENT WIDGET
========================= */

class MasariContent extends StatelessWidget {
  final String title, desc, icon;
  final Color iconBgColor;

  const MasariContent({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        key: ValueKey(title),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: iconBgColor.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              icon,
              style: const TextStyle(fontSize: 70),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}