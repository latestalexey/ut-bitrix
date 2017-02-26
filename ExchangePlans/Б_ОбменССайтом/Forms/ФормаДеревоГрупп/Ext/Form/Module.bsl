﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если НЕ Параметры.ДеревоГрупп = НеОпределено Тогда
		ЗаполнитьДеревоРекурсивноКлиентСервер(ДеревоГрупп.ПолучитьЭлементы(), Параметры.ДеревоГрупп.ПолучитьЭлементы());
	КонецЕсли;
	
	УстановитьОтборНоменклатурыСервер();
	
	///////////////////////
	ВыгрузитьГруппыВТаблицуРекурсивноПоДеревуГрупп(РеквизитФормыВЗначение("ДеревоГрупп").Строки);
	
КонецПроцедуры

&НаСервере
Процедура УстановитьОтборНоменклатурыСервер()
	
	Если Параметры.СписокОтбора.Количество() = 0
		ИЛИ Параметры.СписокОтбора.Количество() = 1
			И НЕ ЗначениеЗаполнено(Параметры.СписокОтбора[0].Значение) Тогда
		Возврат;
	КонецЕсли;
	
	Запрос = Новый Запрос;
	
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Номенклатура.Ссылка
		|ИЗ
		|	Справочник.Номенклатура КАК Номенклатура
		|ГДЕ
		|	(Номенклатура.Ссылка В ИЕРАРХИИ (&Список)
		|				И НЕ &ОтборПоВидамНоменклатуры
		|			ИЛИ Номенклатура.ВидНоменклатуры В (&Список)
		|				И &ОтборПоВидамНоменклатуры)";
	
	Запрос.УстановитьПараметр("Список", Параметры.СписокОтбора);
	Запрос.УстановитьПараметр("ОтборПоВидамНоменклатуры", Параметры.ОтборПоВидамНоменклатуры);
	
	МассивНоменклатуры = Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Ссылка");
	
	НоменклатураОтбор.ЗагрузитьЗначения(МассивНоменклатуры);
	
	ЭлементОтбора = Номенклатура.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.ВСпискеПоИерархии;
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Ссылка");
	ЭлементОтбора.ПравоеЗначение = НоменклатураОтбор;
	ЭлементОтбора.Использование = Истина;
	
	Элементы.Номенклатура.Заголовок = 
		"Номенклатура (" + Параметры.СписокОтбора + ")";
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Элементы.Номенклатура.ВосстанавливатьТекущуюСтроку = Истина;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура КомандаДобавитьВДерево(Команда)
	
	ДобавитьНоменклатуруВДерево();
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьНоменклатуруВДерево()
	
	Если Элементы.ДеревоГрупп.ТекущиеДанные = НеОпределено Тогда
		Предупреждение("Строка дерева должна быть выбрана.");
		Возврат;
	КонецЕсли;
		
	Для Каждого ТекНоменклатура Из Элементы.Номенклатура.ВыделенныеСтроки Цикл
	
		Если НЕ ЗначениеЗаполнено(ТекНоменклатура) Тогда
			Продолжить;
		КонецЕсли;
		
		Если НоменклатураОтбор.Количество() > 0 Тогда
			Если НоменклатураОтбор.НайтиПоЗначению(ТекНоменклатура) = НеОпределено Тогда
				Предупреждение("Номенклатура """ + ТекНоменклатура + """ не соответствует отбору.");
				Возврат;
			КонецЕсли;
		КонецЕсли;
		
		СписокНоменклатуры = Элементы.ДеревоГрупп.ТекущиеДанные.Номенклатура;
		
		Если НЕ СписокНоменклатуры.НайтиПоЗначению(ТекНоменклатура) = НеОпределено Тогда
			Продолжить;
		КонецЕсли;
		
		СписокНоменклатуры.Добавить(ТекНоменклатура);
		
		НовСтр = ЭлементыВСтрокахДерева.Добавить();
		НовСтр.Элемент 	= ТекНоменклатура;
		новСтр.Строка 	= Элементы.ДеревоГрупп.ТекущиеДанные.Группа;
		новСтр.КодСтроки= Элементы.ДеревоГрупп.ТекущиеДанные.ИдГруппы;
	КонецЦикла;
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗавершитьРедактирование(Команда)
	
	Если НЕ ПроверитьЗаполнениеГруппРекурсивно(ДеревоГрупп.ПолучитьЭлементы()) Тогда
		Возврат;
	КонецЕсли;
	
	ИдентификаторКаталога = ВладелецФормы.Элементы.ТаблицаКаталогов.ТекущиеДанные.ИдентификаторКаталога;
	
	Найдено = ВладелецФормы.ТаблицаКлассификаторовНоменклатуры.НайтиСтроки(Новый Структура("ИдентификаторКаталога", ИдентификаторКаталога));
	
	Если Найдено.Количество() = 0 Тогда
		
		СтрокаТаблицы = ВладелецФормы.ТаблицаКлассификаторовНоменклатуры.Добавить();
		СтрокаТаблицы.ИдентификаторКаталога = ИдентификаторКаталога;
		
	Иначе
		
		СтрокаТаблицы = Найдено[0];
		
	КонецЕсли;
	
	ЗаполнитьДерево(СтрокаТаблицы.ДеревоГрупп);
	
	ВладелецФормы.Модифицированность = Истина;
	
	Закрыть();
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаУдалитьИзДерева(Команда)
	
	ОчиститьНоменклатуруруВСтрокеДерева();

КонецПроцедуры

&НаКлиенте
Процедура ОчиститьНоменклатуруруВСтрокеДерева()
	
	ТекСтрока = Элементы.ДеревоГрупп.ТекущиеДанные;
	
	Если ТекСтрока = НеОпределено Тогда
		Возврат;
	КонецЕсли;
	
	ТекСтрока.Номенклатура.Очистить();
	
	ОчиститьНоменклатуруруВтзнСервер(ТекСтрока.ИдГруппы);
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаСохранитьДерево(Команда)
	
	ПоказатьВопрос(Новый ОписаниеОповещения("ПослеЗакрытияВопросаОСохраненииДерева", ЭтаФорма, Параметры), "Выгружать номенклатуру в пользовательских группах?", РежимДиалогаВопрос.ДаНет);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопросаОСохраненииДерева(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		СохранитьДерево(Истина);	
	Иначе
		СохранитьДерево();	
    КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура СохранитьДерево(ВыгружатьНоменклатуру = Ложь)

	Если ДеревоГрупп.ПолучитьЭлементы().Количество() = 0 Тогда
		
		ПоказатьОповещениеПользователя("Дерево групп не заполнено.");
		Возврат;
		
	КонецЕсли;
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	Диалог.Заголовок = "Укажите файл для сохранения";
	Диалог.МножественныйВыбор = Ложь;
	Диалог.Фильтр = "(*.xml)|*.xml";
	
	Если НЕ Диалог.Выбрать() Тогда
		Возврат;
	КонецЕсли;
		
	СтрокаXML = "";
	
	ПолучитьXMLСервер(СтрокаXML, ВыгружатьНоменклатуру);
	
	ФайлXML = Новый ТекстовыйДокумент;
	ФайлXML.УстановитьТекст(СтрокаXML);
	ФайлXML.Записать(Диалог.ПолноеИмяФайла, КодировкаТекста.UTF8);
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаОткрытьДерево(Команда)
	
	Если ДеревоГрупп.ПолучитьЭлементы().Количество() > 0 Тогда
		
		ПоказатьВопрос(Новый ОписаниеОповещения("ПослеЗакрытияВопросаОИмпортеДерева", ЭтаФорма, Параметры), "Дерево групп будет очищено и загружено из файла. Продолжить?", РежимДиалогаВопрос.ДаНет);

	Иначе
		ЗагрузитьДерево();  	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопросаОИмпортеДерева(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда      
		ЗагрузитьДерево();
		
    КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьДерево()
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Заголовок = "Выберите файл";
	Диалог.МножественныйВыбор = Ложь;
	Диалог.Фильтр = "(*.xml)|*.xml";
	Диалог.ПроверятьСуществованиеФайла = Истина;
	
	Если НЕ Диалог.Выбрать() Тогда
		Возврат;
	КонецЕсли;
	
	СтрокаXML = "";
	
	ТекстXML = Новый ТекстовыйДокумент;
	ТекстXML.Прочитать(Диалог.ПолноеИмяФайла, КодировкаТекста.UTF8);
	СтрокаXML = ТекстXML.ПолучитьТекст();
	
	РазобратьЗагрузитьXMLСервер();
	
КонецПроцедуры


//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаВывестиНоменклатуруВОтчет(Команда)
	
	ВременныйТабличныйДокумент = Новый ТабличныйДокумент;
	
	СформироватьОтчетПоНоменклатуре(ВременныйТабличныйДокумент);
	
	ВременныйТабличныйДокумент.Показать();
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаДобавитьСтрокуВКорневойУровень(Команда)
	
	ТекСтрока = ДеревоГрупп.ПолучитьЭлементы().Добавить();
	Элементы.ДеревоГрупп.ТекущаяСтрока = ТекСтрока.ПолучитьИдентификатор();
	Элементы.ДеревоГрупп.ТекущиеДанные.ИдГруппы = Строка(Новый УникальныйИдентификатор);
	Элементы.ДеревоГрупп.ТекущиеДанные.Номенклатура.ТипЗначения = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
	
КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КомандаСкопироватьСтруктуруНоменклатуры(Команда)
	
	ПоказатьВопрос(Новый ОписаниеОповещения("ПослеЗакрытияВопросаОКопированииСтруктурыНоменклатуры", ЭтаФорма, Параметры), "Структура групп справочника Номенклатура будет добавлена в дерево. Продолжить?", РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Нет);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопросаОКопированииСтруктурыНоменклатуры(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		ДобавитьСтруктуруГруппНоменклатурыСервер();
    КонецЕсли;

КонецПроцедуры


&НаСервере
Процедура ДобавитьСтруктуруГруппНоменклатурыСервер()

	Запрос = Новый Запрос;
	
	Запрос.Текст = 
		"ВЫБРАТЬ 
		|	Номенклатура.Ссылка КАК Ссылка
		|ИЗ
		|	Справочник.Номенклатура КАК Номенклатура
		|ГДЕ
		|	НЕ Номенклатура.ПометкаУдаления
		|ИТОГИ ПО
		|	Ссылка ТОЛЬКО ИЕРАРХИЯ";
	
	Результат = Запрос.Выполнить();
	
	Группы = Результат.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкамСИерархией);
	
	СкопироватьДеревоНоменклатурыВДеревоГруппРекурсивноСервер(НеОпределено, ДеревоГрупп.ПолучитьЭлементы(), Группы);

КонецПроцедуры

//////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ПоказатьКудаВходитВыбранныйЭлемент(Команда)
	
	ТекущиеДанные = Элементы.Номенклатура.ТекущиеДанные;
	Если ТекущиеДанные <> Неопределено Тогда
			
			СписокГруппВыбранногоТовара.Очистить();
			лТекстШапки = "";
			
			лТекстШапки = ?(ЭтоГруппаУЭлемента(ТекущиеДанные.Наименование), "Группа товаров содержится в следущих строках дерева: ", "Элемент товара содержится в следущих строках дерева: ");
			
			Для каждого ТекСтр из ЭлементыВСтрокахДерева Цикл
				
				Если ПроверкаПринадлежностиЭлементу(ТекущиеДанные.Наименование, ТекСтр.Элемент) или ТекущиеДанные.Наименование = ТекСтр.Элемент тогда
					СписокГруппВыбранногоТовара.Добавить(ТекСтр.Строка);
				КонецЕсли;
				
			КонецЦикла;
			
			Элементы.ШапкаОписания.Заголовок = лТекстШапки;
			
		КонецЕсли;
		
КонецПроцедуры

&НаСервере
Функция ПроверкаПринадлежностиЭлементу(Элемент1, Элемент2)
	
	Если Элемент1.ПринадлежитЭлементу(Элемент2) тогда	
		Возврат Истина;	
	КонецЕсли;

	Возврат Ложь;
	
КонецФункции

&НаСервере 
Функция ЭтоГруппаУЭлемента(Элемент)
	Возврат Элемент.ЭтоГруппа;	
КонецФункции


#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НоменклатураПриАктивизацииСтроки(Элемент)
	
	//ТекущиеДанные = Элементы.Номенклатура.ТекущиеДанные;
	//Если ТекущиеДанные <> Неопределено Тогда
	//	Если ТекущиеДанныеСсылка<> ТекущиеДанные.Наименование Тогда
	//		ТекущиеДанныеСсылка = ТекущиеДанные.Наименование;
	//		
			СписокГруппВыбранногоТовара.Очистить();
	//		лТекстШапки = "";
	//		
	//		лТекстШапки = ?(Элемент.ТекущиеДанные.Наименование.ЭтоГруппа, "Группа товаров содержится в следущих строках дерева: ", "Элемент товара содержится в следущих строках дерева: ");
	//		
	//		Для каждого ТекСтр из ЭлементыВСтрокахДерева Цикл
	//			
	//			Если ПроверкаПринадлежностиЭлементу(Элемент.ТекущиеДанные.Наименование, ТекСтр.Элемент) или Элемент.ТекущиеДанные.Наименование = ТекСтр.Элемент тогда
	//				СписокГруппВыбранногоТовара.Добавить(ТекСтр.Строка);
	//			КонецЕсли;
	//			
	//		КонецЦикла;
	//		
	//		Элементы.ШапкаОписания.Заголовок = лТекстШапки;
	//		
	//	КонецЕсли;
	//КонецЕсли;	
	
КонецПроцедуры

&НаКлиенте
Процедура ДеревоГруппПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	
	Если НоваяСтрока Тогда
		Элемент.ТекущиеДанные.ИдГруппы = Строка(Новый УникальныйИдентификатор);
		Элемент.ТекущиеДанные.Номенклатура.ТипЗначения = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
		Если Копирование Тогда
			ДеревоГруппПриКопированииСтрокиДерева();
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ПроцедурыИФункцииПоРаботеСXML

&НаСервере
Процедура ПолучитьXMLСервер(СтрокаXML, ВыгружатьНоменклатуру)

	ОбъектXML = Новый ЗаписьXML();
	ОбъектXML.УстановитьСтроку("UTF-8");
	ОбъектXML.ЗаписатьОбъявлениеXML();
	
	ВыгрузитьГруппыРекурсивноПоДеревуГрупп(ОбъектXML, РеквизитФормыВЗначение("ДеревоГрупп").Строки, ВыгружатьНоменклатуру);
	СтрокаXML = ОбъектXML.Закрыть();
КонецПроцедуры

&НаСервере
Процедура РазобратьЗагрузитьXMLСервер()

	ОбъектXML = Новый ЧтениеXML;
	
	Попытка
		ОбъектXML.УстановитьСтроку(СтрокаXML);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат;
	КонецПопытки;
	
	ДеревоГрупп.ПолучитьЭлементы().Очистить();
	
	СтрокиТекущегоУровня = ДеревоГрупп.ПолучитьЭлементы();
	ТекущаяСтрокаДерева = НеОпределено;
	ТекущееИмяЭлемента = "";
	
	Пока Истина Цикл
		
		ОчереднойУзелXMLПрочитан = Ложь;
		
		Попытка
			ОчереднойУзелXMLПрочитан = ОбъектXML.Прочитать();
		Исключение
			Сообщить(ОписаниеОшибки());
			Возврат;
		КонецПопытки;
		
		Если НЕ ОчереднойУзелXMLПрочитан Тогда
			Прервать;
		КонецЕсли;
		
		ТипУзла = ОбъектXML.ТипУзла;
		ИмяУзла = ОбъектXML.Имя;
		
		Если ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда
			
			ОбработатьНачалоЭлемента(ИмяУзла, ТекущаяСтрокаДерева, СтрокиТекущегоУровня);
			ТекущееИмяЭлемента = ИмяУзла;
			
		ИначеЕсли ТипУзла = ТипУзлаXML.КонецЭлемента Тогда
			
			ОбработатьКонецЭлемента(ИмяУзла, ТекущаяСтрокаДерева, СтрокиТекущегоУровня);
			
		ИначеЕсли ТипУзла = ТипУзлаXML.Текст Тогда
			
			ЗначениеЭлемента = СокрЛП(ОбъектXML.Значение);
			
			ОбработатьЗначениеЭлемента(ТекущееИмяЭлемента, ЗначениеЭлемента, ТекущаяСтрокаДерева);
			
		КонецЕсли;
		
	КонецЦикла;
	
	ОбъектXML.Закрыть();
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьГруппыРекурсивноПоДеревуГрупп(ОбъектXML, ДеревоГрупп, ВыгружатьНоменклатуру)
	
	НачалоЭлементаЗаписано = Ложь;
	Если ДеревоГрупп.Количество() > 0 Тогда
		ОбъектXML.ЗаписатьНачалоЭлемента("Группы");
		НачалоЭлементаЗаписано = Истина;
	КонецЕсли;

	Для Каждого СтрокаДерева Из ДеревоГрупп Цикл
		
		ОбъектXML.ЗаписатьНачалоЭлемента("Группа");
		
		ОбъектXML.ЗаписатьНачалоЭлемента("Ид");
		ОбъектXML.ЗаписатьТекст(СтрокаДерева.ИдГруппы);
		ОбъектXML.ЗаписатьКонецЭлемента();
		
		ОбъектXML.ЗаписатьНачалоЭлемента("Наименование");
		ОбъектXML.ЗаписатьТекст(Лев(СтрокаДерева.Группа, 250)); // По схеме
		ОбъектXML.ЗаписатьКонецЭлемента();
		
		Если СтрокаДерева.Номенклатура.Количество() > 0 И ВыгружатьНоменклатуру тогда
			
			ОбъектXML.ЗаписатьНачалоЭлемента("Номенклатура");
	
				Для Каждого ТекЭлемент из СтрокаДерева.Номенклатура Цикл
					ОбъектXML.ЗаписатьНачалоЭлемента("ЭлементНоменклатуры");
						ОбъектXML.ЗаписатьТекст(XMLСтрока(ТекЭлемент.Значение));	
					ОбъектXML.ЗаписатьКонецЭлемента();
				КонецЦикла;
				
			ОбъектXML.ЗаписатьКонецЭлемента();
			
		КонецЕсли;
		
		ВыгрузитьГруппыРекурсивноПоДеревуГрупп(ОбъектXML, СтрокаДерева.Строки, ВыгружатьНоменклатуру);
		
		ОбъектXML.ЗаписатьКонецЭлемента(); // Группа
		
	КонецЦикла;
	
	Если НачалоЭлементаЗаписано Тогда
		ОбъектXML.ЗаписатьКонецЭлемента(); // Группы
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область ПроцедурыИФункцииПоРаботеСДеревомГрупп

&НаКлиенте
Функция ПроверитьЗаполнениеГруппРекурсивно(ЭлементыДерева)

	Для Каждого ЭлементДерева Из ЭлементыДерева Цикл
		
		Если ПустаяСтрока(ЭлементДерева.Группа) Тогда
			
			Предупреждение("Наименование группы не заполнено!");
			Возврат Ложь;
			
		КонецЕсли;
		
		Если НЕ ПроверитьЗаполнениеГруппРекурсивно(ЭлементДерева.ПолучитьЭлементы()) Тогда
			Возврат Ложь;
		КонецЕсли;
		
	КонецЦикла;

	Возврат Истина;
	
КонецФункции

&НаКлиенте
Процедура ЗаполнитьДерево(ДеревоПриемник)

	ДеревоПриемник.ПолучитьЭлементы().Очистить();
	
	ЗаполнитьДеревоРекурсивноКлиентСервер(ДеревоПриемник.ПолучитьЭлементы(), ДеревоГрупп.ПолучитьЭлементы());

КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура ЗаполнитьДеревоРекурсивноКлиентСервер(ЭлементыДереваПриемника, ЭлементыДереваИсточника)

	Для Каждого СтрокаИсточника Из ЭлементыДереваИсточника Цикл
		
		НоваяСтрока = ЭлементыДереваПриемника.Добавить();
		
		ЗаполнитьЗначенияСвойств(НоваяСтрока, СтрокаИсточника);
		
		ЗаполнитьДеревоРекурсивноКлиентСервер(НоваяСтрока.ПолучитьЭлементы(), СтрокаИсточника.ПолучитьЭлементы());
		
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ВыгрузитьГруппыВТаблицуРекурсивноПоДеревуГрупп(ДеревоГрупп)

	Для Каждого СтрокаДерева Из ДеревоГрупп Цикл
		
		
		Для Каждого ТекТовар из СтрокаДерева.Номенклатура Цикл
			
			НовСтр = ЭлементыВСтрокахДерева.Добавить();
			НовСтр.Элемент 	= ТекТовар.Значение;
			новСтр.Строка 	= СтрокаДерева.Группа;
			новСтр.КодСтроки= СтрокаДерева.ИдГруппы;
	
		КонецЦикла;
		
		ВыгрузитьГруппыВТаблицуРекурсивноПоДеревуГрупп(СтрокаДерева.Строки);
		
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Процедура ДеревоГруппПриКопированииСтрокиДерева()
	
	СкопироватьСписокНоменклатурыВСтроке();
	
КонецПроцедуры

&НаСервере
Процедура ОбработатьНачалоЭлемента(ИмяУзла, ТекущаяСтрокаДерева, СтрокиТекущегоУровня)
	
	Если ИмяУзла = "Группы" Тогда
		
		Если НЕ ТекущаяСтрокаДерева = НеОпределено Тогда
			СтрокиТекущегоУровня = ТекущаяСтрокаДерева.ПолучитьЭлементы();
		КонецЕсли;
		
	ИначеЕсли ИмяУзла = "Группа" Тогда
		
		ТекущаяСтрокаДерева = СтрокиТекущегоУровня.Добавить();
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ОбработатьКонецЭлемента(ИмяУзла, ТекущаяСтрокаДерева, СтрокиТекущегоУровня)
	
	Если ИмяУзла = "Группы" Тогда
		
		ТекущаяСтрокаДерева = ТекущаяСтрокаДерева.ПолучитьРодителя();
		
		Если ТекущаяСтрокаДерева = НеОпределено Тогда
			СтрокиТекущегоУровня = ДеревоГрупп.ПолучитьЭлементы();
		Иначе
			Родитель = ТекущаяСтрокаДерева.ПолучитьРодителя();
			Если Родитель = НеОпределено Тогда
				СтрокиТекущегоУровня = ДеревоГрупп.ПолучитьЭлементы();
			Иначе
				СтрокиТекущегоУровня = Родитель.ПолучитьЭлементы();
			КонецЕсли;
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ОбработатьЗначениеЭлемента(ИмяУзла, ЗначениеЭлемента, ТекущаяСтрокаДерева)
	
	Если ИмяУзла = "Ид" Тогда
		
		ТекущаяСтрокаДерева.ИдГруппы = ЗначениеЭлемента;
		
	ИначеЕсли ИмяУзла = "Наименование" Тогда
		
		ТекущаяСтрокаДерева.Группа = ЗначениеЭлемента;
		
	ИначеЕсли ИмяУзла = "ЭлементНоменклатуры" Тогда
		
		ТекущаяСтрокаДерева.Номенклатура.Добавить(XMLЗначение(Тип("СправочникСсылка.Номенклатура") , ЗначениеЭлемента));
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура СкопироватьДеревоНоменклатурыВДеревоГруппРекурсивноСервер(Знач ТекущаяСсылка, Знач ПолучательСтроки, Знач ИсточникСтроки)

	Пока ИсточникСтроки.Следующий() Цикл
		
		СтрокаИсточника = ИсточникСтроки;
		
		Если СтрокаИсточника.Ссылка = ТекущаяСсылка
			ИЛИ (НЕ СтрокаИсточника.Ссылка.ЭтоГруппа)
			ИЛИ СтрокаИсточника.ТипЗаписи() = ТипЗаписиЗапроса.ДетальнаяЗапись Тогда
			Продолжить;
		КонецЕсли;
		
		НоваяСтрока = ПолучательСтроки.Добавить();
		
		НоваяСтрока.Группа = Строка(СтрокаИсточника.Ссылка);
		НоваяСтрока.ИдГруппы = Строка(СтрокаИсточника.Ссылка.УникальныйИдентификатор());
		НоваяСтрока.Номенклатура.ТипЗначения = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
		НоваяСтрока.Номенклатура.Добавить(СтрокаИсточника.Ссылка);
		ВыборкаПодчиненных = ИсточникСтроки.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкамСИерархией, "Ссылка");
		
		СкопироватьДеревоНоменклатурыВДеревоГруппРекурсивноСервер(СтрокаИсточника.Ссылка, НоваяСтрока.ПолучитьЭлементы(), ВыборкаПодчиненных)
		
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Процедура СкопироватьСписокНоменклатурыВСтроке()
	
	СписокИсходный = Элементы.ДеревоГрупп.ТекущиеДанные.Номенклатура;
	СписокНовый = Новый СписокЗначений;
	СписокНовый.ТипЗначения = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
	СписокНовый.ЗагрузитьЗначения(СписокИсходный.ВыгрузитьЗначения());
	Элементы.ДеревоГрупп.ТекущиеДанные.Номенклатура = СписокНовый;
	
КонецПроцедуры

&НаСервере 
Процедура ОчиститьНоменклатуруруВтзнСервер(ИдГруппы)
	
	тзнВрем = Новый ТаблицаЗначений;
	тзнВрем.Колонки.Добавить("Элемент");
	тзнВрем.Колонки.Добавить("Строка");
	тзнВрем.Колонки.Добавить("КодСтроки");
	
	Для каждого ТекСтр из ЭлементыВСтрокахДерева Цикл
		
		Если ИдГруппы <> ТекСтр.КодСтроки тогда
			НовСтр = тзнВрем.Добавить();
			НовСтр.Элемент 		= ТекСтр.Элемент;
			новСтр.Строка 		= ТекСтр.Строка;
			новСтр.КодСтроки 	= ТекСтр.КодСтроки;
		КонецЕсли;
		
	КонецЦикла;
	
	ЭлементыВСтрокахДерева.Очистить();
    ЭлементыВСтрокахДерева.Загрузить(тзнВрем);
	
КонецПроцедуры

#КонецОбласти

#Область ПроцедурыИФункцииДляФормированияОтчета

// Процедуры и функции для формирования отчета
&НаСервере
Функция ВернутьОтступы(Уровень)
	
	Отступ = "";
	
	Для пер = 1 по Уровень Цикл
		
		Отступ = Отступ + "    ";
		
	КонецЦикла;
	
	Возврат Отступ; 
	
КонецФункции

&НаСервере
Функция РекурсивноеЧтениеДерева(СтрокаДерева, Макет, ВременныйТабличныйДокумент, Уровень)
	НашеДерево 	= СтрокаДерева.ПолучитьЭлементы();
	Уровень 	= Уровень + 1;
	
	Для каждого ТекСтрокаДерева из НашеДерево Цикл
		
		ОбластьТела= Макет.ПолучитьОбласть("Тело");                                                                                                                                                                                                                                                                                                                                                

		ОбластьТела.параметры.Группа = ВернутьОтступы(Уровень) + Строка(ТекСтрокаДерева.Группа);
		ВременныйТабличныйДокумент.Вывести(ОбластьТела);
		
		Для каждого ТекТовар из  ТекСтрокаДерева.Номенклатура Цикл 
			Если НЕ ТекТовар.Значение.ЭтоГруппа тогда
				ОбластьТела= Макет.ПолучитьОбласть("Тело");                                                                                                                                                                                                                                                                                                                                                
				ОбластьТела.параметры.Номенклатура = Строка(ТекТовар.Значение);
				ВременныйТабличныйДокумент.Вывести(ОбластьТела);
			Иначе
				Выборка = Справочники.Номенклатура.Выбрать();
				Пока Выборка.Следующий() Цикл
					Если НЕ Выборка.ЭтоГруппа тогда
						Если Выборка.Ссылка.ПринадлежитЭлементу(ТекТовар.Значение) тогда
							ОбластьТела= Макет.ПолучитьОбласть("Тело");                                                                                                                                                                                                                                                                                                                                                
							ОбластьТела.параметры.Номенклатура = Строка(Выборка.Ссылка);
							ВременныйТабличныйДокумент.Вывести(ОбластьТела);
						КонецЕсли;
					КонецЕсли;
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;

		РекурсивноеЧтениеДерева(ТекСтрокаДерева, Макет, ВременныйТабличныйДокумент, Уровень);		
		

	КонецЦикла;
	
	Уровень = Уровень - 1;	
	
КонецФункции

&НаСервере
Процедура СформироватьОтчетПоНоменклатуре(ВременныйТабличныйДокумент)
	
	макет = планыОбмена.Б_ОбменССайтом.ПолучитьМакет("ОтчетПоНоменклатуреДерева");
	
	ОбластьШапка= Макет.ПолучитьОбласть("Шапка");                                                                                                                                                                                                                                                                                                                                                
	ВременныйТабличныйДокумент.Вывести(ОбластьШапка);
	
	РекурсивноеЧтениеДерева(ДеревоГрупп, Макет, ВременныйТабличныйДокумент, 0);
	
КонецПроцедуры

#КонецОбласти
