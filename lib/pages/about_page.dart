import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "EVENTO stands as a groundbreaking event management platform meticulously crafted to revolutionize"
                  " the way events are planned and organized. Offering a comprehensive suite of features, EVENTO serves as a centralized "
                  "hub that seamlessly integrates vendors specializing in every aspect of event planning, from decorations to catering and event"
                  "management services. Users are greeted with an intuitive interface that empowers them to explore an extensive array of offerings, "
                  "each accompanied by detailed information and captivating visuals. Through direct communication channels embedded within the platform, "
                  "users can effortlessly connect with vendors, discuss their requirements, and negotiate terms, fostering seamless collaboration and"
                  " efficient decision-making. \n\n"
                  "Transparency lies at the heart of EVENTO, with vendor profiles showcasing their credentials, past work, and user reviews, instilling "
                  "confidence and trust in users. The platform's versatility extends beyond traditional event management, offering users the flexibility to "
                  "plan a diverse range of events, from corporate gatherings and weddings to community festivals and intimate celebrations. EVENTO's "
                  "commitment to user satisfaction is further exemplified through personalized recommendations, catering to individual preferences and "
                  "event requirements. \n\n"
                  "Looking towards the future, EVENTO continues to innovate, with plans to introduce augmented reality features for immersive event "
                  "visualization, social media integration for enhanced event promotion, and advanced analytics tools for data-driven decision-making. "
                  "By embracing emerging technologies and evolving user needs, EVENTO remains at the forefront of the event management industry, "
                  "empowering users to create unforgettable experiences with ease and efficiency.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  // textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
