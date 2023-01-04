import 'package:speech_assistance_app/models/cell/cell.dart';

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



List<Cell> cells = [
  const Cell(id:1,serial:1,name: 'أنا', image: 'images/i.png',type: 1),
  const Cell(id:2,serial:2,name: 'أريد', image: 'images/want.png',type: 2),
  const Cell(id:3,serial:3,name: 'ماذا', image: 'images/what.png',type: 3),
  const Cell(id:4,serial:4,name: 'لا', image: 'images/no.png',type: 4),
  const Cell(id:5,serial:5,name: 'أكثر', image: 'images/more.png',type: 4),
  const Cell(id:6,serial:6,name: 'أنت', image: 'images/you.png',type: 1),
  const Cell(id:7,serial:7,name: 'أذهب', image: 'images/go.png',type: 2),
  const Cell(id:8,serial:8,name: 'أفعل', image: 'images/do.png',type: 2),
  const Cell(id:9,serial:9,name: 'إلى', image: 'images/to.png',type: 5),
  const Cell(id:10,serial:10,name: 'إنتهى', image: 'images/finish.png',type: 4),
  const Cell(id:11,serial:11,name: 'نحن', image: 'images/we.png',type: 1),
  const Cell(id:12,serial:12,name: 'أأكل', image: 'images/eat.png',type: 2),
  const Cell(id:13,serial:13,name: 'ألعب', image: 'images/play.png',type: 2),
  const Cell(id:14,serial:14,name: 'على', image: 'images/on.png',type: 5),
  const Cell(id:15,serial:15,name: 'في', image: 'images/in.png',type: 5),
  const Cell(id:16,serial:16,name: 'أشرب', image: 'images/drink.png',type: 2),
  const Cell(id:17,serial:17,name: 'أرى', image: 'images/see.png',type: 2),
  const Cell(id:18,serial:18,name: 'أضع', image: 'images/put.png',type: 2),
  const Cell(id:19,serial:19,name: 'توقف', image: 'images/stop.png',type: 2),
  const Cell(id:20,serial:20,name: 'جيد', image: 'images/good.png',type: 6),
  const Cell(id:21,serial:21,name: 'أشخاص', image: 'images/people.png',type: 7),
  const Cell(id:22,serial:22,name: 'أشياء', image: 'images/things.png',type: 7),
  const Cell(id:23,serial:23,name: 'غذاء', image: 'images/food.png',type: 7),
  const Cell(id:24,serial:24,name: 'أماكن', image: 'images/places.png',type: 7),
  const Cell(id:25,serial:25,name: 'محادثة', image: 'images/chat.png',type: 7),
  const Cell(id:26,serial:26,name: 'أفعال', image: 'images/actions.png',type: 7),
  const Cell(id:27,serial:27,name: 'أسئلة', image: 'images/questions.png',type: 7),
  const Cell(id:28,serial:28,name: 'مشاعر', image: 'images/feelings.png',type: 7),
  const Cell(id:29,serial:29,name: 'أنشطة', image: 'images/activities.png',type: 8),
];
bool check(){
  cells.indexWhere((element) => element.serial==1);
  return true;
}

//[{id: 1, date: 23/12/2022, cells: أنا شخص يتعلم}, {id: 2, date: 23/12/2022, cells: بعدين اروح لطوكيو}, {id: 3, date: 24/12/2022, cells: أنا للعراق شي}, {id: 4, date: 25/12/2022, cells: تبلغ درجة الحرارة}, {id: 6, date: 25/12/2022, cells: اهلا وسهلا في العالم}, {id: 7, date: 29/12/2022, cells: هل يمكن أن تنجب}, {id: 8, date: 29/12/2022, cells: هل يمكن أن تساعد}, {id: 9, date: 29/12/2022, cells: هل يمكن أن تعني}, {id: 10, date: 29/12/2022, cells: هل يمكن أن نلعب}];