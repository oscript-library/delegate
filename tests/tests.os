#Использовать ".."
#Использовать asserts

Перем юТест;

Перем Журнал;

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	юТест = ЮнитТестирование;

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСОднимПараметром");
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСОднимПараметромВКонструкторе");
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСОднимПараметромЧерезМодуль");
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСОднимПараметромВКонструктореЧерезМодуль");
	
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСНесколькимиПараметрами");
	МассивТестов.Добавить("Тест_ДолженИсполнитьДелегатСКонструкторомСНесколькимиПараметрами");

	Возврат МассивТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	Журнал = "";
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСОднимПараметром() Экспорт

	ДелегатНовыйМир = Делегаты.Создать(ЭтотОбъект, "Поздороваться");
	
	ДелегатНовыйМир.Исполнить("Новый мир");
	
	Ожидаем.Что(Журнал).Равно("Новый мир!");
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСОднимПараметромВКонструкторе() Экспорт

	Делегат = Делегаты.Создать(ЭтотОбъект, "Поздороваться", "Мир");
	
	Делегаты.Исполнить(Делегат);
		
	Ожидаем.Что(Журнал).Равно("Мир!");
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСОднимПараметромЧерезМодуль() Экспорт

	ДелегатНовыйМир = Делегаты.Создать(ЭтотОбъект, "Поздороваться");
	
	Делегаты.Исполнить(ДелегатНовыйМир, "Новый мир");
	
	Ожидаем.Что(Журнал).Равно("Новый мир!");
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСНесколькимиПараметрами() Экспорт

	Делегат = Делегаты.Создать(ЭтотОбъект, "Поздороваться", "Мир");
	
	Делегат.Исполнить();
		
	Ожидаем.Что(Журнал).Равно("Мир!");
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСОднимПараметромВКонструктореЧерезМодуль() Экспорт
	
	Массив = Делегаты.МассивПараметров(1, "Два", "Десять");

	Делегат = Делегаты.Создать(ЭтотОбъект, "МетодСТремиПараметрами", Массив);

	Делегат.Исполнить();
	
	Ожидаем.Что(Журнал).Равно("1, Два, Десять!");
КонецПроцедуры

Процедура Тест_ДолженИсполнитьДелегатСКонструкторомСНесколькимиПараметрами() Экспорт
	
	Делегат = Делегаты.Создать(ЭтотОбъект, "МетодСТремиПараметрами");
	
	Массив = Делегаты.МассивПараметров(1, "Два", "Десять");

	Делегат.Исполнить(Массив);
	
	Ожидаем.Что(Журнал).Равно("1, Два, Десять!");
КонецПроцедуры
	
Процедура Поздороваться(Имя = Неопределено) Экспорт
	Журнал  = СтрШаблон("%1%2!", Журнал, Имя);
КонецПроцедуры
	
Процедура МетодСТремиПараметрами(Парам1, Парам2, Парам3) Экспорт
	Журнал  = СтрШаблон("%1%2, %3, %4!", Журнал, Парам1, Парам2, Парам3);
КонецПроцедуры