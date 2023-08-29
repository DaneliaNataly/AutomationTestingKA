﻿
#language: ru

@tree

Функциональность: Дымовые тесты - Документы - Запись
# Конфигурация: 1С:Комплексная автоматизация 2 + Модуль 1C:CRM 3
# Версия: 2.4.6.189

Контекст:
	Дано я подключаю TestClient "Администратор" логин "Данелия_Наталья" пароль "K*/7Vr9v7pdr"


Сценарий: Запись элемента документа "Закрытие заказов поставщикам" (LAD_ЗакрытиеЗаказовПоставщикам)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос3232(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.LAD_ЗакрытиеЗаказовПоставщикам КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен
				|УПОРЯДОЧИТЬ ПО
				|	ТекДанныеИсточник.Дата УБЫВ");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующиего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем существующий элемент
			И я жду открытия окна '$ЗаголовокФормы$' в течение 30 секунд
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Пересчитаем существующий элемент
			И я жду открытия окна '$ЗаголовокФормы$' в течение 30 секунд
			Если элемент формы с именем 'ФормаПеречитать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПеречитать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Помечаем на удаление существующий элемент
			И я жду открытия окна '$ЗаголовокФормы$' в течение 30 секунд
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Если открылось окно '1С:Предприятие' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Снимаем пометку на удаление с существующего элемента
			И я жду открытия окна '$ЗаголовокФормы$' в течение 30 секунд
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Если открылось окно '1С:Предприятие' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Проведем документ
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПровести' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПровести'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось провести элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось провести элемент документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Отменим проведение документа
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаОтменаПроведения' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось отменить проведение документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось отменить проведение документа LAD_ЗакрытиеЗаказовПоставщикам"

		* Проведем и закроем документ
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПровестиИЗакрыть' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось провести и закрыть элемент документа LAD_ЗакрытиеЗаказовПоставщикам"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось провести и закрыть элемент документа LAD_ЗакрытиеЗаказовПоставщикам"



