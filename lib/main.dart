import 'package:flutter/material.dart';

void main() {
  runApp(const HealthMateApp());
}

class HealthMateApp extends StatelessWidget {
  const HealthMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Sans',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFEF3B3B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/home_healthmate_icon.png',
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              '나의 건강을 스마트하게,',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'HealthMate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to HealthMate',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '헬스메이트는 처음이신가요?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: '이메일'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: '비밀번호'),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainScreen()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      child: Text('로그인', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '회원가입하기',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('이용약관')),
                      const Text('|'),
                      TextButton(onPressed: () {}, child: const Text('개인정보 처리방침')),
                      const Text('|'),
                      TextButton(onPressed: () {}, child: const Text('고객센터')),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const AiChatPage(),
    const HealthHomeScreen(),
    const MorePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'AI 챗봇',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: '더보기',
          ),
        ],
      ),
    );
  }
}

class HealthHomeScreen extends StatelessWidget {
  const HealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'HealthMate',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '박경민님, 안녕하세요!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 3.2,
                children: const [
                  _HealthCard(icon: Icons.monitor_weight, title: '체중', value: '78.0', unit: 'kg', sub: '2일 전', iconColor: Colors.blue),
                  _HealthCard(icon: Icons.water_drop, title: '혈당', value: '110', unit: 'mg/dL', sub: '2일 전', iconColor: Colors.red),
                  _HealthCard(icon: Icons.favorite, title: '혈압', value: '120/80', unit: 'mmHg', sub: '2일 전', iconColor: Colors.red),
                  _HealthCard(icon: Icons.medication, title: '복약', value: '-', unit: '', sub: '기록 없음', iconColor: Colors.green),
                  _HealthCard(icon: Icons.monitor_heart, title: '심박수', value: '72', unit: 'bpm', sub: '예시 데이터', iconColor: Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HealthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final String sub;
  final Color iconColor;

  const _HealthCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.sub,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20, color: iconColor),
                  const SizedBox(width: 6),
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.red[300],
                padding: const EdgeInsets.all(10),
                minimumSize: const Size(40, 40),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

// 건강 데이터 모델
class HealthData {
  final double weight;
  final int heartRate;
  final int bloodSugar;
  final String bloodPressure;

  const HealthData({
    required this.weight,
    required this.heartRate,
    required this.bloodSugar,
    required this.bloodPressure,
  });

  String evaluateHeartRate() {
    if (heartRate > 100) return "⚠️ 심박수가 너무 높습니다. 휴식이 필요합니다.";
    if (heartRate < 60) return "⚠️ 심박수가 낮습니다. 필요한 경우 의사와 상담하세요.";
    return "✅ 심박수는 정상 범위입니다.";
  }

  String evaluateBloodSugar() {
    if (bloodSugar > 126) return "⚠️ 고혈당 상태입니다. 식이 조절과 운동이 필요합니다.";
    if (bloodSugar < 70) return "⚠️ 저혈당 위험이 있습니다. 당분 섭취가 필요할 수 있습니다.";
    return "✅ 혈당은 정상입니다.";
  }

  String recommendDiet() {
    if (weight >= 80) return "🥗 체중이 높아 저칼로리 식단이 필요합니다.";
    if (bloodSugar > 110) return "🍠 혈당을 낮추기 위한 저당 식단을 권장합니다.";
    return "🍎 균형 잡힌 일반 식단을 유지하세요.";
  }

  String getOverallAdvice() {
    return "${evaluateHeartRate()}\n${evaluateBloodSugar()}\n${recommendDiet()}";
  }
}

class _AiChatPageState extends State<AiChatPage> {
  final List<Map<String, dynamic>> _messages = [
    {"text": "건강과 관련해 궁금한 것을 질문해 주세요.", "isUser": false},
  ];
  final TextEditingController _controller = TextEditingController();

  final HealthData _healthData = const HealthData(
    weight: 78.0,
    heartRate: 88,
    bloodSugar: 115,
    bloodPressure: '120/80',
  );

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    String reply;
    if (text.contains("심박수") || text.contains("심장")) {
      reply = _healthData.evaluateHeartRate();
    } else if (text.contains("혈당")) {
      reply = _healthData.evaluateBloodSugar();
    } else if (text.contains("체중") || text.contains("다이어트")) {
      reply = _healthData.recommendDiet();
    } else if (text.contains("전체") || text.contains("요약")) {
      reply = _healthData.getOverallAdvice();
    } else {
      reply = "해당 건강 정보에 대해 더 구체적으로 질문해 주세요.";
    }

    setState(() {
      _messages.insert(0, {"text": reply, "isUser": false});
      _messages.insert(0, {"text": text, "isUser": true});
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI 건강 상담")),
      body: Column(
        children: [
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Row(
                  mainAxisAlignment: msg['isUser']
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!msg['isUser'])
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 6),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          child: const Icon(Icons.health_and_safety,
                              color: Colors.white),
                        ),
                      ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: msg['isUser']
                              ? Colors.red[100]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: msg['isUser']
                                ? const Radius.circular(16)
                                : const Radius.circular(0),
                            bottomRight: msg['isUser']
                                ? const Radius.circular(0)
                                : const Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          msg['text'],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: _sendMessage,
                      decoration: const InputDecoration(
                        hintText: "건강 관련 질문을 입력하세요",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.red),
                    onPressed: () => _sendMessage(_controller.text),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}





class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // 상단을 완전히 흰 배경으로 고정
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '박경민 님',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _MenuIcon(title: '내정보', icon: Icons.person, color: Colors.blueAccent),
                      _MenuIcon(title: '가족 정보', icon: Icons.favorite, color: Colors.pinkAccent),
                      _MenuIcon(title: '고객센터', icon: Icons.headset_mic, color: Colors.orangeAccent),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey[300], thickness: 1),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _SectionTitle('건강 체크'),
            _GridMenu(items: const [
              '혈당 기록', '혈압 기록',
              '복약 기록', '체중 기록',
            ]),
            const SizedBox(height: 20),
            _SectionTitle('내 진료 차트'),
            _GridMenu(items: const [
              '건강검진 결과', '혈액검사 결과',
              '사진으로 기록', '내원 기록',
            ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _MenuIcon({required this.title, required this.icon, this.color = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _GridMenu extends StatelessWidget {
  final List<String> items;

  const _GridMenu({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: items.map((e) => _GridMenuItem(title: e)).toList(),
      ),
    );
  }
}

class _GridMenuItem extends StatelessWidget {
  final String title;

  const _GridMenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

