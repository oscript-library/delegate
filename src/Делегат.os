Перем Объект;
Перем ИмяМетода;
Перем Параметры;

// Создает объект Делегат для выполнения указанного метода объекта
//
// Параметры:
//   Объект - <Строка> - Программный объект, метод которого будет вызван
//   ИмяМетода - <Строка> - Имя метода (процедура/функция), который будет вызван
//   Параметры - <Произвольный> (необязательный) - Параметры для передачи в метод при его вызове
//		также параметры можно передать позже, через непосредственном вызове метода "Исполнить"
//
Процедура Конструктор(ПарамОбъект, ПарамИмяМетода, НовыеПараметры = Неопределено) Экспорт
	Объект = ПарамОбъект;
	ИмяМетода = ПарамИмяМетода;
	Параметры = НовыеПараметры;
КонецПроцедуры

// Выполняет Делегат, т.е. вызываем соответствующий метод объекта с заданными параметрами
//
// Параметры:
//   НовыеПараметры - <Произвольный> (необязательный) - параметры для передачи в вызываемый метод
//		Если Неопределено, тогда используются параметры, указанные при создании Делегата
//
//  Возвращаемое значение:
//   <Произвольный> - возвращаемое значение вызываемого метода, если тот является функцией,
//		или Неопределено, если метод является процедурой
//
Функция Исполнить(НовыеПараметры = Неопределено) Экспорт

	ПараметрыВыполнения = Новый Массив;
	Если НовыеПараметры <> Неопределено Тогда
		ПараметрыВыполнения.Добавить(НовыеПараметры);		
	Иначе
		ПараметрыВыполнения.Добавить(Параметры);		
	КонецЕсли;

	Рефлектор = Новый Рефлектор;
	
// Сообщить("Делегат.Исполнить " + ИмяМетода);
// Сообщить("Делегат.Исполнить Кол-во ПараметрыВыполнения " + ПараметрыВыполнения.Количество());
	Результат = Рефлектор.ВызватьМетод(Объект, ИмяМетода, ПараметрыВыполнения);

	Возврат Результат;

КонецФункции

Функция ИмяМетода() Экспорт
	Возврат ИмяМетода;
КонецФункции // ИмяМетода()

Функция Параметры() Экспорт
	Возврат Параметры;	
КонецФункции // Параметры()

Процедура УстановитьПараметры(НовыеПараметры) Экспорт
	Параметры = НовыеПараметры;
КонецПроцедуры