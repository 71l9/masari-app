import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFFD946EF)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.emoji_events, color: Colors.yellow, size: 80),
                  const SizedBox(height: 10),
                  const Text("إنجازاتي", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const Text("احتفل بنجاحاتك وتقدمك", style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatBox("8", "شارات", Icons.military_tech, Colors.yellow),
                      _buildStatBox("8", "المستوى", Icons.star, Colors.amber),
                      _buildStatBox("12", "دورة", Icons.trending_up, Colors.greenAccent),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("الإنجازات الأخيرة", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),

                  _buildAchievementCard("متعلم متميز", "أكملت 10 دروس", "2024-02-15", "ذهبي", Icons.emoji_events),
                  _buildAchievementCard("ملتزم", "سجلت دخول لمدة 30 يوم متتالي", "2024-03-01", "ذهبي", Icons.fitness_center),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("التحدي التالي", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                          const Text(
                            "أكمل 5 دروس أخرى للحصول على شارة \"متعلم نشط\"",
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            children: [
                              Container(
                                height: 12,
                                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                              ),
                              FractionallySizedBox(
                                widthFactor: 0.6,
                                child: Container(
                                  height: 12,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text("3 من 5 دروس", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
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

  Widget _buildStatBox(String value, String label, IconData icon, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(String title, String desc, String date, String rank, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(color: const Color(0xFFFFF9C4), borderRadius: BorderRadius.circular(10)),
                      child: Text(rank, style: const TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFFFB74D), Color(0xFFFFA000)]),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _showResult = false;
  bool _isCorrect = false;

  void _checkAnswer(String selectedOption) {
    setState(() {
      _isCorrect = (selectedOption == "JavaScript");
      _showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFFD946EF)]),
        ),
        child: _showResult ? _buildResult() : _buildQuiz(),
      ),
    );
  }

  Widget _buildQuiz() {
    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text("1/1", style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(width: 15),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(value: 1, backgroundColor: Colors.white24, color: Colors.white, minHeight: 8),
                ),
              ),
              const SizedBox(width: 15),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(30)),
          child: const Text(
            "ما هي لغة البرمجة المستخدمة لبناء تطبيقات الويب التفاعلية؟",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        _buildQuizOption("Python"),
        _buildQuizOption("JavaScript"),
        _buildQuizOption("C++"),
        const Spacer(),
      ],
    );
  }

  Widget _buildQuizOption(String text) {
    return GestureDetector(
      onTap: () => _checkAnswer(text),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white24)),
        child: Text(text, textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildResult() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(40)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 45,
                backgroundColor: _isCorrect ? const Color(0xFF4ADE80) : const Color(0xFFF87171),
                child: Icon(_isCorrect ? Icons.check : Icons.close, color: Colors.white, size: 50)
            ),
            const SizedBox(height: 25),
            Text(
                _isCorrect ? "ممتاز!" : "للأسف خطأ",
                style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)
            ),
            Text(
                _isCorrect ? "لقد حصلت على 1 من 1" : "حاول مرة أخرى في التحدي القادم",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 18)
            ),
            const SizedBox(height: 20),
            Text(
                _isCorrect ? "100%" : "0%",
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF6366F1),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("إنهاء", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}