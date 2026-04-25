import 'package:flutter/material.dart';
// تأكد أنك أنشأت ملف بهذا الاسم ووضعت فيه كود صفحة تسجيل الدخول
import 'login_screen.dart';

void main() {
  runApp(const MyGoalApp());
}

class MyGoalApp extends StatelessWidget {
  const MyGoalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "حقق أهدافك",
      "desc": "قسم أهدافك الكبيرة إلى مهام صغيرة قابلة للتحقيق",
      "icon": "🎯",
      "color": "0xFF4A47F5"
    },
    {
      "title": "عادات يومية",
      "desc": "تابع عاداتك اليومية واحتفل بإنجازاتك",
      "icon": "📅",
      "color": "0xFFFF5722"
    },
    {
      "title": "كافئ نفسك",
      "desc": "اكسب شارات وجوائز مع كل إنجاز تحققه",
      "icon": "🏅",
      "color": "0xFF4CAF50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6366F1), Color(0xFFD946EF)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardContent(
                  title: onboardingData[index]["title"]!,
                  desc: onboardingData[index]["desc"]!,
                  icon: onboardingData[index]["icon"]!,
                  iconBgColor: Color(int.parse(onboardingData[index]["color"]!)),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => buildDot(index),
              ),
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر التالي / ابدأ الآن
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == 2) {
                        // الانتقال لصفحة تسجيل الدخول في ملف مستقل
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      } else {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF6366F1),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      elevation: 8,
                    ),
                    child: Text(
                      _currentPage == 2 ? "ابدأ الآن" : "التالي  >",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // زر السابق بتصميم مظلل مشابه لزر التالي
                  if (_currentPage > 0)
                    ElevatedButton(
                      onPressed: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.3),
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        elevation: 0, // ظل خفيف أو بدون لتمييزه عن "التالي"
                      ),
                      child: const Text(
                        "<  السابق",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  else
                    const SizedBox(width: 70),
                ],
              ),
            ),
          ],
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
        color: _currentPage == index ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String title, desc, icon;
  final Color iconBgColor;

  const OnboardContent({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(icon, style: const TextStyle(fontSize: 70)),
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
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}