import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6366F1), Color(0xFFD946EF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مساري", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
              const Text("ابدأ رحلتك التعليمية اليوم", style: TextStyle(color: Colors.white70, fontSize: 18)),
              const SizedBox(height: 50),
              _buildTextField("البريد الإلكتروني", Icons.email_outlined),
              const SizedBox(height: 20),
              _buildTextField("كلمة المرور", Icons.lock_outline, isPassword: true),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6366F1),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("تسجيل الدخول", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              const Text("أو", style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 20),
              _buildSocialButton("تسجيل الدخول بواسطة Google", Icons.g_mobiledata),
              const SizedBox(height: 15),
              _buildSocialButton("تسجيل الدخول برقم الهاتف", Icons.phone_android),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("ليس لديك حساب؟ ", style: TextStyle(color: Colors.white70)),
                  TextButton(onPressed: () {}, child: const Text("سجل الآن", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildSocialButton(String label, IconData icon) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.1),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}