﻿#language: ru

@tree

Функционал: Проверка работы отчета Остатки товаров

Как Тестировщик я хочу проверить работу отчета Остатки товаров


Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: Проверка работы отчета Остатки товаров

* Выбираем основной вариант отчета по условию задачи. 
	И Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление' |
		| 'Основной'      |
	И я нажимаю на кнопку с именем 'Загрузить'

	
* Проверка отчета без группировок
	Когда открылось окно 'Остатки товаров'
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент1Использование'
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Использование'
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент6Использование'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R3C2' в течение 5 секунд	
	

* Проверка отчета с группировкой по складу
	Когда открылось окно 'Остатки товаров'
	И я устанавливаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Использование'
	И из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение" я выбираю точное значение 'Большой'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R6C2' в течение 5 секунд	