﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если ЭтоАдресВременногоХранилища(Параметры.АдресНастроекОбмена) Тогда
		
		АдресНастроекОбмена = Параметры.АдресНастроекОбмена;
		НастройкиОбмена 	= ПолучитьИзВременногоХранилища(АдресНастроекОбмена);
		
		ВыгружатьЗначенияСвойствВПредложения 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьЗначенияСвойствВПредложения");
		ВыгружатьХарактеристикиПредложений 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьХарактеристикиПредложений");
		ВыгружатьЗначенияСвойствВТовары 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьЗначенияСвойствВТовары");
		ВыгружатьКартинкиИФайлы 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьКартинкиИФайлы");
		ВыгружатьКартинкиИФайлыПредложений		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьКартинкиИФайлыПредложений");
		ВыгружатьКомплектующие 					= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьКомплектующие");
		ВыгружатьНоменклатуруКакПредложение 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьНоменклатуруКакПредложение");
		ВыгружатьОстатки 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьОстатки");
		ВыгружатьОстаткиПоСкладам 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьОстаткиПоСкладам");
		ВыгружатьОстаткиСУчетомРезерва 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьОстаткиСУчетомРезерва");
		ВыгружатьПредложения 					= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьПредложения");
		ВыгружатьПредложенияТолькоСЦеной 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьПредложенияТолькоСЦеной");
		ВыгружатьСвойства 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьСвойства");
		ВыгружатьТовары 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьТовары");
		ВыгружатьЦены 							= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьЦены");
		ВыгружатьШтрихкоды 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьШтрихкоды");
		КоличествоПредложенийВПакете 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "КоличествоПредложенийВПакете");
		КоличествоСвойствВПакете 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "КоличествоСвойствВПакете");
		КоличествоТоваровВПакете 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "КоличествоТоваровВПакете");
		КлассифицироватьПоВидамНоменклатуры 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "КлассифицироватьПоВидамНоменклатуры");
		
		ВыгружатьХарактеристикиТолькоСОстатками 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьХарактеристикиТолькоСОстатками");
		ВыгружатьПланируемуюДатуПоступленияПредложения 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьПланируемуюДатуПоступленияПредложения");
		ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств");
		
		СоответствиеОсновныхРеквизитовНоменклатуры.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "СоответствиеОсновныхРеквизитовНоменклатуры"));
		СоответствиеДополнительныхРеквизитовНоменклатуры.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.ИнформацияОНоменклатуре, "СоответствиеДополнительныхРеквизитовНоменклатуры"));
		
		ТаблицаКаталогов.Загрузить(Параметры.ТаблицаКаталогов.Выгрузить());
		
		Если ЭтоАдресВременногоХранилища(Параметры.АдресТаблицыКлассификаторовНоменклатуры) тогда
			
			ЭтаФорма.ЗначениеВРеквизитФормы(ПолучитьИзВременногоХранилища(Параметры.АдресТаблицыКлассификаторовНоменклатуры), "ТаблицаКлассификаторовНоменклатуры");
			
		//	ТаблицаКлассификаторовНоменклатуры.Загрузить(ПолучитьИзВременногоХранилища(Параметры.АдресТаблицыКлассификаторовНоменклатуры));
		КонецЕсли;
		
		тзнВрем = НастройкиОбмена.ИнформацияОНоменклатуре.НастройкаСвойствТоваровИХарактеристик;
		
		МассивСвойств 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьСписокСвойств();
		НастройкаСвойствТоваровИХарактеристик.Загрузить(ПланыОбмена.Б_ОбменССайтом.ОбновитьСвойстваВТаблицеЗначений(тзнВрем));
		
	Иначе
		
		Сообщить("Некорректные настройки. Продолжить невозможно.");
		Отказ = Истина;
		
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	НадписьВсеГруппы = "(" + НСтр("ru = 'Все'") + ")";
	
	ОбновлениеОтображенияВкладокНаФорме();
	
	УстановитьПараметрыТаблицыКаталогов();
	
	УстановитьТипЗначенийСпискаГруппТаблицыКаталогов();
	
КонецПроцедуры

#КонецОбласти


#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Применить(Команда)
	
	Закрыть(ПрименитьНаСервере());
	
КонецПроцедуры

&НаСервере
Функция ПрименитьНаСервере()
	
	НастройкиТовара = ПолучитьИзВременногоХранилища(АдресНастроекОбмена);

	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьЗначенияСвойствВПредложения 	= ВыгружатьЗначенияСвойствВПредложения;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьХарактеристикиПредложений 		= ВыгружатьХарактеристикиПредложений;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьЗначенияСвойствВТовары 		= ВыгружатьЗначенияСвойствВТовары;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьКартинкиИФайлы 				= ВыгружатьКартинкиИФайлы;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьКомплектующие 					= ВыгружатьКомплектующие;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьНоменклатуруКакПредложение 	= ВыгружатьНоменклатуруКакПредложение;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьОстатки 						= ВыгружатьОстатки;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьОстаткиПоСкладам 				= ВыгружатьОстаткиПоСкладам;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьОстаткиСУчетомРезерва 			= ВыгружатьОстаткиСУчетомРезерва;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьПредложения 					= ВыгружатьПредложения;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьПредложенияТолькоСЦеной 		= ВыгружатьПредложенияТолькоСЦеной;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьСвойства 						= ВыгружатьСвойства;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьТовары 						= ВыгружатьТовары;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьХарактеристикиТолькоСОстатками = ВыгружатьХарактеристикиТолькоСОстатками;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьЦены 							= ВыгружатьЦены;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьШтрихкоды 						= ВыгружатьШтрихкоды;
	НастройкиТовара.ИнформацияОНоменклатуре.КоличествоПредложенийВПакете 			= КоличествоПредложенийВПакете;
	НастройкиТовара.ИнформацияОНоменклатуре.КоличествоСвойствВПакете 				= КоличествоСвойствВПакете;
	НастройкиТовара.ИнформацияОНоменклатуре.КоличествоТоваровВПакете 				= КоличествоТоваровВПакете;
	НастройкиТовара.ИнформацияОНоменклатуре.КлассифицироватьПоВидамНоменклатуры 	= КлассифицироватьПоВидамНоменклатуры;
	
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьПланируемуюДатуПоступленияПредложения 			= ВыгружатьПланируемуюДатуПоступленияПредложения;
	НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств 	= ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств;
	НастройкиТовара.ИнформацияОНоменклатуре.НастройкаСвойствТоваровИХарактеристик 					= НастройкаСвойствТоваровИХарактеристик.Выгрузить();
	НастройкиТовара.ИнформацияОНоменклатуре.СоответствиеДополнительныхРеквизитовНоменклатуры 		= СоответствиеДополнительныхРеквизитовНоменклатуры.Выгрузить();
	НастройкиТовара.ИнформацияОНоменклатуре.СоответствиеОсновныхРеквизитовНоменклатуры 				= СоответствиеОсновныхРеквизитовНоменклатуры.Выгрузить();
	
	лАдресНастроекОбмена = ПоместитьВоВременноеХранилище(НастройкиТовара, УникальныйИдентификатор);
	
	
	лТаблицаДерева = ДанныеФормыВЗначение(ТаблицаКлассификаторовНоменклатуры, Тип("ТаблицаЗначений"));
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ТаблицаКаталогов"						, ТаблицаКаталогов);
	ПараметрыФормы.Вставить("АдресТаблицыКлассификаторовНоменклатуры", ПоместитьВоВременноеХранилище(лТаблицаДерева , УникальныйИдентификатор));
	
	ПараметрыФормы.Вставить("АдресНастроекОбмена"	, лАдресНастроекОбмена);

	
	//Проверяем и добавляем новые поля:
	
	Если НастройкиТовара.ИнформацияОНоменклатуре.Свойство("ВыгружатьКартинкиИФайлыПредложений") тогда
		НастройкиТовара.ИнформацияОНоменклатуре.ВыгружатьКартинкиИФайлыПредложений = ВыгружатьКартинкиИФайлыПредложений;
	Иначе
		НастройкиТовара.ИнформацияОНоменклатуре.Вставить("ВыгружатьКартинкиИФайлыПредложений", ВыгружатьКартинкиИФайлыПредложений);
	КонецЕсли;
	
	Возврат ПараметрыФормы;
	 
КонецФункции

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ПроверитьИЗакрыть(Команда)
	
	Если ЭтаФорма.Модифицированность тогда
		                                                                                    
		ПоказатьВопрос(Новый ОписаниеОповещения("ПослеЗакрытияВопроса", ЭтаФорма, Параметры), "Были именены настройке на форме. Закрыть форму настроек без сохранения?", РежимДиалогаВопрос.ДаНет);
		
	Иначе
		ЭтаФорма.Закрыть();	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопроса(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		ЭтаФорма.Закрыть();	
    КонецЕсли;

КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура НастроитьОтбор(Команда)
	
	Если Элементы.ТаблицаКаталогов.ТекущиеДанные = НеОпределено Тогда
		Возврат;
	КонецЕсли;
	
	ОткрытьОтборКаталога(Элементы.ТаблицаКаталогов.ТекущиеДанные.АдресНастроекКомпоновки);
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьОтборКаталога(АдресНастроекКомпоновки)
	
	НастройкаКомпоновки = НеОпределено;
	
	Если ЭтоАдресВременногоХранилища(АдресНастроекКомпоновки) Тогда
		
		НастройкаКомпоновки = ПолучитьИзВременногоХранилища(АдресНастроекКомпоновки);
		
	КонецЕсли;
	
	
	ПараметрыФормы = Новый Структура("НастройкаКомпоновки", НастройкаКомпоновки);
	
	ОткрытьФорму("ПланОбмена.Б_ОбменССайтом.Форма.ФормаНастройкиОтбора", ПараметрыФормы, ЭтаФорма,,,, Новый ОписаниеОповещения("НастроитьОтборНоменклатурыЗавершение", ЭтотОбъект), РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);
	
	
КонецПроцедуры

&НаКлиенте
Процедура НастроитьОтборНоменклатурыЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
    Если Результат <> Неопределено тогда
        Модифицированность = Истина;
		Элементы.ТаблицаКаталогов.ТекущиеДанные.АдресНастроекКомпоновки = ПоместитьВоВременноеХранилище(Результат, УникальныйИдентификатор);
	КонецЕсли;
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗаполнитьСоответствияНоменклатурыПоУмолчанию(Команда)
		
	Ответ = Неопределено;
		
	ПоказатьВопрос(Новый ОписаниеОповещения("ЗаполнитьСоответствияНоменклатурыПоУмолчаниюЗавершение", ЭтотОбъект), "Будут очищены все пользовательские соответствия полей. Продолжить? ", РежимДиалогаВопрос.ДаНет, 0);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСоответствияНоменклатурыПоУмолчаниюЗавершение(РезультатВопроса, ДополнительныеПараметры) Экспорт
    
    Ответ = РезультатВопроса;
    Если Ответ = КодВозвратаДиалога.Нет Тогда
        Возврат;
    КонецЕсли;
    
    ЗаполнениеТаблицСоответствийПоУмолчаниюСервер();

КонецПроцедуры

&НаСервере
Процедура ЗаполнениеТаблицСоответствийПоУмолчаниюСервер()
	
	СоответствиеОсновныхРеквизитовНоменклатуры.Загрузить(ПланыОбмена.Б_ОбменССайтом.ЗаполнениеПолейОсновныхСоответствийНоменклатурыПоУмолчанию());	
	СоответствиеДополнительныхРеквизитовНоменклатуры.Загрузить(ПланыОбмена.Б_ОбменССайтом.ЗаполнениеПолейДополнительныхСоответствийНоменклатурыПоУмолчанию());
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура НастроитьДеревоГрупп(Команда)

	Если Элементы.ТаблицаКаталогов.ТекущиеДанные = Неопределено тогда
		Возврат;	
	КонецЕсли;
	
	Найдено = ТаблицаКлассификаторовНоменклатуры.НайтиСтроки(Новый Структура("ИдентификаторКаталога", Элементы.ТаблицаКаталогов.ТекущиеДанные.ИдентификаторКаталога));
	
	ДеревоГрупп = НеОпределено;
	
	Если Найдено.Количество() > 0 Тогда
		
		ДеревоГрупп = Найдено[0].ДеревоГрупп;
		
	КонецЕсли;

	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ДеревоГрупп", ДеревоГрупп);
	ПараметрыФормы.Вставить("СписокОтбора", Элементы.ТаблицаКаталогов.ТекущиеДанные.Группы);
	ПараметрыФормы.Вставить("ОтборПоВидамНоменклатуры", КлассифицироватьПоВидамНоменклатуры);
	
	ОткрытьФорму("ПланОбмена.Б_ОбменССайтом.Форма.ФормаДеревоГрупп", ПараметрыФормы, ЭтаФорма);
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗаполнитьИспользованиеСвойствПоУмолчанию(Команда)
	
	мТовары = ПолучитьМассивИспользуемыхТоваров();

	
	КоличествоСвойств = НастройкаСвойствТоваровИХарактеристик.Количество();
	КоличествоСвойств = ?(КоличествоСвойств = 0, 1, КоличествоСвойств);
	
	ПрогрессСостояния = 0;
	
	Состояние("Заполнение использование свойств по умолчанию", ПрогрессСостояния);
	
	ШагПрогресса = 100/КоличествоСвойств;
	
	Для Каждого ТекСвойство Из НастройкаСвойствТоваровИХарактеристик Цикл
		
		ТекСвойство.НеВыгружатьВСвойстваТоваров 	= ПроверитьИспользованиеСвойствТоваровНаСервере(ТекСвойство.Свойство, мТовары);
		ТекСвойство.НеВыгружатьВСвойстваПредложений = ПроверитьИспользованиеСвойствХарактеристикНаСервере(ТекСвойство.Свойство, мТовары);
		
		ПрогрессСостояния = ПрогрессСостояния + ШагПрогресса;
		Состояние("Заполнение использование свойств по умолчанию", ПрогрессСостояния);
		
	КонецЦикла;
	
	Модифицированность = Истина;
	
	Состояние("Заполнение использование свойств по умолчанию", 100);
	     
КонецПроцедуры

&НаСервере
Функция ПолучитьМассивИспользуемыхТоваров()
	   
	НаборЗаписей = РегистрыСведений.Б_ПакетныйОбмен.СоздатьНаборЗаписей();
	НаборЗаписей.Отбор.НастройкаОбмена.Установить(ПланыОбмена.Б_ОбменССайтом.УзелОбменаЭтойИБСервер());
	НаборЗаписей.Очистить();
	НаборЗаписей.Записать(Истина);
	
	СтруктураСхемКомпоновки = Б_ОбменССайтомСервер.ПолучитьСтруктуруСхемКомпоновки();
	
	ОсновныеПараметры 		= Новый Структура;
	
	ОсновныеПараметры.Вставить("Ссылка"						, ПланыОбмена.Б_ОбменССайтом.УзелОбменаЭтойИБСервер());
	ОсновныеПараметры.Вставить("ПолнаяВыгрузка"				, Истина);
	ОсновныеПараметры.Вставить("ИмяФайлаЛога"				, "");
	ОсновныеПараметры.Вставить("СтруктураСхемКомпоновки"	, Б_ОбменССайтомСервер.ПолучитьСтруктуруСхемКомпоновки());
	ОсновныеПараметры.Вставить("ОбменТоварами"				, Истина);
	ОсновныеПараметры.Вставить("ВыгружатьСвойства"			, Ложь);
	ОсновныеПараметры.Вставить("ДатаФормирования"			, ТекущаяДата());
	ОсновныеПараметры.Вставить("КлассифицироватьПоВидамНоменклатуры", КлассифицироватьПоВидамНоменклатуры);
	ОсновныеПараметры.Вставить("КоличествоТоваровВПакете"	, 100000);
	
	ТаблицаКаталоговТЗ = ТаблицаКаталогов.Выгрузить();
	
	ТаблицаКаталоговТЗ.Колонки.Добавить("ХранилищеНастроекКомпоновки", Новый ОписаниеТипов("ХранилищеЗначения"));
	
	Для Каждого СтрокаТаблицыКаталогов Из ТаблицаКаталоговТЗ Цикл
		
		Если НЕ ЭтоАдресВременногоХранилища(СтрокаТаблицыКаталогов.АдресНастроекКомпоновки) Тогда
			
			Продолжить;
			
		КонецЕсли;
		
		НастройкиКомпоновки = ПолучитьИзВременногоХранилища(СтрокаТаблицыКаталогов.АдресНастроекКомпоновки);
		
		СтрокаТаблицыКаталогов.ХранилищеНастроекКомпоновки = Новый ХранилищеЗначения(НастройкиКомпоновки);
		
	КонецЦикла;
	
	ОсновныеПараметры.Вставить("СохраненнаяТаблицаКаталогов"		, Новый ХранилищеЗначения(ТаблицаКаталоговТЗ));   
	ОсновныеПараметры.Вставить("ТаблицыКлассификаторовНоменклатуры"	, РеквизитФормыВЗначение("ТаблицаКлассификаторовНоменклатуры"));   

	Для Каждого ДанныеКаталога Из ТаблицаКаталоговТЗ Цикл
		МассивУдалить = Новый Массив;
		Для Каждого Группа Из ДанныеКаталога.Группы Цикл
			Если НЕ ЗначениеЗаполнено(Группа.Значение) Тогда
				МассивУдалить.Добавить(Группа);
			КонецЕсли;
		КонецЦикла;
		Для Каждого УдалитьЭлемент Из МассивУдалить Цикл
			ДанныеКаталога.Группы.Удалить(УдалитьЭлемент);
		КонецЦикла;
	КонецЦикла;
	
	ТаблицаКаталоговТЗ.Колонки.Добавить("СтруктураРезультата");
		
	Б_ОбменССайтомСервер.ДобавитьКлассификаторыВТаблицуКаталогов(ТаблицаКаталоговТЗ, ОсновныеПараметры.ТаблицыКлассификаторовНоменклатуры);
		
	ОсновныеПараметры.Вставить("ТаблицаКаталогов", ТаблицаКаталоговТЗ);
		
	Б_ОбменССайтомСерверВыгрузкаДанных.ФормированиеПакетовДанных(ОсновныеПараметры, "Товары");	
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	|	Б_ПакетныйОбмен.Объект
	|ИЗ
	|	РегистрСведений.Б_ПакетныйОбмен КАК Б_ПакетныйОбмен
	|ГДЕ
	|	Б_ПакетныйОбмен.НастройкаОбмена = &УзелОбмена
	|	И Б_ПакетныйОбмен.Объект ССЫЛКА Справочник.Номенклатура";
	Запрос.УстановитьПараметр("УзелОбмена", ПланыОбмена.Б_ОбменССайтом.УзелОбменаЭтойИБСервер());
	
	тзнТоваров = Запрос.Выполнить().Выгрузить();
	
	НаборЗаписей = РегистрыСведений.Б_ПакетныйОбмен.СоздатьНаборЗаписей();
	НаборЗаписей.Отбор.НастройкаОбмена.Установить(ПланыОбмена.Б_ОбменССайтом.УзелОбменаЭтойИБСервер());
	НаборЗаписей.Очистить();
	НаборЗаписей.Записать(Истина);
	
	Возврат тзнТоваров.ВыгрузитьКолонку("Объект");
	
КонецФункции

&НаСервереБезКонтекста
Функция ПроверитьИспользованиеСвойствТоваровНаСервере(Свойство, мТовары)
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Свойство", Свойство);
	Запрос.УстановитьПараметр("СписокТоваров", мТовары);
	
	Запрос.Текст = "ВЫБРАТЬ ПЕРВЫЕ 1
	               |	ДополнительныеРеквизиты.Свойство
	               |ИЗ
	               |	Справочник.Номенклатура.ДополнительныеРеквизиты КАК ДополнительныеРеквизиты
	               |ГДЕ
	               |	ДополнительныеРеквизиты.Свойство = &Свойство
	               |	И ДополнительныеРеквизиты.Ссылка В(&СписокТоваров)";
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	Возврат НЕ Выборка.Следующий(); 	 
	
КонецФункции

&НаСервереБезКонтекста
Функция ПроверитьИспользованиеСвойствХарактеристикНаСервере(Свойство, мТовары)
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Свойство", Свойство);
	Запрос.УстановитьПараметр("СписокТоваров", мТовары);
	
	Запрос.Текст = "ВЫБРАТЬ РАЗЛИЧНЫЕ
	|	Номенклатура.ВидНоменклатуры
	|ПОМЕСТИТЬ ВремВидыНоменклатуры
	|ИЗ
	|	Справочник.Номенклатура КАК Номенклатура
	|ГДЕ
	|	Номенклатура.Ссылка В (&СписокТоваров)
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ ПЕРВЫЕ 1
	|	ДополнительныеРеквизиты.Свойство
	|ИЗ
	|	Справочник.ХарактеристикиНоменклатуры.ДополнительныеРеквизиты КАК ДополнительныеРеквизиты
	|ГДЕ
	|	ДополнительныеРеквизиты.Свойство = &Свойство
	|	И (ДополнительныеРеквизиты.Ссылка.Владелец В (&СписокТоваров)
	|			ИЛИ ДополнительныеРеквизиты.Ссылка.Владелец В
	|				(ВЫБРАТЬ
	|					ВремВидыНоменклатуры.ВидНоменклатуры
	|				ИЗ
	|					ВремВидыНоменклатуры))
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|УНИЧТОЖИТЬ ВремВидыНоменклатуры";
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	Возврат НЕ Выборка.Следующий(); 	 
	
КонецФункции

#КонецОбласти


#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ОбновлениеОтображенияВкладокНаФормеПриИзменении(Элемент)
	ОбновлениеОтображенияВкладокНаФорме(Элемент.Имя);
КонецПроцедуры

&НаКлиенте
Процедура ОбновлениеОтображенияВкладокНаФорме(НаименованиеЭлемента = "")
	
	Если НаименованиеЭлемента = "ВыгружатьТовары" тогда
		ДоступностьЭлементовТоваровПоФлажку();	
	ИначеЕсли НаименованиеЭлемента = "ВыгружатьПредложения" тогда
		ДоступностьЭлементовПредложенийПоФлажку();	
	ИначеЕсли НаименованиеЭлемента = "ВыгружатьСвойства" тогда
		ДоступностьЭлементовСвойствПоФлажку();	
	ИначеЕсли НаименованиеЭлемента = "ВыгружатьОстатки" тогда
		ДоступностьЭлементовОстатковПоФлажку();	
	ИначеЕсли НаименованиеЭлемента = "ВыгружатьЦены" тогда
		
	Иначе
		ДоступностьЭлементовТоваровПоФлажку();	
		ДоступностьЭлементовПредложенийПоФлажку();	
		ДоступностьЭлементовСвойствПоФлажку();
		ДоступностьЭлементовОстатковПоФлажку();
	КонецЕсли;
	
КонецПроцедуры

Процедура ДоступностьЭлементовТоваровПоФлажку()
	
	Если ВыгружатьТовары тогда
		
		Элементы.ВыгружатьКартинкиИФайлы.Доступность 							= Истина;
		Элементы.ВыгружатьЗначенияСвойствВТовары.Доступность 					= Истина;
		Элементы.СоответствиеОсновныхРеквизитовНоменклатуры.Доступность 		= Истина;
		Элементы.СоответствиеДополнительныхРеквизитовНоменклатуры.Доступность 	= Истина;
		Элементы.ЗаполнитьСоответствияНоменклатурыПоУмолчанию.Доступность 		= Истина;
		Элементы.КоличествоТоваровВПакете.Доступность 							= Истина;
		
	Иначе
		
		Элементы.ВыгружатьКартинкиИФайлы.Доступность 							= Ложь;
		Элементы.ВыгружатьЗначенияСвойствВТовары.Доступность 					= Ложь;
		Элементы.СоответствиеОсновныхРеквизитовНоменклатуры.Доступность 		= Ложь;
		Элементы.СоответствиеДополнительныхРеквизитовНоменклатуры.Доступность 	= Ложь;
		Элементы.ЗаполнитьСоответствияНоменклатурыПоУмолчанию.Доступность 		= Ложь;
		Элементы.КоличествоТоваровВПакете.Доступность 							= Ложь;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ДоступностьЭлементовПредложенийПоФлажку()
	
	Если ВыгружатьПредложения тогда
		
		Элементы.ВыгружатьКартинкиИФайлыПредложений.Доступность 			= Истина;
		Элементы.ВыгружатьХарактеристикиТолькоСОстатками.Доступность 		= Истина;
		Элементы.ВыгружатьПредложенияТолькоСЦеной.Доступность 				= Истина;
		Элементы.ВыгружатьНоменклатуруКакПредложение.Доступность 			= Истина;
		Элементы.ВыгружатьЗначенияСвойствВПредложения.Доступность 			= Истина;
		Элементы.ВыгружатьШтрихкоды.Доступность 							= Истина;
		Элементы.ВыгружатьПланируемуюДатуПоступленияПредложения.Доступность = Истина;
		Элементы.ВыгружатьКомплектующие.Доступность 						= Истина;
		Элементы.КоличествоПредложенийВПакете.Доступность 					= Истина;
		Элементы.ВыгружатьХарактеристикиПредложений.Доступность 			= Истина;
		
	Иначе
		
		Элементы.ВыгружатьКартинкиИФайлыПредложений.Доступность 			= Ложь;
		Элементы.ВыгружатьХарактеристикиТолькоСОстатками.Доступность 		= Ложь;
		Элементы.ВыгружатьПредложенияТолькоСЦеной.Доступность 				= Ложь;
		Элементы.ВыгружатьНоменклатуруКакПредложение.Доступность 			= Ложь;
		Элементы.ВыгружатьЗначенияСвойствВПредложения.Доступность 			= Ложь;
		Элементы.ВыгружатьШтрихкоды.Доступность 							= Ложь;
		Элементы.ВыгружатьПланируемуюДатуПоступленияПредложения.Доступность = Ложь;
		Элементы.ВыгружатьКомплектующие.Доступность 						= Ложь;
		Элементы.КоличествоПредложенийВПакете.Доступность 					= Ложь;
		Элементы.ВыгружатьХарактеристикиПредложений.Доступность 			= Ложь;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ДоступностьЭлементовСвойствПоФлажку()
	
	Если ВыгружатьСвойства тогда
		
		//Элементы.ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств.Доступность 	= Истина;
		Элементы.ЗаполнитьИспользованиеСвойствПоУмолчанию.Доступность 				= Истина;
		Элементы.НастройкаСвойствТоваровИХарактеристик.Доступность 					= Истина;
		Элементы.КоличествоСвойствВПакете.Доступность 								= Истина;
		
	Иначе
		
		//Элементы.ВыгружатьТолькоИспользуемыеСправочныеЗначенияСвойств.Доступность 	= Ложь;
		Элементы.ЗаполнитьИспользованиеСвойствПоУмолчанию.Доступность 				= Ложь;
		Элементы.НастройкаСвойствТоваровИХарактеристик.Доступность 					= Ложь;
		Элементы.КоличествоСвойствВПакете.Доступность 								= Ложь;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ДоступностьЭлементовОстатковПоФлажку()
	
	Если ВыгружатьОстатки тогда
		
		Элементы.ВыгружатьОстаткиПоСкладам.Доступность 			= Истина;
		Элементы.ВыгружатьОстстакиСУчетомРезерва.Доступность 	= Истина;
		
	Иначе
		
		Элементы.ВыгружатьОстаткиПоСкладам.Доступность 			= Ложь;
		Элементы.ВыгружатьОстстакиСУчетомРезерва.Доступность 	= Ложь;
		
	КонецЕсли;
	
КонецПроцедуры


////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура СоответствиеОсновныхРеквизитовНоменклатурыНаименованиеПоля1СНачалоВыбораИзСписка(Элемент, СтандартнаяОбработка)
		
	Элемент.СписокВыбора.Очистить();
	
	Элемент.СписокВыбора.ЗагрузитьЗначения(ПолучитьМассивПолей1СДляНоменклатуры());

КонецПроцедуры

&НаСервере
Функция ПолучитьМассивПолей1СДляНоменклатуры()
	
	мПолей1С = новый Массив;
	мПолей1С.Добавить("");
	мПолей1С.Добавить("Номенклатура");
	мПолей1С.Добавить("Код");
	мПолей1С.Добавить("Наименование");
	мПолей1С.Добавить("Полное наименование");
	мПолей1С.Добавить("Штрихкод");
	мПолей1С.Добавить("Артикул");
	мПолей1С.Добавить("Описание");
	мПолей1С.Добавить("Вес");
	мПолей1С.Добавить("Родитель");
	мПолей1С.Добавить("Вид номенклатуры");
	мПолей1С.Добавить("Планируемая дата поступления");
	
	Возврат мПолей1С;
	
КонецФункции

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура СоответствиеОсновныхРеквизитовНоменклатурыНаименованиеПоля1СОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	
	лСтруктураПараметров = Новый Структура;
	лСтруктураПараметров.Вставить("Текст", Текст);
	
	ПоказатьВопрос(Новый ОписаниеОповещения("ПослеЗакрытияВопросаОПроверкиКорректности", ЭтаФорма, лСтруктураПараметров), "Проверить корректность поля?", РежимДиалогаВопрос.ДаНет);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопросаОПроверкиКорректности(Результат, Параметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
		ПроверкаУспешна = ПроверитьКорректностьПоля(Параметры.Текст);	
		
		Если Не ПроверкаУспешна тогда
			Сообщить("При проверке корректности поля 1С возникла ошибка. При обмена данных возникнет ошибка.");
		КонецЕсли;
    КонецЕсли;

КонецПроцедуры



&НаСервере
Функция ПроверитьКорректностьПоля(НаименованиеПоля)
	
	МассивПолей = ПолучитьМассивПолей1СДляНоменклатуры();
	
	Если МассивПолей.Найти(НаименованиеПоля) = Неопределено тогда
		
		Номенклатура = Справочники.Номенклатура.СоздатьЭлемент();
		
		Попытка
			
			Выполнить(" Проверка = " + НаименованиеПоля);
			
		Исключение
			Возврат Ложь;	
		КонецПопытки;
		
	КонецЕсли;	
	
	Возврат Истина;	
	
КонецФункции

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура КлассифицироватьПоВидамНоменклатурыПриИзменении(Элемент)
	
	УстановитьПараметрыТаблицыКаталогов();
	
	ИзменитьТипЗначенийСпискаГруппТаблицыКаталогов();
	
КонецПроцедуры


#КонецОбласти


#Область СобытияПроцедурыИФункцииПоРаботеСТаблицейКаталогов

&НаКлиенте
Процедура ТаблицаКаталоговГруппыНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	Группы = Элементы.ТаблицаКаталогов.ТекущиеДанные.Группы;
	
	Если Группы.Количество() = 1 Тогда
		
		Если НЕ ЗначениеЗаполнено(Группы[0].Значение) Тогда
			
			Группы.Очистить();
			
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговПередОкончаниемРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования, Отказ)
	
	Отказ = НЕ ИдентификаторУникален();
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	
	Если ОтменаРедактирования Тогда
		Возврат;
	КонецЕсли;
	
	Если Элемент.ТекущиеДанные = НеОпределено Тогда
		Возврат;
	КонецЕсли;
	
	ОбработатьВыбранныеГруппыСерверБезКонтекста(Элемент.ТекущиеДанные.Группы, НадписьВсеГруппы);
	
	Если ПустаяСтрока(Элемент.ТекущиеДанные.ИдентификаторКаталога) Тогда
		
		Элемент.ТекущиеДанные.ИдентификаторКаталога = Строка(Новый УникальныйИдентификатор);
		
	КонецЕсли;
	
	Если ПустаяСтрока(Элемент.ТекущиеДанные.Каталог) Тогда
		
		Элемент.ТекущиеДанные.Каталог = НСтр("ru = 'Каталог товаров'") + " " + ВРег(СокрЛП(Лев(Элемент.ТекущиеДанные.ИдентификаторКаталога, 8)));
		
	КонецЕсли;
	
	Модифицированность = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговПослеУдаления(Элемент)
	
	Модифицированность = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	
	ПриНачалеРедактированияТаблицаКаталогов(Элемент, Копирование);
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьПараметрыТаблицыКаталогов()
	
	Если КлассифицироватьПоВидамНоменклатуры Тогда
		
		ЗаголовокТаблицы = НСтр("ru = 'Таблица каталогов (соответствие видов номенклатуры каталогам на сайте)'");
		ЗаголовокКолонки = НСтр("ru = 'Виды номенклатуры'");
		ВыборГруппИЭлементов = ГруппыИЭлементы.ГруппыИЭлементы;
		
	Иначе
		
		ЗаголовокТаблицы = НСтр("ru = 'Таблица каталогов (соответствие групп номенклатуры каталогам на сайте)'");
		ЗаголовокКолонки = НСтр("ru = 'Группы номенклатуры'");
		ВыборГруппИЭлементов = ГруппыИЭлементы.Группы;
		
	КонецЕсли;
	
	Элементы.ТаблицаКаталоговГруппы.Заголовок = ЗаголовокКолонки;
	Элементы.ТаблицаКаталоговГруппы.ВыборГруппИЭлементов = ВыборГруппИЭлементов;
		
КонецПроцедуры

&НаКлиенте
Функция ИдентификаторУникален()
	
	ИдентификаторКаталога = Элементы.ТаблицаКаталогов.ТекущиеДанные.ИдентификаторКаталога;
	Найдено = ТаблицаКаталогов.НайтиСтроки(Новый Структура("ИдентификаторКаталога", ИдентификаторКаталога));
	ИдентификаторыУникальны = Найдено.Количество() = 1;
	
	Если НЕ ИдентификаторыУникальны Тогда
		
		ОчиститьСообщения();
		
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
			НСтр("ru = 'Идентификатор каталога должен быть уникальным!'"),
			Неопределено,
			ОбщегоНазначенияКлиентСервер.ПутьКТабличнойЧасти(
				"ТаблицаКаталогов", ТаблицаКаталогов.Индекс(Элементы.ТаблицаКаталогов.ТекущиеДанные) + 1, "ИдентификаторКаталога"));

	КонецЕсли;
	
	Возврат ИдентификаторыУникальны;
	
КонецФункции

&НаКлиенте
Процедура УстановитьТипЗначенийСпискаГруппТаблицыКаталогов()
	
	Если КлассифицироватьПоВидамНоменклатуры Тогда 
		
		ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.ВидыНоменклатуры");
		
	Иначе
		
		ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
		
	КонецЕсли;
	
	Для Каждого СтрокаТаблицыКаталогов Из ТаблицаКаталогов Цикл
		
		СтрокаТаблицыКаталогов.Группы.ТипЗначения = ТипЗначений;
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговИдентификаторКаталогаОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	Если Текст = "ПользовательскиеСправочники" или Текст = "Контрагенты" или Текст = "Партнеры" тогда 
		СтандартнаяОбработка = ложь;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ПриНачалеРедактированияТаблицаКаталогов(Элемент, Копирование)
	
	Если Копирование Тогда
		
		Элемент.ТекущиеДанные.ИдентификаторКаталога = "";
		
	КонецЕсли;
	
	Если (Элемент.ТекущиеДанные.Группы.Количество() = 1
		И НЕ ЗначениеЗаполнено(Элемент.ТекущиеДанные.Группы[0].Значение))
		ИЛИ Элемент.ТекущиеДанные.Группы.Количество() = 0 Тогда
			
		НовыйСписокГрупп = Новый СписокЗначений;
		
		Если КлассифицироватьПоВидамНоменклатуры Тогда 
			ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.ВидыНоменклатуры");
		Иначе
			ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
		КонецЕсли;
		
		НовыйСписокГрупп.ТипЗначения = ТипЗначений;
		НовыйСписокГрупп.Добавить(НеОпределено, НадписьВсеГруппы);
		Элемент.ТекущиеДанные.Группы = НовыйСписокГрупп;
			
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ОбработатьВыбранныеГруппыСерверБезКонтекста(СписокГрупп, НадписьВсеГруппы)
	
	ГруппыВыбраны = Ложь;
	
	// Удалить не группы номенклатуры
	
	МассивУдалить = Новый Массив;
	
	Для Каждого ЭлементСЗ Из СписокГрупп Цикл
		
		ТекГруппа = ЭлементСЗ.Значение;
		
		Если (НЕ ЗначениеЗаполнено(ТекГруппа))
			ИЛИ 
			(ТипЗнч(ТекГруппа) = Тип("СправочникСсылка.Номенклатура")
			И НЕ ТекГруппа.ЭтоГруппа) Тогда
			
			МассивУдалить.Добавить(ЭлементСЗ);
			
		КонецЕсли;
		
	КонецЦикла;
	
	Для Каждого ЭлементМУ Из МассивУдалить Цикл
		
		СписокГрупп.Удалить(ЭлементМУ);
		
	КонецЦикла;
	
	// Удалить дубли и подчиненные элементы
	
	МассивУдалить = Новый Массив;
	
	Для Каждого ЭлементСЗ Из СписокГрупп Цикл
		
		Если НЕ МассивУдалить.Найти(ЭлементСЗ) = НеОпределено Тогда
			
			Продолжить;
			
		КонецЕсли;
		
		ТекГруппа = ЭлементСЗ.Значение;
		
		Для Каждого ЭлементСЗВлож Из СписокГрупп Цикл

			Если НЕ МассивУдалить.Найти(ЭлементСЗВлож) = НеОпределено Тогда
			
				Продолжить;
			
			КонецЕсли;
			
			Если НЕ ЭлементСЗВлож = ЭлементСЗ
				И ЭлементСЗВлож.Значение = ТекГруппа Тогда
				
				МассивУдалить.Добавить(ЭлементСЗВлож);
				
			Иначе
			
				Если ЭлементСЗВлож.Значение.ПринадлежитЭлементу(ТекГруппа) Тогда
				
					МассивУдалить.Добавить(ЭлементСЗВлож);
				
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЦикла;
		
	КонецЦикла;
	
	Для Каждого ЭлементМУ Из МассивУдалить Цикл
		
		СписокГрупп.Удалить(ЭлементМУ);
		
	КонецЦикла;
	
	Для Каждого ЭлементСЗ Из СписокГрупп Цикл
		
		Если ЗначениеЗаполнено(ЭлементСЗ.Значение) Тогда
			
			ГруппыВыбраны = Истина;
			
			Прервать;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Если НЕ ГруппыВыбраны Тогда
		
		СписокГрупп.Очистить();
		
		СписокГрупп.Добавить(НеОпределено, НадписьВсеГруппы);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ИзменитьТипЗначенийСпискаГруппТаблицыКаталогов()
	
	Если КлассифицироватьПоВидамНоменклатуры Тогда 
		
		ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.ВидыНоменклатуры");
		
	Иначе
		
		ТипЗначений = Новый ОписаниеТипов("СправочникСсылка.Номенклатура");
		
	КонецЕсли;
	
	Для Каждого СтрокаТаблицыКаталогов Из ТаблицаКаталогов Цикл
		
		СтрокаТаблицыКаталогов.Группы.ТипЗначения = ТипЗначений;
		СтрокаТаблицыКаталогов.Группы.Очистить();
		СтрокаТаблицыКаталогов.Группы.Добавить(НеОпределено, НадписьВсеГруппы);
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ТаблицаКаталоговИдентификаторКаталогаПриИзменении(Элемент)
	ТаблицаКаталоговИдентификаторКаталогаПриИзмененииНаСервере(ЭтотОбъект.ВладелецФормы.Объект.Ссылка);
КонецПроцедуры

&НаСервере
Процедура ТаблицаКаталоговИдентификаторКаталогаПриИзмененииНаСервере(НастройкаОбмена)
	
	Выборка = РегистрыСведений.Б_ПакетныйОбмен.Выбрать(Новый Структура("НастройкаОбмена", НастройкаОбмена));
	
	Пока Выборка.Следующий() Цикл
		Выборка.ПолучитьМенеджерЗаписи().Удалить();	
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти
