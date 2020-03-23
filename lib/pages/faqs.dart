import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => FaqsItem(
          data[index],
        ),
      ),
    );
  }
}

class Faqs {
  final String title;
  final List<Faqs> 
      children;
  Faqs(this.title, [this.children = const <Faqs>[]]);
}

final List<Faqs> data = <Faqs>[
  // Faqs(
  //   'Chapter Agay',
  //   <Faqs>[
  //     Faqs(
  //       'Section Agay0',
  //       <Faqs>[
  //         Faqs('Item agay.1'),
  //         Faqs('Item agay.2'),
  //         Faqs('Item agay.3'),
  //       ],
  //     ),
  //     Faqs('Section Ag1'),
  //     Faqs('Section Ag2'),
  //   ],
  // ),
  Faqs(
    'What is a corona virus?',
    <Faqs>[
      Faqs('Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19.'),
    ]
  ),
  Faqs(
    'What is COVID-19?',
    <Faqs>[
      Faqs('COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019.'),
    ]
  ),
  Faqs(
    'What are the symptoms of COVID-19?',
    <Faqs>[
      Faqs('The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and dont feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.'),
    ]
  ),
  Faqs(
    'How does COVID-19 spread?',
    <Faqs>[
      Faqs('People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick. WHO is assessing ongoing research on the ways COVID-19 is spread and will continue to share updated findings.'),
    ]
  ),
  Faqs(
    'Can the virus that causes COVID-19 be transmitted through the air?',
    <Faqs>[
      Faqs('Studies to date suggest that the virus that causes COVID-19 is mainly transmitted through contact with respiratory droplets rather than through the air. See previous answer on “How does COVID-19 spread?”'),
    ]
  ),
  Faqs(
    'Can CoVID-19 be caught from a person who has no symptoms?',
    <Faqs>[
      Faqs('The main way the disease spreads is through respiratory droplets expelled by someone who is coughing. The risk of catching COVID-19 from someone with no symptoms at all is very low. However, many people with COVID-19 experience only mild symptoms. This is particularly true at the early stages of the disease. It is therefore possible to catch COVID-19 from someone who has, for example, just a mild cough and does not feel ill.  WHO is assessing ongoing research on the period of transmission of COVID-19 and will continue to share updated findings.'),
    ]
  ),
  Faqs(
    'What can I do to protect myself and prevent the spread of disease?',
    <Faqs>[
      Faqs('Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Many countries around the world have seen cases of COVID-19 and several have seen outbreaks. Authorities in China and some other countries have succeeded in slowing or stopping their outbreaks. However, the situation is unpredictable so check regularly for the latest news. You can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:\nRegularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. Why? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.\nMaintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing. Why? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease.\nAvoid touching eyes, nose and mouth. Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.\nMake sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately. Why? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19.\nStay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.\nWhy? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.\nKeep up to date on the latest COVID-19 hotspots (cities or local areas where COVID-19 is spreading widely). If possible, avoid traveling to places  – especially if you are an older person or have diabetes, heart or lung disease. Why? You have a higher chance of catching COVID-19 in one of these areas.'),
    ]
  ),
  // Faqs(
  //   'Chapter C',
  //   <Faqs>[
  //     Faqs('Section C0'),
  //     Faqs('Section C1'),
  //     Faqs(
  //       'Section C2',
  //       <Faqs>[
  //         Faqs('Item C2.0'),
  //         Faqs('Item C2.1'),
  //         Faqs('Item C2.2'),
  //         Faqs('Item C2.3'),
  //       ]
  //     )
  //   ]
  // ),
];

class FaqsItem extends StatelessWidget {
  const FaqsItem(this.faqs);
  final Faqs faqs;

  Widget _buildTiles(Faqs root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Faqs>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTiles(faqs);
  }
}