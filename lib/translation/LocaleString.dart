import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'dealerhome': 'Dealer Home',
          'welcomedealername': 'Welcome Dealer Name',
          'IDNumber': 'IDNumber',
          'desc':
              'We are one of India most sustainable and fastest growing companies that embraces varied perspectives, bias to action and continuous innovation to create happiness for all its stakeholders',
          'apply': 'APPLY NEW DEALERSHIP'
        },
        'hi_IN': {
          'dealerhome': 'डीलर होम',
          'welcomedealername': 'स्वागत डीलर का नाम',
          'IDNumber': 'आईडी नंबर',
          'desc':
              'हम भारत की सबसे स्थायी और सबसे तेजी से बढ़ती कंपनियों में से एक हैं जो अपने सभी हितधारकों के लिए खुशी पैदा करने के लिए विभिन्न दृष्टिकोणों, कार्रवाई के लिए पूर्वाग्रह और निरंतर नवाचार को अपनाती है।',
          'apply': 'नई डीलरशिप लागू करें'
        }
      };
}
