﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если ЭтоАдресВременногоХранилища(Параметры.АдресНастроекОбмена) Тогда
		
		АдресНастроекОбмена = Параметры.АдресНастроекОбмена;
		
		НастройкиОбмена 	= ПолучитьИзВременногоХранилища(АдресНастроекОбмена);
		Объект				= Параметры.Объект;
		
		ВыгружатьВсеДокументы 					= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ВыгружатьВсеДокументы");
		ТочкаАктуальностиВыгрузкиДокументов 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ТочкаАктуальностиВыгрузкиДокументов");
		
		ВыгрузкаОтгрузок 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ВыгрузкаОтгрузок");
		ВыгрузкаОплат 							= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ВыгрузкаОплат");
		
		НеРедактироватьДокументыПришедшиеССайта	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "НеРедактироватьДокументыПришедшиеССайта");
		
		ЗагрузкаОплат 							= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ЗагрузкаОплат");
		ЗагрузкаОтгрузок 						= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ЗагрузкаОтгрузок");
		
		УстанавливатьРучнуюСкидкуВДокументе 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "УстанавливатьРучнуюСкидкуВДокументе");
		
		КоличествоДокументовВПакете 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "КоличествоДокументовВПакете");
		//мб. есть ключ КоличествоЗаказовВПакете, который был в старых модулях 
		Если НЕ ЗначениеЗаполнено(КоличествоДокументовВПакете) тогда
			КоличествоДокументовВПакете = ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "КоличествоЗаказовВПакете");
		КонецЕсли;
		
		СтруктураССхемамиК = Б_ОбменССайтомСервер.ПолучитьСтруктуруСхемКомпоновки();
		
		НастройкиКомпоновкиДанныхЗаказов 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "НастройкиКомпоновкиДанныхЗаказов");
		АдресСхемы = ПоместитьВоВременноеХранилище(СтруктураССхемамиК.Заказы, УникальныйИдентификатор);
		КомпоновщикНастроекКомпоновкиДанныхЗаказов.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемы)); 
		КомпоновщикНастроекКомпоновкиДанныхЗаказов.ЗагрузитьНастройки(НастройкиКомпоновкиДанныхЗаказов);
		КомпоновщикНастроекКомпоновкиДанныхЗаказов.Восстановить(СпособВосстановленияНастроекКомпоновкиДанных.ПроверятьДоступность);
		
		//создаем новую компановку, если ее ранее не было
		НастройкиКомпоновкиДанныхОтгрузок 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "НастройкиКомпоновкиДанныхОтгрузок");
		АдресСхемы = ПоместитьВоВременноеХранилище(СтруктураССхемамиК.Отгрузки, УникальныйИдентификатор);
		КомпоновщикНастроекКомпоновкиДанныхОтгрузок.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемы)); 
		
		Если НастройкиКомпоновкиДанныхОтгрузок <> Неопределено тогда
			КомпоновщикНастроекКомпоновкиДанныхОтгрузок.ЗагрузитьНастройки(НастройкиКомпоновкиДанныхОтгрузок);
		Иначе
			КомпоновщикНастроекКомпоновкиДанныхОтгрузок.ЗагрузитьНастройки(СтруктураССхемамиК.Отгрузки.НастройкиПоУмолчанию);
		КонецЕсли; 		
		КомпоновщикНастроекКомпоновкиДанныхОтгрузок.Восстановить(СпособВосстановленияНастроекКомпоновкиДанных.ПроверятьДоступность);
		
		НастройкиКомпоновкиДанныхОплат 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "НастройкиКомпоновкиДанныхОплат");
		АдресСхемы = ПоместитьВоВременноеХранилище(СтруктураССхемамиК.Оплаты, УникальныйИдентификатор);
		КомпоновщикНастроекКомпоновкиДанныхОплат.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемы)); 
		
		Если НастройкиКомпоновкиДанныхОплат <> Неопределено тогда
			КомпоновщикНастроекКомпоновкиДанныхОплат.ЗагрузитьНастройки(НастройкиКомпоновкиДанныхОплат);
		Иначе
			КомпоновщикНастроекКомпоновкиДанныхОплат.ЗагрузитьНастройки(СтруктураССхемамиК.Оплаты.НастройкиПоУмолчанию);
		КонецЕсли;
		КомпоновщикНастроекКомпоновкиДанныхОплат.Восстановить(СпособВосстановленияНастроекКомпоновкиДанных.ПроверятьДоступность);

		/////////////////////////////////////////////////////////
		ГруппаДляНовойНоменклатуры 		= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ГруппаДляНовойНоменклатуры");
		ВидНоменклатурыТовар 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ВидНоменклатурыТовар");
		ВидНоменклатурыУслуга 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ВидНоменклатурыУслуга");
		КонтрагентФизлицо 				= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "КонтрагентФизлицо");
		СоглашениеКонтрагентаФизлицо 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "СоглашениеКонтрагентаФизлицо");
		ПричинаОтменыЗаказа 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ПричинаОтменыЗаказа");
		СтатусЗаказаОтменен 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "СтатусЗаказаОтменен");
		
		ЗагружаемыеТипыОплат 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ЗагружаемыеТипыОплат");
		ПроводитьЕслиОплачен 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ПроводитьЕслиОплачен");
		ПроводитьЕслиОтгружен 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "ПроводитьЕслиОтгружен");
		
		СоответствиеСтатусовЗаказов.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "СоответствиеСтатусовЗаказов"));
		СоответствиеСтатусовОтгрузок.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "СоответствиеСтатусовОтгрузок"));
		СоответствиеПлатежныхСистемИКасс.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Заказы, "СоответствиеПлатежныхСистемИКасс"));
		
		СохраненныеНастройкиЗагружаемыхДокументов = ПоместитьВоВременноеХранилище(НастройкиОбмена.Заказы.СохраненныеНастройкиЗагружаемыхДокументов, УникальныйИдентификатор);
		
		ГруппаДляНовыхКонтрагентов 					= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "ГруппаДляНовыхКонтрагентов");
		СпособИдентификацииКонтрагентов 			= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "СпособИдентификацииКонтрагентов");
		
		ИспользоватьФИОДляФизЛиц 					= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "ИспользоватьФИОДляФизЛиц");
		НеРедактироватьКонтрагентовПришедшихССайта 	= ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "НеРедактироватьКонтрагентовПришедшихССайта");

		СоответствиеАдресовФизЛиц.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "СоответствиеАдресовФизЛиц"));
		СоответствиеАдресовЮрЛиц.Загрузить(ПланыОбмена.Б_ОбменССайтом.ПолучитьЗначениеКлючаСтруктурыНастроек(НастройкиОбмена.Контрагенты, "СоответствиеАдресовЮрЛиц"));

	КонецЕсли; 

КонецПроцедуры

#КонецОбласти


#Область ОбработчикиКомандФормы

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
Процедура Применить(Команда)
	
	Закрыть(ПрименитьНаСервере());
	
КонецПроцедуры

&НаСервере
Функция ПрименитьНаСервере()
	
	Настройки = ПолучитьИзВременногоХранилища(АдресНастроекОбмена);

	Настройки.Заказы.ВыгрузкаОтгрузок						= ВыгрузкаОтгрузок;	
	Настройки.Заказы.ЗагрузкаОтгрузок 						= ЗагрузкаОтгрузок;
	Настройки.Заказы.ЗагрузкаОплат							= ЗагрузкаОплат;	
	
	Настройки.Заказы.НеРедактироватьДокументыПришедшиеССайта= НеРедактироватьДокументыПришедшиеССайта;	
	Настройки.Заказы.УстанавливатьРучнуюСкидкуВДокументе 	= УстанавливатьРучнуюСкидкуВДокументе;
	
	Настройки.Заказы.НастройкиКомпоновкиДанныхЗаказов		= КомпоновщикНастроекКомпоновкиДанныхЗаказов.ПолучитьНастройки();
	
	Настройки.Заказы.ГруппаДляНовойНоменклатуры 			= ГруппаДляНовойНоменклатуры;
	Настройки.Заказы.ВидНоменклатурыТовар 					= ВидНоменклатурыТовар;
	Настройки.Заказы.ВидНоменклатурыУслуга 					= ВидНоменклатурыУслуга;
	Настройки.Заказы.КонтрагентФизлицо 						= КонтрагентФизлицо;
	Настройки.Заказы.СоглашениеКонтрагентаФизлицо 			= СоглашениеКонтрагентаФизлицо;
	Настройки.Заказы.ПричинаОтменыЗаказа 					= ПричинаОтменыЗаказа;
	Настройки.Заказы.СтатусЗаказаОтменен 					= СтатусЗаказаОтменен;
	
	Настройки.Заказы.СоответствиеПлатежныхСистемИКасс 		= СоответствиеПлатежныхСистемИКасс.Выгрузить();
	Настройки.Заказы.СоответствиеСтатусовЗаказов 			= СоответствиеСтатусовЗаказов.Выгрузить();
	Настройки.Заказы.СоответствиеСтатусовОтгрузок 			= СоответствиеСтатусовОтгрузок.Выгрузить();
	
	Если ЭтоАдресВременногоХранилища(СохраненныеНастройкиЗагружаемыхДокументов) Тогда
		Настройки.Заказы.СохраненныеНастройкиЗагружаемыхДокументов	= ПолучитьИзВременногоХранилища(СохраненныеНастройкиЗагружаемыхДокументов);
	КонецЕсли;	
	
	Настройки.Контрагенты.НеРедактироватьКонтрагентовПришедшихССайта	= НеРедактироватьКонтрагентовПришедшихССайта;	
	Настройки.Контрагенты.ИспользоватьФИОДляФизЛиц						= ИспользоватьФИОДляФизЛиц;	
	Настройки.Контрагенты.СпособИдентификацииКонтрагентов				= СпособИдентификацииКонтрагентов;	
	Настройки.Контрагенты.ГруппаДляНовыхКонтрагентов					= ГруппаДляНовыхКонтрагентов;	
	Настройки.Контрагенты.СоответствиеАдресовФизЛиц 					= СоответствиеАдресовФизЛиц.Выгрузить();
	Настройки.Контрагенты.СоответствиеАдресовЮрЛиц 						= СоответствиеАдресовЮрЛиц.Выгрузить();
	
	//Проверяем и добавляем новые поля:
	Если Настройки.Заказы.Свойство("ТочкаАктуальностиВыгрузкиДокументов") тогда
		Настройки.Заказы.ТочкаАктуальностиВыгрузкиДокументов = ТочкаАктуальностиВыгрузкиДокументов;
	Иначе
		Настройки.Заказы.Вставить("ТочкаАктуальностиВыгрузкиДокументов", ТочкаАктуальностиВыгрузкиДокументов);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("ПроводитьЕслиОтгружен") тогда
		Настройки.Заказы.ПроводитьЕслиОтгружен = ПроводитьЕслиОтгружен;
	Иначе
		Настройки.Заказы.Вставить("ПроводитьЕслиОтгружен", ПроводитьЕслиОтгружен);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("ПроводитьЕслиОплачен") тогда
		Настройки.Заказы.ПроводитьЕслиОплачен = ПроводитьЕслиОплачен;
	Иначе
		Настройки.Заказы.Вставить("ПроводитьЕслиОплачен", ПроводитьЕслиОплачен);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("ВыгрузкаОплат") тогда
		Настройки.Заказы.ВыгрузкаОплат = ВыгрузкаОплат;
	Иначе
		Настройки.Заказы.Вставить("ВыгрузкаОплат", ВыгрузкаОплат);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("ЗагружаемыеТипыОплат") тогда
		Настройки.Заказы.ЗагружаемыеТипыОплат = ЗагружаемыеТипыОплат;
	Иначе
		Настройки.Заказы.Вставить("ЗагружаемыеТипыОплат", ЗагружаемыеТипыОплат);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("ВыгружатьВсеДокументы") тогда
		Настройки.Заказы.ВыгружатьВсеДокументы = ВыгружатьВсеДокументы;
	Иначе
		Настройки.Заказы.Вставить("ВыгружатьВсеДокументы", ВыгружатьВсеДокументы);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("КоличествоДокументовВПакете") тогда
		Настройки.Заказы.КоличествоДокументовВПакете = КоличествоДокументовВПакете;
	Иначе
		Настройки.Заказы.Вставить("КоличествоДокументовВПакете", КоличествоДокументовВПакете);
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("НастройкиКомпоновкиДанныхОтгрузок") тогда
		Настройки.Заказы.НастройкиКомпоновкиДанныхОтгрузок = КомпоновщикНастроекКомпоновкиДанныхОтгрузок.ПолучитьНастройки();
	Иначе
		Настройки.Заказы.Вставить("НастройкиКомпоновкиДанныхОтгрузок", КомпоновщикНастроекКомпоновкиДанныхОтгрузок.ПолучитьНастройки());
	КонецЕсли;
	
	Если Настройки.Заказы.Свойство("НастройкиКомпоновкиДанныхОплат") тогда
		Настройки.Заказы.НастройкиКомпоновкиДанныхОплат = КомпоновщикНастроекКомпоновкиДанныхОплат.ПолучитьНастройки();
	Иначе
		Настройки.Заказы.Вставить("НастройкиКомпоновкиДанныхОплат", КомпоновщикНастроекКомпоновкиДанныхОплат.ПолучитьНастройки());
	КонецЕсли;
	
	лАдресНастроекОбмена = ПоместитьВоВременноеХранилище(Настройки, УникальныйИдентификатор);
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("АдресНастроекОбмена"	, лАдресНастроекОбмена);
	Возврат ПараметрыФормы;
	
КонецФункции

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗагрузитьССайтаПлатежныеСистемы(Команда)
	
	Сообщить("Начало загрузки платежных систем.");
	
	ЗагрузитьДанныеССайта(Истина);
	Элементы.СоответствиеПлатежныхСистемИКасс.Обновить();
	
	Сообщить("Загрузка платежных систем завершена.");

КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗагрузитьССайтаСтатусыЗаказов(Команда)
	
	Сообщить("Начало загрузки статусов для заказов.");
	
	ЗагрузитьДанныеССайта(Ложь, "Заказ");
	Элементы.СоответствиеСтатусовЗаказов.Обновить();
	
	Сообщить("Загрузка статусов для заказов завершена.");

КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаКлиенте
Процедура ЗагрузитьССайтаСтатусыОтгрузок(Команда)
	
	Сообщить("Начало загрузки статусов для отгрузок.");
	
	ЗагрузитьДанныеССайта(Ложь, "Отгрузка");
	Элементы.СоответствиеСтатусовОтгрузок.Обновить();
	
	Сообщить("Загрузка статусов для отгрузок завершена.");

КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
&НаСервере
Процедура ЗагрузитьДанныеССайта(ЭтоПлатежныеСистемы, ТипДокумента = Неопределено) 
	
	ОсновныеПараметры = Новый Структура;
	НастройкиУспешноДобавлены = Б_ОбменССайтомСервер.ДобавитьОсновныеНастройкиВПараметры(Объект, ОсновныеПараметры);
	
	НастройкиПодключения = Новый Структура;
	
	НастройкиПодключения.Вставить("ПараметрЗапросаHTTP_Инициализация", "&mode=init");
	
	ОсновныеПараметры.Вставить("НастройкиПодключения",НастройкиПодключения);	
	
	Если НЕ Б_ОбменССайтомСервер.ПолучитьНастройкиПодключения(НастройкиПодключения, ОсновныеПараметры) Тогда
		Сообщить("Не удалось получить настройки подключения. Загрузка невозможна.");
	Иначе
		
		ОтветСервера 	= "";
		ТипСоединения 	= "sale";
		Соединение 		= Неопределено;
		НастройкиПодключения = ОсновныеПараметры.НастройкиПодключения;
		
		АдресДляРаботы = НастройкиПодключения.АдресСкрипта + "?type=" + ТипСоединения; 
		
		Успешно = Б_ОбменССайтомСервер.АвторизацияВыполнена(Соединение, НастройкиПодключения, ОтветСервера, ОсновныеПараметры, ТипСоединения);
		
		Если Не Успешно Тогда
			Сообщить("Авторизация на сайт не выполнена. Загрузка невозможна.");	
			Возврат;
		КонецЕсли;
		
		КукиИмя				= СтрПолучитьСтроку(ОтветСервера, 2);
		КукиЗначение		= СтрПолучитьСтроку(ОтветСервера, 3);
		
		Попытка
			Токен			= "&" + СтрПолучитьСтроку(ОтветСервера, 4);
		Исключение
			
			Токен = "";
			Сообщить("CSRF токен не поддерживается. Для того, чтобы поддерживался - необходимо обновить БУС.");	
			
		КонецПопытки;
		
		ЗаголовкиЗапросов	= "Cookie: " + КукиИмя + "=" + КукиЗначение;
		
		Сообщить("Отправка запроса на инициализацию, для определения версии обмена данных.");
		
		ОтветСервера = Б_ОбменССайтомСервер.ПолучитьДанныеССервера(Соединение, АдресДляРаботы + "&mode=info" + Токен + "&version=" + ОсновныеПараметры.ВерсияСхемы, ЗаголовкиЗапросов, ОсновныеПараметры);
		
		Если ОтветСервера = Неопределено Тогда 
			Сообщить("Не удалось загрузить данные с сервера.");	
			Возврат;
			
		КонецЕсли;
		
		СтрокаCML = "";
		
		Если Лев(ОтветСервера, 2) = "PK" Тогда
			СтрокаCML = Б_ОбменССайтомСерверЗагрузкиДанных.РаспаковкаZIPАрхива(ОтветСервера);
		Иначе
			Если Лев(ОтветСервера, 5) = "<?xml" Тогда
				СтрокаCML = ОтветСервера;
			КонецЕсли;
		КонецЕсли;
		
		Если НЕ ЗначениеЗаполнено(СтрокаCML) Тогда
			Сообщить("Не удалось прочитать данные, загруженные с сервера.");
			Возврат;
		КонецЕсли;
		
		Если ЭтоПлатежныеСистемы тогда
			РазборИЗаписьПлатежныхСистем(ОсновныеПараметры, СтрокаCML);
		Иначе
			РазборИЗаписьСтатусов(ОсновныеПараметры, СтрокаCML,ТипДокумента);
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция РазборИЗаписьСтатусов(УзелОбмена, СтрокаCML, ТипДокумента)
		
	ЧтениеXML = Новый ЧтениеXML;
		
	Попытка
		ЧтениеXML.УстановитьСтроку(СтрокаCML);
	Исключение
		ОписаниеОшибки = ОписаниеОшибки();
		Возврат Ложь;
	КонецПопытки;
	
	Если ТипДокумента = "Заказ" тогда
		ТЧОбъекта = СоответствиеСтатусовЗаказов;	
	Иначе
		ТЧОбъекта = СоответствиеСтатусовОтгрузок;	
	КонецЕсли;
	
	тзнВрем = ТЧОбъекта.Выгрузить();
	ТЧОбъекта.Очистить();
	
	лЭтоПлатежныеСистемы= Ложь;
	лЭтоИд 				= Ложь;
	лЭтоНазвание		= Ложь;
	Пока ЧтениеXML.Прочитать() Цикл
			
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Cтатусы" тогда
			лЭтоПлатежныеСистемы = Истина;
		КонецЕсли;
		
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Cтатусы" тогда
			лЭтоПлатежныеСистемы = Ложь;
		КонецЕсли;
		
		Если лЭтоПлатежныеСистемы тогда
			
			Если ЧтениеXML.ТипУзла 	= ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Элемент" тогда
				СтруктураСтр = Новый Структура("Ид, Название, Касса")
			КонецЕсли;
			
				Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Название" тогда
					лЭтоНазвание = Истина;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Название" тогда
					лЭтоНазвание = Ложь;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Ид" тогда
					лЭтоИд = Истина;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Ид" тогда
					лЭтоИд = Ложь;
				КонецЕсли;
				
				Если лЭтоНазвание И ЧтениеXML.ТипУзла = ТипУзлаXML.Текст тогда
					СтруктураСтр.Название = ЧтениеXML.Значение;
				КонецЕсли;
				
				Если лЭтоИд И ЧтениеXML.ТипУзла = ТипУзлаXML.Текст тогда
					СтруктураСтр.Ид = ЧтениеXML.Значение;
				КонецЕсли;
			
			Если ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Элемент" тогда
				
				Результат = тзнВрем.Найти(СтруктураСтр.Ид,"ИдСтатуса");
				
				Если Результат = Неопределено тогда
						
					НовСтр = ТЧОбъекта.Добавить();
					НовСтр.ИдСтатуса 		= СтруктураСтр.Ид;
					НовСтр.НазваниеСтатуса 	= СтруктураСтр.Название;
						
				Иначе
					
					НовСтр = ТЧОбъекта.Добавить();
					НовСтр.ИдСтатуса 		= СтруктураСтр.Ид;
					НовСтр.НазваниеСтатуса 	= СтруктураСтр.Название;
					НовСтр.Статус 			= Результат.Статус;
					
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

&НаСервере
Функция РазборИЗаписьПлатежныхСистем(УзелОбмена, СтрокаCML)
		
	ЧтениеXML = Новый ЧтениеXML;
		
	Попытка
		ЧтениеXML.УстановитьСтроку(СтрокаCML);
	Исключение
		ОписаниеОшибки = ОписаниеОшибки();
		Возврат Ложь;
	КонецПопытки;
	
	тзнВрем = СоответствиеПлатежныхСистемИКасс.Выгрузить();
	
	СоответствиеПлатежныхСистемИКасс.Очистить();
	
	лЭтоПлатежныеСистемы= Ложь;
	лЭтоИд 				= Ложь;
	лЭтоНазвание		= Ложь;
	Пока ЧтениеXML.Прочитать() Цикл
			
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "ПлатежныеСистемы" тогда
			лЭтоПлатежныеСистемы = Истина;
		КонецЕсли;
		
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "ПлатежныеСистемы" тогда
			лЭтоПлатежныеСистемы = Ложь;
		КонецЕсли;
		
		Если лЭтоПлатежныеСистемы тогда
			
			Если ЧтениеXML.ТипУзла 	= ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Элемент" тогда
				СтруктураСтр = Новый Структура("ИдПлатежнойСистемы, НазваниеПлатежнойСистемы, Касса")
			КонецЕсли;
			
				Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Название" тогда
					лЭтоНазвание = Истина;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Название" тогда
					лЭтоНазвание = Ложь;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.ЛокальноеИмя = "Ид" тогда
					лЭтоИд = Истина;
				ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Ид" тогда
					лЭтоИд = Ложь;
				КонецЕсли;
				
				Если лЭтоНазвание И ЧтениеXML.ТипУзла = ТипУзлаXML.Текст тогда
					СтруктураСтр.НазваниеПлатежнойСистемы = ЧтениеXML.Значение;
				КонецЕсли;
				
				Если лЭтоИд И ЧтениеXML.ТипУзла = ТипУзлаXML.Текст тогда
					СтруктураСтр.ИдПлатежнойСистемы = ЧтениеXML.Значение;
				КонецЕсли;
			
			Если ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.ЛокальноеИмя = "Элемент" тогда
				
				Результат = тзнВрем.Найти(СтруктураСтр.ИдПлатежнойСистемы,"ИдПлатежнойСистемы");
				
				Если Результат = Неопределено тогда
						
					НовСтр = СоответствиеПлатежныхСистемИКасс.Добавить();
					НовСтр.ИдПлатежнойСистемы 		= СтруктураСтр.ИдПлатежнойСистемы;
					НовСтр.НазваниеПлатежнойСистемы = СтруктураСтр.НазваниеПлатежнойСистемы;
						
				Иначе
					
					НовСтр = СоответствиеПлатежныхСистемИКасс.Добавить();
					НовСтр.ИдПлатежнойСистемы 		= СтруктураСтр.ИдПлатежнойСистемы;
					НовСтр.НазваниеПлатежнойСистемы = СтруктураСтр.НазваниеПлатежнойСистемы;
					НовСтр.Касса 					= Результат.Касса;
					НовСтр.ЭквайринговыйТерминал 	= Результат.ЭквайринговыйТерминал;
					
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции
////////////////////////////////////////////////////////////////////////////////

&НаКлиенте
Процедура НастроитьЗагружаемыеДокументы(Команда)
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ТипДокумента"			, "СтандартныеДокументы");
	
	Если ЭтоАдресВременногоХранилища(АдресНастроекОбмена) Тогда
		
		ПараметрыФормы.Вставить("СохраненныеНастройкиЗагружаемыхДокументов", СохраненныеНастройкиЗагружаемыхДокументов);

		ОткрытьФорму("ПланОбмена.Б_ОбменССайтом.Форма.ФормаНастройкиСоответствийЗагружаемыхДокументов", ПараметрыФормы,,,,, Новый ОписаниеОповещения("НастроитьСоответствияЗагружаемогоДокументаЗавершение", ЭтотОбъект), РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);
		
		Модифицированность = Истина;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура НастроитьСоответствияЗагружаемогоДокументаЗавершение(Результат, ДополнительныеПараметры) Экспорт
    
    Если Результат = НеОпределено Тогда
        
        Возврат;
        
    КонецЕсли;

	Если ЭтоАдресВременногоХранилища(Результат) Тогда
		СохраненныеНастройкиЗагружаемыхДокументов = ПолучитьСсылкуНаНовоеВременноеХранилище(Результат);

	КонецЕсли;
    
КонецПроцедуры

&НаСервере
Функция ПолучитьСсылкуНаНовоеВременноеХранилище(СтараяСсылка)
	
	ОбновляемыеДанные = ПолучитьИзВременногоХранилища(СтараяСсылка);
	НоваяСсылка = ПоместитьВоВременноеХранилище(ОбновляемыеДанные, УникальныйИдентификатор);
	
	Возврат НоваяСсылка;
	
КонецФункции

&НаКлиенте
Процедура ВыгрузкаОтгрузокПриИзменении(Элемент)
	Элементы.ОтборыОтгрузок.Доступность = ВыгрузкаОтгрузок;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Элементы.ОтборыОтгрузок.Доступность = ВыгрузкаОтгрузок;   
	Элементы.ОтборыОплаты.Доступность 	= ВыгрузкаОплат; 
	
	Элементы.ПроводитьЕслиОтгружен.Доступность 			= ЗагрузкаОтгрузок;
	Элементы.ПроводитьЕслиОплачен.Доступность 			= ЗагрузкаОплат;
	Элементы.НастроитьТипыЗагружаемыхОплат.Доступность 	= ЗагрузкаОплат;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузкаОплатПриИзменении(Элемент)
	Элементы.ОтборыОплаты.Доступность = ВыгрузкаОплат; 
КонецПроцедуры

&НаКлиенте
Процедура НастроитьТипыЗагружаемыхОплат(Команда)
		
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("СпкНастройки", ЗагружаемыеТипыОплат);
	
	ОткрытьФорму("ПланОбмена.Б_ОбменССайтом.Форма.УстановкаНастроекСписком", ПараметрыФормы, ЭтаФорма,,,, Новый ОписаниеОповещения("НастройкаЗагружаемыхОплатЗавершение", ЭтотОбъект), РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);

КонецПроцедуры

&НаКлиенте
Процедура НастройкаЗагружаемыхОплатЗавершение(Результат, ДополнительныеПараметры) Экспорт
    
    ОтветФормы = Результат;
    
    Если ОтветФормы <> Неопределено тогда
        
		ЗагружаемыеТипыОплат = ОтветФормы;
		Модифицированность = Истина;
		
    КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузкаОтгрузокПриИзменении(Элемент)
	Элементы.ПроводитьЕслиОтгружен.Доступность 	= ЗагрузкаОтгрузок;
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузкаОплатПриИзменении(Элемент)
	Элементы.ПроводитьЕслиОплачен.Доступность 	= ЗагрузкаОплат;
	Элементы.НастроитьТипыЗагружаемыхОплат.Доступность 	= ЗагрузкаОплат;
КонецПроцедуры

&НаКлиенте
Процедура НастроитьСоответствияПлатежныхСистем(Команда)
		
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("Объект", Объект);
	ПараметрыФормы.Вставить("СоответствияПлатежныхКасс", СоответствиеПлатежныхСистемИКасс);
	
	ОткрытьФорму("ПланОбмена.Б_ОбменССайтом.Форма.УстановкаСоответствийПлатежныхСистем", ПараметрыФормы, ЭтаФорма,,,, Новый ОписаниеОповещения("УстановкаСоответствийПлатежныхСистемЗавершение", ЭтотОбъект), РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);

КонецПроцедуры


&НаКлиенте
Процедура УстановкаСоответствийПлатежныхСистемЗавершение(Результат, ДополнительныеПараметры) Экспорт
    
    ОтветФормы = Результат;
    
    Если ОтветФормы <> Неопределено тогда
		
		СоответствиеПлатежныхСистемИКасс.Очистить();
		
		Для каждого ТекСтрока из ОтветФормы Цикл
			
			НовСтрока = СоответствиеПлатежныхСистемИКасс.Добавить();
			НовСтрока.Касса 			= ТекСтрока.Касса;
			НовСтрока.Терминал 			= ТекСтрока.Терминал;
			НовСтрока.ПлатежнаяСистема 	= ТекСтрока.ПлатежнаяСистема;
			
		КонецЦикла;
		
		Модифицированность = Истина;
		
    КонецЕсли;
	
КонецПроцедуры


#КонецОбласти

