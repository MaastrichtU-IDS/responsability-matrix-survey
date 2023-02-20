import 'package:flutter/animation.dart';
import '../repositories/questions_repository.dart';

const scopeExp = <Scope, String>{
  Scope.actors: 'Who is part of the project?',
  Scope.objects: 'What objects do the actors create/use?',
  Scope.process: 'How is it done?',
  Scope.impact: 'What impacts do the objects create?',
};

const scopeColors = <Scope, Color>{
  Scope.actors: Color.fromRGBO(230, 184, 175, 1),
  Scope.objects: Color.fromRGBO(244, 204, 204, 1),
  Scope.process: Color.fromRGBO(234, 153, 153, 1),
  Scope.impact: Color.fromRGBO(221, 126, 107, 1),
};

const componentExp = <Component, String>{
  Component.transparancy: '(Project -> itself)',
  Component.accountability: '(Project -> organisation)',
  Component.privacy:
      '(Project -> Human autonomy defined as the ability of humans to make their own decisions)',
  Component.societalValues: '(Project-> society)',
};

const componentColors = <Component, Color>{
  Component.transparancy: Color.fromRGBO(164, 194, 244, 1),
  Component.accountability: Color.fromRGBO(201, 218, 248, 1),
  Component.privacy: Color.fromRGBO(207, 226, 243, 1),
  Component.societalValues: Color.fromRGBO(159, 197, 232, 1),
};

const matrixExp = <Scope, Map<Component, String>>{
  Scope.actors: {
    Component.transparancy:
        'Identifies the roles, the contributions, and the interests of the involved actors (i.e. principal investigator, developers, end users, organisations).',
    Component.accountability:
        'Defines the accountability frameworks (i.e contracts and agreements) used to assess or prescribe the responsibilities of each actor in relation to the project and its outcomes.',
    Component.privacy:
        'Defines the agreements between the different actors of the project. For example, for human data subjects, is there an  informed consent agreement? For human data processors or controllers what confidentiality agreements have been signed in the project (i.e. NDA forms).',
    Component.societalValues:
        'Identifies the operative social values and norms of the actors, and how are they addressed and/or protected? I.e elicit values of the work, identify the social context that applies to the work.',
  },
  Scope.objects: {
    Component.transparancy:
        'Describes the detailed provenance of the objects (i.e metadata, license, quality measures, bias in data) are used and/or generated in the project',
    Component.accountability:
        'Identifies the quality (e.g. being bias-free,  anomalous or interoperable), availability and terms of use of the objects.',
    Component.privacy:
        'Identifies sensitive and/or confidential data (i.e. if there is some data or knowledge that should not be used or disclosed in any way). ',
    Component.societalValues:
        'Explicits social values and norms apply to  the  objects. I.e.Avoiding specific  biases that may arise from  the produced algorithms',
  },
  Scope.process: {
    Component.transparancy:
        'Describes the  processes (i.e. methodology, interaction protocols, pre-registering or business processes)  employed in the project.',
    Component.accountability:
        'Defines the processes that are in place  for monitoring and ensuring an accurate, ethical and lawful functioning of the project (i.e ethical approval).',
    Component.privacy:
        'Describes the processes of the project that ensure data privacy and confidentiality (i.e  What process is followed to update or delete records on the request of data subjects? Which security protocols or privacy-preserving methods are employed?).',
    Component.societalValues:
        'Identifies the processes that are in place to address societal values. For example,  how are possible biases addressed?',
  },
  Scope.impact: {
    Component.transparancy:
        'Identifies and describes  the short, and long term impacts (both negative and positive) of the project (i.e. key exploitable results, recognisable possible negative and positive downstream impacts).',
    Component.accountability:
        'Identifies the procedures for dealing with the ramifications of the outcomes (i.e intellectual property management or responsibilities of all actors in relation to negative outcomes).',
    Component.privacy:
        'Identifies how the project outcomes (intended or unintended) affect the privacy and confidentiality of the data beyond the project lifecycle and which measures are taken to ensure this. (i.e. How outcomes and supporting data will be shared with third parties while preserving privacy of data subjects?)',
    Component.societalValues:
        'Identifies how outcomes affect or interact with  the identified social values and norms (I.e. Who could stand to benefit and who would lose from the outcomes of the work: Are there any mitigation strategies/laws/rules/communications in place to ensure that the outcomes are responsibly used and exploited  for the benefit of  society).',
  }
};
