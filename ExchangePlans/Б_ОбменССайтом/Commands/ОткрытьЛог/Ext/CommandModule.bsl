﻿
&НаСервере
Функция ПолучитьТекстовыйДокументЛогаСервер(УзелОбмена, ДатаЛога)
	
	МассивОбменов = Новый Массив();
	ТектовыйЛогФайл = Новый ТекстовыйДокумент;
	
	Если УзелОбмена = ПланыОбмена.Б_ОбменССайтом.ЭтотУзел() Тогда
		Сообщить("Выбранный узел соответствует текущей информационной базе. Выберите другой узел или создайте новый.");
	Иначе
		
		КаталогЛога = УзелОбмена.КаталогЛога;
		
		Если КаталогЛога = "" тогда
			
			Сообщить("Для настройки не задан каталог хранения лога. Ищем лог в каталоге обмена.");
			
			КаталогЛога = УзелОбмена.КаталогВыгрузки;
			
			Если КаталогЛога = "" тогда
				Сообщить("Не удалось указать каталог выгрузки в качестве каталога хранения лога. Ведение лога невозможно.");
			КонецЕсли;
			
		КонецЕсли;
		
		Если НЕ ПустаяСтрока(КаталогЛога) Тогда
			
			СистемнаяИнформация = Новый СистемнаяИнформация;  
			ПлатформаWindows = СистемнаяИнформация.ТипПлатформы = ТипПлатформы.Windows_x86 ИЛИ СистемнаяИнформация.ТипПлатформы = ТипПлатформы.Windows_x86_64;
			
			ИмяФайла = КаталогЛога + "\reports\" + "Exchange_" + "(" + УзелОбмена.Наименование +  ")" +  СокрЛП(Формат(ДатаЛога, "ДФ=yyyy-MM-dd")) + ".txt";
			
			ЛогФайл = Новый Файл(ИмяФайла);
			
			Если ЛогФайл.Существует() тогда
				
				ЧтениеТекста= Новый ЧтениеТекста(ИмяФайла);
				
				ТекстЛога 	= ЧтениеТекста.Прочитать();

				ТектовыйЛогФайл.УстановитьТекст(ТекстЛога);
				
			Иначе
				Сообщить("не выбранную дату не найден лог файл.");
			КонецЕсли;
			
		Иначе
			Сообщить("Невозможно посмотреть лог. Не найден каталог лога.");
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат ТектовыйЛогФайл;
	
КонецФункции

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	Если ПараметрКоманды = Неопределено Тогда
		Возврат;
	КонецЕсли;                
	
	ДатаНапоминания = ТекущаяДата();
	Подсказка = "Введите дату, на которорую требуется отрыть лог.";
	ЧастьДаты = ЧастиДаты.ДатаВремя;
	
	Параметры = Новый Структура;
	Параметры.Вставить("ПараметрКоманды",ПараметрКоманды);
	
	Оповещение = Новый ОписаниеОповещения("ПослеВводаДаты",ЭтотОбъект, Параметры);     
	ПоказатьВводДаты(Оповещение, ДатаНапоминания, Подсказка, ЧастьДаты);
	
		
КонецПроцедуры

&НаКлиенте
Процедура ПослеВводаДаты(ДатаЛога, Параметры) Экспорт
	Если НЕ ДатаЛога = Неопределено Тогда  
		
		ТектовыйЛогФайл = ПолучитьТекстовыйДокументЛогаСервер(Параметры.ПараметрКоманды, ДатаЛога);	
		ТектовыйЛогФайл.Показать("Лог на: " + СокрЛП(Формат(ДатаЛога, "ДФ=yyyy-MM-dd")))

    КонецЕсли;
КонецПроцедуры
