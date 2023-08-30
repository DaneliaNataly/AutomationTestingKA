﻿
#language: ru

@tree

Функциональность: Дымовые тесты - Документы - ВводНаОсновании
# Конфигурация: 1С:Комплексная автоматизация 2 + Модуль 1C:CRM 3
# Версия: 2.4.6.189

Контекст:
	//Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Дано я подключаю TestClient "Администратор" логин "Данелия_Наталья" пароль "K*/7Vr9v7pdr"


Сценарий: ВводНаОсновании элемента документа "Заявка на выдачу товара самовывозом" (toledo_ЗаявкаНаВыдачуТовараСамовывозом)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.toledo_ЗаявкаНаВыдачуТовараСамовывозом КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|УПОРЯДОЧИТЬ ПО
				| ТекДанныеИсточник.Дата УБЫВ
				|	");
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ПриходныйКассовыйОрдер
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_CC3F3BBA6290A5978C561DAE2C60629D' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_CC3F3BBA6290A5978C561DAE2C60629D'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПриходныйКассовыйОрдер на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ВозвратТоваровОтКлиента
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_9ED04CEF0DFC91261A2D1509EB96FC19' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_9ED04CEF0DFC91261A2D1509EB96FC19'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ВозвратТоваровОтКлиента на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ВозвратТоваровОтКлиента на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ ЭквайринговаяОперация
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_E54F2A84C198E9F47C87A6FE927795F4' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_E54F2A84C198E9F47C87A6FE927795F4'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ЭквайринговаяОперация на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ЭквайринговаяОперация на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании БизнесПроцесс
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_268BED680E65B72EE667FEBE1FFA8036' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_268BED680E65B72EE667FEBE1FFA8036'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести БизнесПроцесс на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести БизнесПроцесс на основании документа toledo_ЗаявкаНаВыдачуТовараСамовывозом"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

Сценарий: ВводНаОсновании элемента документа "Заявка на доставку" (toledo_ЗаявкаНаДоставку)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.toledo_ЗаявкаНаДоставку КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен
				|УПОРЯДОЧИТЬ ПО
				| ТекДанныеИсточник.Дата УБЫВ");
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа toledo_ЗаявкаНаДоставку"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа toledo_ЗаявкаНаДоставку"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ toledo_Претензия
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_B150987305B6314BD49BC0AEA0E72758' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_B150987305B6314BD49BC0AEA0E72758'
				Тогда открылось окно ''
				И в таблице "" я выбираю текущую строку	
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_Претензия на основании документа toledo_ЗаявкаНаДоставку" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_Претензия на основании документа toledo_ЗаявкаНаДоставку"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'

		* Введем на основании Документ toledo_ЗаявкаНаРазгрузкуПогрузку
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_AAED82324904D6D966E0C667C7EA9C5C' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_AAED82324904D6D966E0C667C7EA9C5C'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_ЗаявкаНаРазгрузкуПогрузку на основании документа toledo_ЗаявкаНаДоставку" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_ЗаявкаНаРазгрузкуПогрузку на основании документа toledo_ЗаявкаНаДоставку"
				Тогда открылось окно 'Помощник создания ЗНР'
				// И в таблице "ДокументыЗНР" я активизирую поле с именем "ДокументыЗНРВыбрать"
				// И в таблице "ДокументыЗНР" я устанавливаю флаг с именем 'ДокументыЗНРВыбрать'				
				// И в таблице "ДокументыЗНР" я нажимаю на кнопку с именем 'ДокументыЗНРСоздатьУдалитьДокументы'								
				И Я закрываю окно 'Помощник создания ЗНР'

		* Введем на основании Документ toledo_ЗаявкаНаДоверенность
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_346A12538D969BD09EC609C48BBC4B8F' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюСоздатьНаОснованииОбычное_Авто_346A12538D969BD09EC609C48BBC4B8F'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_ЗаявкаНаДоверенность на основании документа toledo_ЗаявкаНаДоставку" 
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ toledo_ЗаявкаНаДоверенность на основании документа toledo_ЗаявкаНаДоставку"
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'