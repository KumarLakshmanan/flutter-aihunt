import 'package:aihunt/src/constant.dart';
import 'package:flutter/material.dart';

class FilterBy extends StatefulWidget {
  final Function(String) onChanged;
  const FilterBy({super.key, required this.onChanged});

  @override
  State<FilterBy> createState() => _FilterByState();
}

class _FilterByState extends State<FilterBy> {
  List selected = [];
  List categories = [
    {"_id": "3d", "alias": "Ai 3d Tools/Websites"},
    {"_id": "advertising", "alias": "Ai Advertising Tools/Websites"},
    {"_id": "aggregator", "alias": "Ai Aggregator Websites"},
    {"_id": "analytics", "alias": "Ai Analytics Tools/Websites"},
    {"_id": "api", "alias": "Ai Api Tools/Websites"},
    {"_id": "art", "alias": "Ai Art Tools/Websites"},
    {"_id": "articles", "alias": "Ai Articles Tools/Websites"},
    {"_id": "assistant", "alias": "Ai Assistant Tools/Websites"},
    {"_id": "audio editing", "alias": "Ai Audio editing Tools/Websites"},
    {"_id": "audio", "alias": "Ai Audio Tools/Websites"},
    {
      "_id": "augmented reality",
      "alias": "Ai Augmented reality Tools/Websites"
    },
    {"_id": "avatar", "alias": "Ai Avatar Tools/Websites"},
    {"_id": "bots", "alias": "Ai Bots Tools/Websites"},
    {"_id": "branding", "alias": "Ai Branding Tools/Websites"},
    {"_id": "business", "alias": "Ai Business Tools/Websites"},
    {"_id": "calendar", "alias": "Ai Calendar Tools/Websites"},
    {"_id": "chat", "alias": "Ai Chat Tools/Websites"},
    {"_id": "chatbot", "alias": "Ai Chatbot Tools/Websites"},
    {"_id": "chrome extensions", "alias": "Ai Chrome extensions Tools"},
    {"_id": "code assistant", "alias": "Ai Code assistant Tools"},
    {"_id": "conversation", "alias": "Ai Conversation Tools/Websites"},
    {"_id": "copywriting", "alias": "Ai Copywriting Tools/Websites"},
    {
      "_id": "customer communication",
      "alias": "Ai Customer communication Tools"
    },
    {"_id": "customer support", "alias": "Ai Customer support Tools"},
    {"_id": "data", "alias": "Ai Data Tools/Websites"},
    {"_id": "design assistant", "alias": "Ai Design assistant Tools/Websites"},
    {"_id": "developer tools", "alias": "Ai Developer tools Tools/Websites"},
    {"_id": "e-commerce", "alias": "Ai E-commerce Tools/Websites"},
    {"_id": "edit", "alias": "Ai Edit Tools/Websites"},
    {
      "_id": "education assistant",
      "alias": "Ai Education assistant Tools/Websites"
    },
    {"_id": "email assistant", "alias": "Ai Email assistant Tools/Websites"},
    {"_id": "email marketing", "alias": "Ai Email marketing Tools/Websites"},
    {"_id": "email", "alias": "Ai Email Tools/Websites"},
    {"_id": "enhance", "alias": "Ai Enhance Tools/Websites"},
    {"_id": "excel", "alias": "Ai Excel Tools"},
    {"_id": "experiments", "alias": "Ai Experiments Tools"},
    {"_id": "facebook messenger", "alias": "Ai Facebook messenger Tools"},
    {"_id": "fashion", "alias": "Ai Fashion Tools/Websites"},
    {"_id": "fintech", "alias": "Ai Fintech Tools/Websites"},
    {"_id": "free", "alias": "Ai Free Tools/Websites"},
    {"_id": "fun tools", "alias": "Ai Fun tools Tools/Websites"},
    {"_id": "gaming", "alias": "Ai Gaming Tools/Websites"},
    {"_id": "general writing", "alias": "Ai General writing Tools/Websites"},
    {"_id": "generative art", "alias": "Ai Generative art Tools/Websites"},
    {"_id": "generative code", "alias": "Ai Generative code Tools/Websites"},
    {"_id": "generative video", "alias": "Ai Generative video Tools/Websites"},
    {"_id": "generator", "alias": "Ai Generator Tools/Websites"},
    {"_id": "github", "alias": "Ai Github Tools"},
    {"_id": "growth hacking", "alias": "Ai Growth hacking Tools/Websites"},
    {"_id": "health & fitness", "alias": "Ai Health & fitness Tools/Websites"},
    {"_id": "human resources", "alias": "Ai Human resources Tools/Websites"},
    {"_id": "idea", "alias": "Ai Idea Tools/Websites"},
    {"_id": "image editing", "alias": "Ai Image editing Tools/Websites"},
    {"_id": "image generator", "alias": "Ai Image generator Tools/Websites"},
    {
      "_id": "image improvement",
      "alias": "Ai Image improvement Tools/Websites"
    },
    {"_id": "image", "alias": "Ai Image Tools/Websites"},
    {"_id": "inspiration", "alias": "Ai Inspiration Tools/Websites"},
    {
      "_id": "internet of things",
      "alias": "Ai Internet of things Tools/Websites"
    },
    {"_id": "learning", "alias": "Ai Learning Tools"},
    {"_id": "legal assistant", "alias": "Ai Legal assistant Tools/Websites"},
    {"_id": "life assistant", "alias": "Ai Life assistant Tools/Websites"},
    {"_id": "low-code/no-code", "alias": "Ai Low-code/no-code Tools/Websites"},
    {"_id": "mac", "alias": "Ai Mac Tools/Websites"},
    {"_id": "marketing", "alias": "Ai Marketing Tools/Websites"},
    {"_id": "meetings", "alias": "Ai Meetings Tools/Websites"},
    {"_id": "memory", "alias": "Ai Memory Tools/Websites"},
    {"_id": "messaging", "alias": "Ai Messaging Tools/Websites"},
    {"_id": "music", "alias": "Ai Music Tools/Websites"},
    {"_id": "news", "alias": "Ai News Websites"},
    {"_id": "newsletters", "alias": "Ai Newsletters Websites"},
    {"_id": "no-code", "alias": "Ai No-code Tools/Websites"},
    {"_id": "open source", "alias": "Ai Open source Tools/Websites"},
    {"_id": "paraphraser", "alias": "Ai Paraphraser Tools/Websites"},
    {
      "_id": "personalized videos",
      "alias": "Ai Personalized videos Tools/Websites"
    },
    {"_id": "photography", "alias": "Ai Photography Tools/Websites"},
    {"_id": "post", "alias": "Ai Post Tools/Websites"},
    {"_id": "productivity", "alias": "Ai Productivity Tools/Websites"},
    {"_id": "programming", "alias": "Ai Programming Tools/Websites"},
    {"_id": "prompt", "alias": "Ai Prompt Tools/Websites"},
    {"_id": "questions", "alias": "Ai Questions Tools/Websites"},
    {"_id": "research", "alias": "Ai Research Tools/Websites"},
    {"_id": "robots", "alias": "Ai Robots Tools/Websites"},
    {"_id": "saas", "alias": "Saas Ai Tools/Websites"},
    {"_id": "sales", "alias": "Ai Sales Tools/Websites"},
    {"_id": "search engine", "alias": "Ai Search engine Tools/Websites"},
    {"_id": "seo", "alias": "Ai Seo Tools/Websites"},
    {
      "_id": "social media assistant",
      "alias": "Ai Social media assistant Tools/Websites"
    },
    {"_id": "software engineering", "alias": "Ai Software engineering Tools"},
    {"_id": "speech", "alias": "Ai Speech Tools/Websites"},
    {"_id": "speech-to-text", "alias": "Ai Speech-to-text Tools/Websites"},
    {"_id": "spreadsheets", "alias": "Ai Spreadsheets Tools/Websites"},
    {"_id": "sql", "alias": "Ai Sql Tools/Websites"},
    {"_id": "startup", "alias": "Ai Startup Tools/Websites"},
    {"_id": "story teller", "alias": "Ai Story teller Tools/Websites"},
    {"_id": "summarizer", "alias": "Ai Summarizer Tools/Websites"},
    {"_id": "task management", "alias": "Ai Task management Tools/Websites"},
    {"_id": "text to speech", "alias": "Ai Text to speech Tools/Websites"},
    {"_id": "text", "alias": "Ai Text Tools/Websites"},
    {"_id": "tool", "alias": "Ai Tool Tools/Websites"},
    {"_id": "transcriber", "alias": "Ai Transcriber Tools/Websites"},
    {"_id": "transformation", "alias": "Ai Transformation Tools/Websites"},
    {"_id": "twitter", "alias": "Twitter Ai Tools"},
    {"_id": "user experience", "alias": "User experience Ai Tools"},
    {"_id": "venture capital", "alias": "Venture capital Ai Tools/Websites"},
    {"_id": "video editing", "alias": "Ai Video editing Tools/Websites"},
    {"_id": "video generator", "alias": "Ai Video generator Tools/Websites"},
    {"_id": "video", "alias": "Ai Video Tools/Websites"},
    {"_id": "virtual assistants", "alias": "Ai Virtual assistants Tools"},
    {"_id": "virtual reality", "alias": "Ai Virtual reality Tools"},
    {"_id": "voice", "alias": "Ai Voice Tools/Websites"},
    {"_id": "website", "alias": "Ai Website Tools"},
    {"_id": "writing", "alias": "Ai Writing Tools/Websites"},
    {"_id": "privacy", "alias": "Ai Privacy Tools/Websites"},
    {"_id": "resources", "alias": "Ai Resources Tools/Websites"},
    {"_id": "health ", "alias": "Ai Health  Tools/Websites"},
    {"_id": "hentai generator", "alias": "Ai Hentai Generator Tools/Websites"},
    {"_id": "presentations", "alias": "Ai Presentation Tools/Websites"},
    {
      "_id": "anime image generator",
      "alias": "Anime Image Generator Tools/Websites"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            child: const Text(
              "Filter By: ",
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < categories.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (selected.contains(categories[i]["_id"])) {
                        selected.remove(categories[i]["_id"]);
                      } else {
                        selected.add(categories[i]["_id"]);
                      }
                      widget.onChanged(selected.join(","));
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected.contains(categories[i]["_id"])
                            ? Constants.primaryColor
                            : const Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 2,
                        bottom: 2,
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        left: 4.0,
                        right: 4.0,
                      ),
                      child: Text(
                        categories[i]["_id"].toString().toUpperCase(),
                        style: TextStyle(
                          color: selected.contains(categories[i]["_id"])
                              ? Colors.white
                              : const Color(0xFF80858A),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
