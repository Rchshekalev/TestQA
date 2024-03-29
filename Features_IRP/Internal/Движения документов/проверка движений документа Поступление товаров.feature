﻿#language: ru

@tree
@ДвиженияДокументов
Функционал: проверка движений документа Поступление товаров

Как тестировщик я хочу
проверить движения документа Поступление товаров 
чтобы убедиться что документ делает движения по нужным регистрам 

Сценарий: _0501 подготовительный сценарий (движения документа Поступление товаров) 
	когда экспорт основных данных
	когда загрузка документа поступление товаров и услуг 
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	Тогда в таблице "List" я выделяю все строки
	И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'
	Тогда не появилось окно предупреждения системы
	И я выполняю код встроенного языка на сервере
	"""bsl
		Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	"""
Сценарий: Проверка движений по регистру R1001 Закупки
И я закрываю все окна клиентского приложения
Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
Тогда открылось окно 'Поступления товаров и услуг'
И в таблице "List" я перехожу к строке:
	| 'Номер' |
	| '1 001' |
И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
Тогда открылось окно 'Движения документа'
И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
И я нажимаю на кнопку с именем 'GenerateReport'
Тогда табличный документ "ResultTable" равен:
	| 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
	| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
	| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
	| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
	| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
	| ''                                                         | '19.01.2023 17:42:54' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Услуга'                  | 'e62704d1-4787-4043-98e6-fd34b5ef226c' | 'Да'                |
	| ''                                                         | '19.01.2023 17:42:54' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Услуга'                  | 'e62704d1-4787-4043-98e6-fd34b5ef226c' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Услуга'                  | 'e62704d1-4787-4043-98e6-fd34b5ef226c' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Услуга'                  | 'e62704d1-4787-4043-98e6-fd34b5ef226c' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Услуга'                  | 'e62704d1-4787-4043-98e6-fd34b5ef226c' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Товар без характеристик' | '46253552-240c-4989-b3f6-41cbebde84ff' | 'Да'                |
	| ''                                                         | '19.01.2023 17:42:54' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Товар без характеристик' | '46253552-240c-4989-b3f6-41cbebde84ff' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Товар без характеристик' | '46253552-240c-4989-b3f6-41cbebde84ff' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Товар без характеристик' | '46253552-240c-4989-b3f6-41cbebde84ff' | 'Нет'               |
	| ''                                                         | '19.01.2023 17:42:54' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | 'Товар без характеристик' | '46253552-240c-4989-b3f6-41cbebde84ff' | 'Нет'               |
И я закрываю все окна клиентского приложения

Сценарий: Проверка движений по регистру R1021 Взаиморасчеты с поставщиками
И я закрываю все окна клиентского приложения
Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
Тогда открылось окно 'Поступления товаров и услуг'
И в таблице "List" я перехожу к строке:
	| 'Номер' |
	| '1 001' |
И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
Тогда открылось окно 'Движения документа'
И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
И я нажимаю на кнопку с именем 'GenerateReport'
Тогда табличный документ "ResultTable" равен:
	| 'Поступление товаров и услуг 1 001 от 19.01.2023 17:42:54' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
	| 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
	| 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
	| ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
	| ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
	| ''                                                         | 'Приход'      | '19.01.2023 17:42:54' | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
	| ''                                                         | 'Приход'      | '19.01.2023 17:42:54' | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	| ''                                                         | 'Приход'      | '19.01.2023 17:42:54' | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	| ''                                                         | 'Приход'      | '19.01.2023 17:42:54' | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	| ''                                                         | 'Приход'      | '19.01.2023 17:42:54' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
И я закрываю все окна клиентского приложения
		