# Делегаты

Библиотека предназначена для создания и выполнения делегатов/функторов.

Делегат представляет собой объект, который может ссылаться на метод другого объекта.

Например, можно выполнять `функции-коллбэки` или унифицированно выполнять методы у схожих объектов.

Также можно использовать для замены "некрасивых" и многословных объектов 1С - `ОписаниеОповещения`,
которые имеют мало смысла в мире OneScript.

## Использование

```bsl
// Подключение библиотеки
#Использовать Делегат

// Метод, вызываемый из делегата
Процедура Поздороваться(Имя) Экспорт
    Сообщить("Привет, " + Имя + "!");
КонецПроцедуры

Делегат = Делегаты.Создать(ЭтотОбъект, "Поздороваться", "Мир");

Делегаты.Исполнить(Делегат); // или Делегат.Исполнить();

ДелегатНовыйМир = Делегаты.Создать(ЭтотОбъект, "Поздороваться");

ДелегатНовыйМир.Исполнить("Новый мир"); // или Делегаты.Исполнить(ДелегатНовыйМир, "Новый мир");
```

