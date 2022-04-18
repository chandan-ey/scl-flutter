import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'dealerhome': 'Dealer Home',
          'applyfordealership': 'APPLY FOR DEALERSHIP',
          'english': 'English',
          'hindi': 'Hindi',
          'onboard': 'Dealer Onboarding',
          'dealeronboarding': 'Dealer Onboarding'
        },
        'hi_IN': {
          'dealerhome': 'डीलर होम',
          'applyfordealership': 'डीलरशिप के लिए आवेदन करें',
          'english': 'अंग्रेज़ी',
          'hindi': 'हिन्दी',
          'onboard': 'डीलर ऑनबोर्डिंग'
        }
      };
}
