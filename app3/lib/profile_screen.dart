import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الجزء العلوي الملون وصورة الملف الشخصي
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6366F1), Color(0xFFD946EF)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // استبدليها بصورة المستخدم
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "أحمد محمد",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "ahmed@example.com",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "عضو منذ 2024/1/1",
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  // كروت الإحصائيات (نقاط، شارة، دورة)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem("12", "دورة مكتملة"),
                      _buildStatItem("8", "شارة"),
                      _buildStatItem("2450", "نقطة"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // بطاقة المستوى
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.track_changes, color: Colors.white, size: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("المستوى 8", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("استمر في التقدم لرفع مستواك", style: TextStyle(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // قائمة الخيارات السفلية
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Column(
                  children: [
                    _buildMenuOption("تعديل الملف الشخصي", Icons.edit_outlined),
                    _buildMenuOption("الإشعارات", Icons.notifications_none),
                    _buildMenuOption("الخصوصية والأمان", Icons.security_outlined),
                    _buildMenuOption("الإعدادات", Icons.settings_outlined),
                    _buildMenuOption("المساعدة والدعم", Icons.help_outline),
                    _buildMenuOption("تسجيل الخروج", Icons.logout, isExit: true),
                  ],
                ),
              ),
            ),
            const Text("مساري - الإصدار 1.0.0", style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildMenuOption(String title, IconData icon, {bool isExit = false}) {
    return ListTile(
      leading: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
      title: Text(title, textAlign: TextAlign.right, style: TextStyle(color: isExit ? Colors.red : Colors.black87, fontWeight: FontWeight.w500)),
      trailing: Icon(icon, color: isExit ? Colors.red : Colors.deepPurpleAccent),
      onTap: () {},
    );
  }
}