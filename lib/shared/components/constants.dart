import 'package:speech_assistance_app/models/cell.dart';

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
  const Cell(id: 1, serial: 1, name: 'أنا', image: 'images/i.png', type: 1),
  const Cell(id: 2, serial: 2, name: 'أريد', image: 'images/want.png', type: 2),
  const Cell(id: 3, serial: 3, name: 'ماذا', image: 'images/what.png', type: 3),
  const Cell(id: 4, serial: 4, name: 'لا', image: 'images/no.png', type: 4),
  const Cell(id: 5, serial: 5, name: 'أكثر', image: 'images/more.png', type: 4),
  const Cell(id: 6, serial: 6, name: 'أنت', image: 'images/you.png', type: 1),
  const Cell(id: 7, serial: 7, name: 'أذهب', image: 'images/go.png', type: 2),
  const Cell(id: 8, serial: 8, name: 'أفعل', image: 'images/do.png', type: 2),
  const Cell(id: 9, serial: 9, name: 'إلى', image: 'images/to.png', type: 5),
  const Cell(
      id: 10, serial: 10, name: 'إنتهى', image: 'images/finish.png', type: 4),
  const Cell(id: 11, serial: 11, name: 'نحن', image: 'images/we.png', type: 1),
  const Cell(
      id: 12, serial: 12, name: 'أأكل', image: 'images/eat.png', type: 2),
  const Cell(
      id: 13, serial: 13, name: 'ألعب', image: 'images/play.png', type: 2),
  const Cell(id: 14, serial: 14, name: 'على', image: 'images/on.png', type: 5),
  const Cell(id: 15, serial: 15, name: 'في', image: 'images/in.png', type: 5),
  const Cell(
      id: 16, serial: 16, name: 'أشرب', image: 'images/drink.png', type: 2),
  const Cell(id: 17, serial: 17, name: 'أرى', image: 'images/see.png', type: 2),
  const Cell(id: 18, serial: 18, name: 'أضع', image: 'images/put.png', type: 2),
  const Cell(
      id: 19, serial: 19, name: 'توقف', image: 'images/stop.png', type: 2),
  const Cell(
      id: 20, serial: 20, name: 'جيد', image: 'images/good.png', type: 6),
  const Cell(
      id: 21, serial: 21, name: 'أشخاص', image: 'images/people.png', type: 7),
  const Cell(
      id: 22, serial: 22, name: 'أشياء', image: 'images/things.png', type: 7),
  const Cell(
      id: 23, serial: 23, name: 'غذاء', image: 'images/food.png', type: 7),
  const Cell(
      id: 24, serial: 24, name: 'أماكن', image: 'images/places.png', type: 7),
  const Cell(
      id: 25, serial: 25, name: 'محادثة', image: 'images/chat.png', type: 7),
  const Cell(
      id: 26, serial: 26, name: 'أفعال', image: 'images/actions.png', type: 7),
  const Cell(
      id: 27,
      serial: 27,
      name: 'أسئلة',
      image: 'images/questions.png',
      type: 7),
  const Cell(
      id: 28, serial: 28, name: 'مشاعر', image: 'images/feelings.png', type: 7),
  const Cell(
      id: 29,
      serial: 29,
      name: 'أنشطة',
      image: 'images/activities.png',
      type: 8),
];

List<Cell> people = [
  const Cell(
      id: 30, serial: 30, name: 'عائلة', image: 'images/family.png', type: 10),
  const Cell(id: 31, serial: 31, name: 'أم', image: 'images/mom.png', type: 10),
  const Cell(id: 32, serial: 32, name: 'أب', image: 'images/dad.png', type: 10),
  const Cell(
      id: 33,
      serial: 33,
      name: 'أخ',
      image: 'images/brother-sister.png',
      type: 10),
  const Cell(
      id: 34,
      serial: 34,
      name: 'أخت',
      image: 'images/brother-sister.png',
      type: 10),
  const Cell(
      id: 35, serial: 35, name: 'صديق', image: 'images/friend.png', type: 10),
  const Cell(
      id: 36, serial: 36, name: 'معلم', image: 'images/teacher.png', type: 10),
  const Cell(
      id: 37, serial: 37, name: 'طبيب', image: 'images/doctor.png', type: 10),
  const Cell(
      id: 38, serial: 38, name: 'ممرض', image: 'images/nurse.png', type: 10),
];
bool check() {
  cells.indexWhere((element) => element.serial == 1);
  return true;
}

enum DetailesScreenType { aboutUs, aboutApp }

const kCellsBox = 'cells_box';

const settingBox = 'settingBox';

const aboutUsImage = 'images/resources/code_for_iraq.png';

const aboutUsTitle = 'Code For Iraq';

const aboutUsContent =
    'هي مبادرة إنسانية غير ربحية تهدف إلى خدمة المجتمع باستخدام التكنولوجيا , تعتبر ( Code For Iraq ) مبادرة تعليمية حقيقية ترعى المهتمين بتعلم تصميم و برمجة تطبيقات الهاتف الجوال و مواقع الأنترنت و برامج الحاسوب و الشبكات و الاتصالات و نظم تشغيل الحاسوب باستخدام التقنيات المفتوحة المصدر  ( Open Source ) , كما توفر لهم جميع الدروس التعليمية اللازمة و بشكل مجاني .';

const aboutAppContactTitle = 'برمجة وتصميم :';
const aboutAppContactDetaile = 'مرتضى ناصر';
const aboutAppContactEmail = 'mortadha114@gmail.com';
const aboutAppImage = 'images/resources/aboutAppImage.png';
const aboutAppTitle = 'تطبيق مساعد النطق';
const aboutAppContent =
    'هو تطبيق مجاني انساني ضمن مبادرة ( Code For Iraq ) لمساعدة الاشخاص اللذين يعانون من صعوبة النطق , التطبيق يعتمد على احدث الاليات المتبعة في هذا المجال فهو يعتمد على آلية (AAC) المتبعة في المعاهد العالمية المختصة بمعالجة من يعانون صعوبة النطق . ';
