﻿
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура УдалитьВсеЗаписи(Команда)
	
	УдалитьВсе();
	ЭтаФорма.Элементы.Список.Обновить();
	
КонецПроцедуры

&НаСервере
Процедура УдалитьВсе()
	
	Выборка = РегистрыСведений.Б_ПакетныйОбмен.Выбрать();
	
	Пока выборка.Следующий() Цикл
		Выборка.ПолучитьМенеджерЗаписи().Удалить();	
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти
