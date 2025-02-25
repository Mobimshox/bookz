import 'package:flutter/material.dart';
import '../models/color_set.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final Map<String, String> autoResponses = {
    "salom": "Salom! Sizga qanday yordam bera olaman?",
    "assalomu alaykum": "Va alaykum assalom! Sizga qanday yordam bera olaman?",
    "hi": "Hi! How can I assist you?",
    "hello": "Hello! Need any help?",
    "hey": "Hey! What’s up?",
    "qalay": "Men yaxshiman, rahmat! Sizchi?",
    "qalaysan": "Men yaxshiman, rahmat! Sizchi?",
    "qandaysan": "Men yaxshiman, rahmat! Sizchi?",
    "qalesan": "Men yaxshiman, rahmat! Sizchi?",
    "yahshimisiz": "Men yaxshiman, rahmat! Sizchi?",
    "ishlaring yaxshimi": "Ha, rahmat! Sizniki-chi?",
    "nima gap": "Hammasi yaxshi, sizda qanday yangiliklar?",
    "qanday yordam bera olasan": "Savollaringizga javob bera olaman yoki ma'lumot topishga yordam bera olaman.",
    "nima qilyapsan": "Sizga yordam berishga tayyorman!",
    "sen kimsan": "Men Support Ai - virtual yordamchi!",
    "isming nima": "Mening ismim Support Ai, yana savollaringiz bormi?",
    "isming": "Mening ismim Support Ai, yana savollaringiz bormi?",
    "nechida tug'ilgansan": "Men raqamli olamda yaratilganman!",
    "qayerdansan": "Men raqamli dunyodanman, internet orqali sizga xizmat qilaman!",
    "nechta til bilasan": "Men bir nechta tillarni tushunaman, lekin hozir siz bilan o‘zbek tilida gaplashyapman!",
    "hazil ayt": "Albatta! Nega kompyuter hech qachon sovuq qotmaydi? Chunki uning ichida ko‘p fan bor! 😆",
    "sevimli ranging qanday": "Menimcha, ko‘k yoki qora rang chiroyli, chunki ular texnologik uslubga mos!",
    "sevimli taoming qanday": "Men raqamli dunyoda yashayman, shuning uchun ovqat yemayman!",
    "men kimman": "Siz mening foydalanuvchim va siz haqingizda ko‘proq bilishni istayman!",
    "qaysi sport turini yoqtirasan": "Men sun'iy intellektman, lekin shaxmat qiziqarli deb o‘ylayman!",
    "futbol ko'rasanmi": "Men ma’lumotlar tahlil qilaman, lekin sport o‘yinlarini kuzatmayman!",
    "kino yoqtirasanmi": "Men filmlar haqida ma’lumot bera olaman, lekin ularni tomosha qila olmayman!",
    "qaysi tildan tushunasiz": "Men bir nechta tillarni tushunaman, lekin hozir siz bilan o‘zbek tilida gaplashyapman!",
    "do'sting bormi": "Mening do‘stlarim yo‘q, lekin siz bilan muloqot qilish yoqimli!",
    "menga maslahat ber": "Albatta! Sizga qanday maslahat kerak?",
    "mening ismim nima": "Sizning ismingiz haqida hozircha ma’lumotim yo‘q.",
    "qanday kun": "Bugungi kun juda ajoyib!",
    "ob-havo qanday": "Ob-havo haqida ma’lumot olish uchun internetga ulanishim kerak.",
    "bugun nima kun": "Bugungi sana haqida aytishim mumkin, faqat ilovangizdan foydalanib so‘rashingiz kerak.",
    "musicha nima": "Musicha — kichik va yoqimli qushcha!",
    "mushuk nima qiladi": "Mushuklar asosan uxlaydi va o‘ynaydi!",
    "bo‘ri qanday hayvon": "Bo‘ri — yirtqich va juda aqlli hayvon!",
    "qaysi fasl yoqadi": "Har bir faslning o‘z go‘zalligi bor!",
    "sevimli san'atching kim": "Men san’atkorlarni bilmayman, lekin sizga ularning haqida ma’lumot bera olaman!",
    "internet nima": "Internet — global axborot tarmog‘i!",
    "haqiqiy dost kim": "Haqiqiy do‘st — har doim yoningizda bo‘ladigan inson!",
    "yoqtirgan mashinang": "Men mashina hayday olmayman, lekin texnologiya haqida ma’lumot bera olaman!",
    "qiziqarli fakt ayt": "Qiziq fakt: Odam miyasining 80% qismi suvdan iborat!",
    "dunyodagi eng katta davlat": "Hozirgi eng katta davlat maydoni bo‘yicha Rossiya hisoblanadi!",
    "qayerga sayohat qilishni yoqtirasan": "Men sun’iy intellektman, shuning uchun sayohat qila olmayman!",
    "kitob o‘qiysanmi": "Men ma’lumotni saqlay olaman, lekin kitob o‘qimayman!",
    "menga kulgili narsa ayt": "Albatta! Nega kompyuter sovuq qotmaydi? Chunki uning ichida fan bor! 😆",
  };


  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text.toLowerCase();
      setState(() {
        _messages.add({"user": _controller.text});
        _messages.add({
          "ai": autoResponses[userMessage] ?? "Preparing a response..."
        });
      });
      _controller.clear();
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _clearMessages() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete all messages"),
        content: Text("Are you sure you want to delete all the text you typed?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _messages.clear();
              });
              Navigator.pop(context);
            },
            child: Text("Yes, delete", style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leadingWidth: 61,
        leading: Container(
          margin: EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
          padding: EdgeInsets.only(left: 6),
          height: 45,
          width: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.greyBack,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Support",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.greyBack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.delete, color: AppColors.redText,)
              ),
            ),
            onTap: _clearMessages,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message.containsKey("user");
                return Align(
                  alignment:
                  isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue : AppColors.greyBack,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isUser ? message["user"]! : message["ai"]!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write a message...",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: AppColors.greyBack,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 }
