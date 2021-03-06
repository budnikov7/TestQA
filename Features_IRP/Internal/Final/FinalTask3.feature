#language: ru

@tree

Функционал: Финальное задание. Задача 3.

Как cтудент я хочу
проверить функционал документа Продажи 
чтобы сдать финальное задание 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка документа Продажи.
И я закрываю все окна клиентского приложения

* Создание и заполнение документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажа'
	Когда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'              |
		| 'Магазин "Бытовая техника"' |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Bosch15'      |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда не появилось окно предупреждения системы
	И я запоминаю значение поля с именем 'Номер' как 'НомерДокумента'
	И я сохраняю навигационную ссылку текущего окна в переменную "НавСсылкаДокумента"
	
* Проведение документа
	И я выполняю код встроенного языка на сервере	
		|'Документы.РасходТовара.НайтиПоНомеру("$НомерДокумента$").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	Тогда не появилось окно предупреждения системы

* Проверка движений документа
	* Взаиморасчеты
		И В командном интерфейсе я выбираю 'Продажи' 'Отчет по взаиморасчетам'
		Тогда открылось окно 'Взаиморасчеты'
		И я нажимаю на кнопку с именем 'ФормаНастройкиОтчета'
		Тогда открылось окно 'Настройки отчета "Взаиморасчеты"'
		И я перехожу к закладке с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3"
		И я удаляю все строки таблицы "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Отбор"
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ДоступныеПоляТаблица" я перехожу к строке:
			| 'Доступные поля' |
			| 'Документ'       |
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ДоступныеПоляТаблица" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Отбор" я выбираю текущую строку
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Отбор" я нажимаю кнопку выбора у реквизита с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ОтборПравоеЗначение"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я перехожу к строке:
			| ''        |
			| 'Продажа' |
		И я делаю клик по элементу клиента тестирования "ОК" 'Тип' UI Automation
		Тогда открылось окно 'Продажи товара'
		И в таблице "Список" я перехожу к строке:
			| 'Номер'    		 |
			| '$НомерДокумента$' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Настройки отчета "Взаиморасчеты"'
		И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Отбор" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
		Тогда открылось окно 'Взаиморасчеты'
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		Дано Табличный документ "Результат" равен макету "ВзаиморасчетыОтчет" по шаблону
		И я закрываю все окна клиентского приложения
			
	* Продажи
		Дано Я открываю навигационную ссылку "$НавСсылкаДокумента$"
		Когда открылось окно 'Продажа * от *'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		Тогда таблица "Список" стала равной по шаблону:
			| 'Период' | 'Регистратор'  | 'Номер строки' | 'Покупатель'                | 'Сумма'    | 'Товар'   | 'Количество' |
			| '*' 	   | '*' 			| '1'            | 'Магазин "Бытовая техника"' | '3 200,00' | 'Bosch15' | '1,00'       |
	
	* Остатки
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		Тогда таблица "Список" стала равной по шаблону:
			| 'Период'  | 'Регистратор' | 'Номер строки' | 'Склад'   | 'Товар'   | 'Количество' |
			| '*' 		| '*' 			| '1'            | 'Большой' | 'Bosch15' | '1,00'       |
	
* Проверка печатной формы расходной накладной
	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И табличный документ "SpreadsheetDocument" содержит строки из макета "ПечатнаяФормаРасходнаяНакладная" по шаблону
И я закрываю сеанс текущего клиента тестирования
	

