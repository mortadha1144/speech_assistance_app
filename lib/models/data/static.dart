import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/models/onboarding_model.dart';
import 'package:speech_assistance_app/shared/components/image_asset.dart';

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
      name: 'أنا',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}i.png',
      type: 'cell'),
  const Cell(
      id: 2,
      name: 'أريد',
      category: 'actions',
      image: '${ImageAsset.homeActions}want.png',
      type: 'cell'),
  const Cell(
      id: 3,
      name: 'ماذا',
      category: 'question_mark',
      image: '${ImageAsset.homeQuestion}what.png',
      type: 'cell'),
  const Cell(
      id: 4,
      name: 'لا',
      category: 'describe',
      image: '${ImageAsset.homeDescribe}no.png',
      type: 'cell'),
  const Cell(
      id: 5,
      name: 'أكثر',
      category: 'describe',
      image: '${ImageAsset.homeDescribe}more.png',
      type: 'cell'),
  const Cell(
      id: 6,
      name: 'أنت',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}you.png',
      type: 'cell'),
  const Cell(
      id: 7,
      name: 'أذهب',
      category: 'actions',
      image: '${ImageAsset.homeActions}go.png',
      type: 'cell'),
  const Cell(
      id: 8,
      name: 'أفعل',
      category: 'actions',
      image: '${ImageAsset.homeActions}do.png',
      type: 'cell'),
  const Cell(
      id: 9,
      name: 'إلى',
      category: 'where',
      image: '${ImageAsset.homeWhere}to.png',
      type: 'cell'),
  const Cell(
      id: 10,
      name: 'إنتهى',
      category: 'describe',
      image: '${ImageAsset.homeDescribe}finish.png',
      type: 'cell'),
  const Cell(
      id: 11,
      name: 'نحن',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}we.png',
      type: 'cell'),
  const Cell(
      id: 12,
      name: 'أأكل',
      category: 'actions',
      image: '${ImageAsset.homeActions}eat.png',
      type: 'cell'),
  const Cell(
      id: 13,
      name: 'ألعب',
      category: 'actions',
      image: '${ImageAsset.homeActions}play.png',
      type: 'cell'),
  const Cell(
      id: 14,
      name: 'على',
      category: 'where',
      image: '${ImageAsset.homeWhere}on.png',
      type: 'cell'),
  const Cell(
      id: 15,
      name: 'في',
      category: 'where',
      image: '${ImageAsset.homeWhere}in.png',
      type: 'cell'),
  const Cell(
      id: 16,
      name: 'أشرب',
      category: 'actions',
      image: '${ImageAsset.homeActions}drink.png',
      type: 'cell'),
  const Cell(
      id: 17,
      name: 'أرى',
      category: 'actions',
      image: '${ImageAsset.homeActions}see.png',
      type: 'cell'),
  const Cell(
      id: 18,
      name: 'أضع',
      category: 'actions',
      image: '${ImageAsset.homeActions}put.png',
      type: 'cell'),
  const Cell(
      id: 19,
      name: 'توقف',
      category: 'actions',
      image: '${ImageAsset.homeActions}stop.png',
      type: 'cell'),
  const Cell(
      id: 20,
      name: 'جيد',
      category: 'describe',
      image: '${ImageAsset.homeDescribe}good.png',
      type: 'cell'),
  const Cell(
      id: 21,
      name: 'أشخاص',
      category: 'category',
      image: '${ImageAsset.homeCategories}people.png',
      type: 'category'),
  const Cell(
      id: 22,
      name: 'أشياء',
      category: 'category',
      image: '${ImageAsset.homeCategories}things.png',
      type: 'category'),
  const Cell(
      id: 23,
      name: 'غذاء',
      category: 'category',
      image: '${ImageAsset.homeCategories}food.png',
      type: 'category'),
  const Cell(
      id: 24,
      name: 'أماكن',
      category: 'category',
      image: '${ImageAsset.homeCategories}places.png',
      type: 'category'),
  const Cell(
      id: 25,
      name: 'محادثة',
      category: 'category',
      image: '${ImageAsset.homeCategories}chat.png',
      type: 'category'),
  const Cell(
      id: 26,
      name: 'أفعال',
      category: 'category',
      image: '${ImageAsset.homeCategories}actions.png',
      type: 'category'),
  const Cell(
      id: 27,
      name: 'أسئلة',
      category: 'category',
      image: '${ImageAsset.homeCategories}questions.png',
      type: 'category'),
  const Cell(
      id: 28,
      name: 'مشاعر',
      category: 'category',
      image: '${ImageAsset.homeCategories}feelings.png',
      type: 'category'),
  const Cell(
      id: 29,
      name: 'أنشطة',
      category: 'category',
      image: '${ImageAsset.homeCategories}activities.png',
      type: 'category'),
  const Cell(
      id: 30,
      name: 'هو',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}he.png',
      type: 'cell'),
  const Cell(
      id: 31,
      name: 'سوف',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}he.png',
      type: 'cell'),
  const Cell(
      id: 29,
      name: 'هي',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}she.png',
      type: 'cell'),
  const Cell(
      id: 29,
      name: 'هذا',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}this.png',
      type: 'cell'),
  const Cell(
      id: 29,
      name: 'هم',
      category: 'little_words',
      image: '${ImageAsset.homeLittleWords}they.png',
      type: 'cell'),
  const Cell(
      id: 29,
      name: 'هنا',
      category: 'where',
      image: '${ImageAsset.homeWhere}here.png',
      type: 'cell'),
  const Cell(
      id: 29,
      name: 'هناك',
      category: 'where',
      image: '${ImageAsset.homeWhere}there.png',
      type: 'cell'),
];

List<Cell> people = [
  const Cell(
      id: 30,
      name: 'عائلة',
      category: 'people',
      image: 'assets/images/data/people/family.png',
      type: 'cell'),
  const Cell(
      id: 31,
      name: 'أم',
      category: 'people',
      image: 'assets/images/data/people/mom.png',
      type: 'cell'),
  const Cell(
      id: 32,
      name: 'أب',
      category: 'people',
      image: 'assets/images/data/people/dad.png',
      type: 'cell'),
  const Cell(
      id: 33,
      name: 'أخ',
      category: 'people',
      image: 'assets/images/data/people/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 34,
      name: 'أخت',
      category: 'people',
      image: 'assets/images/data/people/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 35,
      name: 'صديق',
      category: 'people',
      image: 'assets/images/data/people/friend.png',
      type: 'cell'),
  const Cell(
      id: 36,
      name: 'معلم',
      category: 'people',
      image: 'assets/images/data/people/teacher.png',
      type: 'cell'),
  const Cell(
      id: 37,
      name: 'طبيب',
      category: 'people',
      image: 'assets/images/data/people/doctor.png',
      type: 'cell'),
  const Cell(
      id: 38,
      name: 'ممرض',
      category: 'people',
      image: 'assets/images/data/people/nurse.png',
      type: 'cell'),
];

Map<String, List<Cell>> categories = {'people': people};

const Set<String> cellType = {'cell', 'category', 'more'};

const Set<String> cellCategories = {
  'actions',
  'category',
  'describe',
  'little_words',
  'numbers',
  'question',
  'where',
  'people',
  'more',
};

Cell moreCell = const Cell(
    id: 0,
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
