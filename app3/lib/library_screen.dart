import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // الجزء العلوي (Header) للمكتبة
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF009688), Color(0xFF00BFA5)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text("المكتبة", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                // شريط البحث
                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "...ابحث عن دورة",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Color(0xFF6366F1), shape: BoxShape.circle),
                      child: const Icon(Icons.tune, color: Colors.white, size: 18),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),

          // التصنيفات (الكل، برمجة، تصميم...)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  _buildCategoryItem("الكل (48)", true),
                  _buildCategoryItem("برمجة (15)", false),
                  _buildCategoryItem("تصميم (12)", false),
                  _buildCategoryItem("لغات (21)", false),
                ],
              ),
            ),
          ),

          // قائمة الدورات (بيانات ثابتة)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCourseCard("أساسيات React", "محمد أحمد", "4.8", "1200", "8 ساعات", "24 درس"),
                _buildCourseCard("تصميم التطبيقات", "سارة علي", "4.9", "850", "12 ساعة", "30 درس"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: isSelected ? const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFFD946EF)]) : null,
        color: isSelected ? null : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [if (!isSelected) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Text(title, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCourseCard(String title, String teacher, String rate, String students, String duration, String lessons) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          // صورة الكورس (دامي)
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          // تفاصيل الكورس
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(teacher, style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(duration, style: const TextStyle(fontSize: 12)),
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(rate, style: const TextStyle(fontSize: 12)),
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFF6366F1).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                  child: Text(lessons, style: const TextStyle(color: Color(0xFF6366F1), fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}