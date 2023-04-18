// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
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
      image: 'assets/images/i.png',
      type: 'cell'),
  const Cell(
      id: 2,
      serial: 2,
      name: 'أريد',
      category: 'verb',
      image: 'assets/images/want.png',
      type: 'cell'),
  const Cell(
      id: 3,
      serial: 3,
      name: 'ماذا',
      category: 'question_mark',
      image: 'assets/images/what.png',
      type: 'cell'),
  const Cell(
      id: 4,
      serial: 4,
      name: 'لا',
      category: 'word',
      image: 'assets/images/no.png',
      type: 'cell'),
  const Cell(
      id: 5,
      serial: 5,
      name: 'أكثر',
      category: 'word',
      image: 'assets/images/more.png',
      type: 'cell'),
  const Cell(
      id: 6,
      serial: 6,
      name: 'أنت',
      category: 'pronoun',
      image: 'assets/images/you.png',
      type: 'cell'),
  const Cell(
      id: 7,
      serial: 7,
      name: 'أذهب',
      category: 'verb',
      image: 'assets/images/go.png',
      type: 'cell'),
  const Cell(
      id: 8,
      serial: 8,
      name: 'أفعل',
      category: 'verb',
      image: 'assets/images/do.png',
      type: 'cell'),
  const Cell(
      id: 9,
      serial: 9,
      name: 'إلى',
      category: 'preposition',
      image: 'assets/images/to.png',
      type: 'cell'),
  const Cell(
      id: 10,
      serial: 10,
      name: 'إنتهى',
      category: 'word',
      image: 'assets/images/finish.png',
      type: 'cell'),
  const Cell(
      id: 11,
      serial: 11,
      name: 'نحن',
      category: 'pronoun',
      image: 'assets/images/we.png',
      type: 'cell'),
  const Cell(
      id: 12,
      serial: 12,
      name: 'أأكل',
      category: 'verb',
      image: 'assets/images/eat.png',
      type: 'cell'),
  const Cell(
      id: 13,
      serial: 13,
      name: 'ألعب',
      category: 'verb',
      image: 'assets/images/play.png',
      type: 'cell'),
  const Cell(
      id: 14,
      serial: 14,
      name: 'على',
      category: 'preposition',
      image: 'assets/images/on.png',
      type: 'cell'),
  const Cell(
      id: 15,
      serial: 15,
      name: 'في',
      category: 'preposition',
      image: 'assets/images/in.png',
      type: 'cell'),
  const Cell(
      id: 16,
      serial: 16,
      name: 'أشرب',
      category: 'verb',
      image: 'assets/images/drink.png',
      type: 'cell'),
  const Cell(
      id: 17,
      serial: 17,
      name: 'أرى',
      category: 'verb',
      image: 'assets/images/see.png',
      type: 'cell'),
  const Cell(
      id: 18,
      serial: 18,
      name: 'أضع',
      category: 'verb',
      image: 'assets/images/put.png',
      type: 'cell'),
  const Cell(
      id: 19,
      serial: 19,
      name: 'توقف',
      category: 'word',
      image: 'assets/images/stop.png',
      type: 'cell'),
  const Cell(
      id: 20,
      serial: 20,
      name: 'جيد',
      category: 'adjective',
      image: 'assets/images/good.png',
      type: 'cell'),
  const Cell(
      id: 21,
      serial: 21,
      name: 'أشخاص',
      category: 'people',
      image: 'assets/images/people.png',
      type: 'folder'),
  const Cell(
      id: 22,
      serial: 22,
      name: 'أشياء',
      category: 'folder',
      image: 'assets/images/things.png',
      type: 'folder'),
  const Cell(
      id: 23,
      serial: 23,
      name: 'غذاء',
      category: 'folder',
      image: 'assets/images/food.png',
      type: 'folder'),
  const Cell(
      id: 24,
      serial: 24,
      name: 'أماكن',
      category: 'folder',
      image: 'assets/images/places.png',
      type: 'folder'),
  const Cell(
      id: 25,
      serial: 25,
      name: 'محادثة',
      category: 'folder',
      image: 'assets/images/chat.png',
      type: 'folder'),
  const Cell(
      id: 26,
      serial: 26,
      name: 'أفعال',
      category: 'folder',
      image: 'assets/images/actions.png',
      type: 'folder'),
  const Cell(
      id: 27,
      serial: 27,
      name: 'أسئلة',
      category: 'folder',
      image: 'assets/images/questions.png',
      type: 'folder'),
  const Cell(
      id: 28,
      serial: 28,
      name: 'مشاعر',
      category: 'folder',
      image: 'assets/images/feelings.png',
      type: 'folder'),
  const Cell(
      id: 29,
      serial: 29,
      name: 'أنشطة',
      category: 'folder',
      image: 'assets/images/activities.png',
      type: 'folder'),
];

List<Cell> people = [
  const Cell(
      id: 30,
      serial: 30,
      name: 'عائلة',
      category: 'people',
      image: 'assets/images/family.png',
      type: 'cell'),
  const Cell(
      id: 31,
      serial: 31,
      name: 'أم',
      category: 'people',
      image: 'assets/images/mom.png',
      type: 'cell'),
  const Cell(
      id: 32,
      serial: 32,
      name: 'أب',
      category: 'people',
      image: 'assets/images/dad.png',
      type: 'cell'),
  const Cell(
      id: 33,
      serial: 33,
      name: 'أخ',
      category: 'people',
      image: 'assets/images/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 34,
      serial: 34,
      name: 'أخت',
      category: 'people',
      image: 'assets/images/brother-sister.png',
      type: 'cell'),
  const Cell(
      id: 35,
      serial: 35,
      name: 'صديق',
      category: 'people',
      image: 'assets/images/friend.png',
      type: 'cell'),
  const Cell(
      id: 36,
      serial: 36,
      name: 'معلم',
      category: 'people',
      image: 'assets/images/teacher.png',
      type: 'cell'),
  const Cell(
      id: 37,
      serial: 37,
      name: 'طبيب',
      category: 'people',
      image: 'assets/images/doctor.png',
      type: 'cell'),
  const Cell(
      id: 38,
      serial: 38,
      name: 'ممرض',
      category: 'people',
      image: 'assets/images/nurse.png',
      type: 'cell'),
];

Cell moreCell = const Cell(
    id: 0,
    serial: 0,
    name: 'المزيد',
    category: 'more',
    image: 'assets/images/more.png',
    type: 'more');

Map<String, List<Cell>> categories = {'people': people};
bool check() {
  cells.indexWhere((element) => element.serial == 1);
  return true;
}

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

enum DetailesScreenType { aboutUs, aboutApp }

const kCellsBox = 'cells_box';

const settingBox = 'settingBox';

const aboutUsImage = 'assets/images/resources/code_for_iraq.png';

const aboutUsTitle = 'Code For Iraq';

const aboutUsContent =
    'هي مبادرة إنسانية غير ربحية تهدف إلى خدمة المجتمع باستخدام التكنولوجيا , تعتبر ( Code For Iraq ) مبادرة تعليمية حقيقية ترعى المهتمين بتعلم تصميم و برمجة تطبيقات الهاتف الجوال و مواقع الأنترنت و برامج الحاسوب و الشبكات و الاتصالات و نظم تشغيل الحاسوب باستخدام التقنيات المفتوحة المصدر  ( Open Source ) , كما توفر لهم جميع الدروس التعليمية اللازمة و بشكل مجاني .';

const aboutAppContactTitle = 'برمجة وتصميم :';
const aboutAppContactDetaile = 'مرتضى ناصر';
const aboutAppContactEmail = 'mortadha114@gmail.com';
const aboutAppImage = 'assets/images/resources/aboutAppImage.png';
const aboutAppTitle = 'تطبيق مساعد النطق';
const aboutAppContent =
    'هو تطبيق مجاني انساني ضمن مبادرة ( Code For Iraq ) لمساعدة الاشخاص اللذين يعانون من صعوبة النطق , التطبيق يعتمد على احدث الاليات المتبعة في هذا المجال فهو يعتمد على آلية (AAC) المتبعة في المعاهد العالمية المختصة بمعالجة من يعانون صعوبة النطق . ';

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

List<Color> circleAvatarColors = [
  const Color(0xfffb938f),
  const Color(0xfff2cac8),
  const Color(0xfffdbb75),
   const Color(0xffd6d1f5),
  const Color(0xff8dc6bf),
];

