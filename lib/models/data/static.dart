import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/models/onboarding_model.dart';

//types
//1:ضمير/برتقالي/اطار مثلث
//2:فعل/وردي/اطار مثلث
//3:اداة استفهام/اسود/اطار عادي
//4:كلمة/ازرق/اطار عادي
//5:حرف جر/اخضر/اطار عادي
//6:صفة/ازرق/اطار مثلث
//7:فولدر/اسود/اطار فولدر
//8:فولدر/احمر/اطار فولدر
//9:اكثر/اسود/اطار عادي
//10:اشخاص/اصفر/اطار عادي

List<Cell> cells = [
  const Cell(
      id: 1,
      serial: 1,
      name: 'أنا',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/i.png',
      type: 'cell'),
  const Cell(
      id: 2,
      serial: 2,
      name: 'أريد',
      category: 'verb',
      image: 'assets/images/data/home/actions/want.png',
      type: 'cell'),
  const Cell(
      id: 3,
      serial: 3,
      name: 'ماذا',
      category: 'question_mark',
      image: 'assets/images/data/home/question/what.png',
      type: 'cell'),
  const Cell(
      id: 4,
      serial: 4,
      name: 'لا',
      category: 'word',
      image: 'assets/images/data/home/describe/no.png',
      type: 'cell'),
  const Cell(
      id: 5,
      serial: 5,
      name: 'أكثر',
      category: 'word',
      image: 'assets/images/data/home/describe/more.png',
      type: 'cell'),
  const Cell(
      id: 6,
      serial: 6,
      name: 'أنت',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/you.png',
      type: 'cell'),
  const Cell(
      id: 7,
      serial: 7,
      name: 'أذهب',
      category: 'verb',
      image: 'assets/images/data/home/actions/go.png',
      type: 'cell'),
  const Cell(
      id: 8,
      serial: 8,
      name: 'أفعل',
      category: 'verb',
      image: 'assets/images/data/home/actions/do.png',
      type: 'cell'),
  const Cell(
      id: 9,
      serial: 9,
      name: 'إلى',
      category: 'preposition',
      image: 'assets/images/data/home/where/to.png',
      type: 'cell'),
  const Cell(
      id: 10,
      serial: 10,
      name: 'إنتهى',
      category: 'word',
      image: 'assets/images/data/home/finish.png',
      type: 'cell'),
  const Cell(
      id: 11,
      serial: 11,
      name: 'نحن',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/we.png',
      type: 'cell'),
  const Cell(
      id: 12,
      serial: 12,
      name: 'أأكل',
      category: 'verb',
      image: 'assets/images/data/home/actions/eat.png',
      type: 'cell'),
  const Cell(
      id: 13,
      serial: 13,
      name: 'ألعب',
      category: 'verb',
      image: 'assets/images/data/home/actions/play.png',
      type: 'cell'),
  const Cell(
      id: 14,
      serial: 14,
      name: 'على',
      category: 'preposition',
      image: 'assets/images/data/home/where/on.png',
      type: 'cell'),
  const Cell(
      id: 15,
      serial: 15,
      name: 'في',
      category: 'preposition',
      image: 'assets/images/data/home/where/in.png',
      type: 'cell'),
  const Cell(
      id: 16,
      serial: 16,
      name: 'أشرب',
      category: 'verb',
      image: 'assets/images/data/home/actions/drink.png',
      type: 'cell'),
  const Cell(
      id: 17,
      serial: 17,
      name: 'أرى',
      category: 'verb',
      image: 'assets/images/data/home/actions/see.png',
      type: 'cell'),
  const Cell(
      id: 18,
      serial: 18,
      name: 'أضع',
      category: 'verb',
      image: 'assets/images/data/home/actions/put.png',
      type: 'cell'),
  const Cell(
      id: 19,
      serial: 19,
      name: 'توقف',
      category: 'word',
      image: 'assets/images/data/home/stop.png',
      type: 'cell'),
  const Cell(
      id: 20,
      serial: 20,
      name: 'جيد',
      category: 'adjective',
      image: 'assets/images/data/home/describe/good.png',
      type: 'cell'),
  const Cell(
      id: 21,
      serial: 21,
      name: 'أشخاص',
      category: 'folder',
      image: 'assets/images/data/home/categories/people.png',
      type: 'folder'),
  const Cell(
      id: 22,
      serial: 22,
      name: 'أشياء',
      category: 'folder',
      image: 'assets/images/data/home/categories/things.png',
      type: 'folder'),
  const Cell(
      id: 23,
      serial: 23,
      name: 'غذاء',
      category: 'folder',
      image: 'assets/images/data/home/categories/food.png',
      type: 'folder'),
  const Cell(
      id: 24,
      serial: 24,
      name: 'أماكن',
      category: 'folder',
      image: 'assets/images/data/home/categories/places.png',
      type: 'folder'),
  const Cell(
      id: 25,
      serial: 25,
      name: 'محادثة',
      category: 'folder',
      image: 'assets/images/data/home/categories/chat.png',
      type: 'folder'),
  const Cell(
      id: 26,
      serial: 26,
      name: 'أفعال',
      category: 'folder',
      image: 'assets/images/data/home/categories/actions.png',
      type: 'folder'),
  const Cell(
      id: 27,
      serial: 27,
      name: 'أسئلة',
      category: 'folder',
      image: 'assets/images/data/home/categories/questions.png',
      type: 'folder'),
  const Cell(
      id: 28,
      serial: 28,
      name: 'مشاعر',
      category: 'folder',
      image: 'assets/images/data/home/categories/feelings.png',
      type: 'folder'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'أنشطة',
      category: 'folder',
      image: 'assets/images/data/home/categories/activities.png',
      type: 'folder'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هو',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/he.png',
      type: 'cell'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هي',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/she.png',
      type: 'cell'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هذا',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/this.png',
      type: 'cell'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هم',
      category: 'pronoun',
      image: 'assets/images/data/home/little_words/they.png',
      type: 'cell'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هنا',
      category: 'verb',
      image: 'assets/images/data/home/where/here.png',
      type: 'cell'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'هناك',
      category: 'verb',
      image: 'assets/images/data/home/where/there.png',
      type: 'cell'),
];

List<Cell> people = [
  const Cell(
      id: 30,
      serial: 30,
      name: 'عائلة',
      category: 'people',
      image: 'assets/images/data/people/family.png',
      type: 'cell'),
  const Cell(
      id: 31,
      serial: 31,
      name: 'أم',
      category: 'people',
      image: 'assets/images/data/people/mom.png',
      type: 'cell'),
  const Cell(
      id: 32,
      serial: 32,
      name: 'أب',
      category: 'people',
      image: 'assets/images/data/people/dad.png',
      type: 'cell'),
  const Cell(
      id: 33,
      serial: 33,
      name: 'أخ',
      category: 'people',
      image: 'assets/images/data/people/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 34,
      serial: 34,
      name: 'أخت',
      category: 'people',
      image: 'assets/images/data/people/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 35,
      serial: 35,
      name: 'صديق',
      category: 'people',
      image: 'assets/images/data/people/friend.png',
      type: 'cell'),
  const Cell(
      id: 36,
      serial: 36,
      name: 'معلم',
      category: 'people',
      image: 'assets/images/data/people/teacher.png',
      type: 'cell'),
  const Cell(
      id: 37,
      serial: 37,
      name: 'طبيب',
      category: 'people',
      image: 'assets/images/data/people/doctor.png',
      type: 'cell'),
  const Cell(
      id: 38,
      serial: 38,
      name: 'ممرض',
      category: 'people',
      image: 'assets/images/data/people/nurse.png',
      type: 'cell'),
];

Map<String, List<Cell>> categories = {'people': people};

const Set<String> cellType = {'cell', 'folder', 'more'};

const Set<String> cellCategories = {
  'pronoun',
  'verb',
  'question_mark',
  'word',
  'preposition',
  'adjective',
  'folder',
  'people',
  'more'
};

Cell moreCell = const Cell(
    id: 0,
    serial: 0,
    name: 'المزيد',
    category: 'more',
    image: 'assets/images/data/home/more.png',
    type: 'more');

List<OnBoardingModel> onBordingList = [
  OnBoardingModel(
      image: 'assets/images/onbording/onboarding1.png',
      title: 'شارك افكارك',
      content:
          'شارك افكارك مع من تحب بسهولة باستخدام \n تطبيق مساعد النطق لن تجد صعوبة \n بعد الان في التعبير عن افكارك  '),
  OnBoardingModel(
      image: 'assets/images/onbording/onboarding2.png',
      title: 'واصل التطور',
      content:
          'التطبيق يستخدم تقنية (ACC) وهي تقنية متطورة متبعة \n في تطوير مهارات التواصل مما سيساهم في تطوير \n المهارات العقلية وتقديم تجربة تواصل رائعة'),
  OnBoardingModel(
      image: 'assets/images/onbording/onboarding3.png',
      title: 'حقق أحلامك',
      content:
          'مع استمرار نمو قابليات التواصل لديك ستتمكن من التعبير \n عن احلامك وستكون قادراً على تحقيقها بسهولة \n لنكمل الطريق معاً . ماذا تنتظر !!')
];
