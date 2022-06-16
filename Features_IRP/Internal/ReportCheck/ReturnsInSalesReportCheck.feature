﻿#language: ru

@tree

Функционал: Проверка отображения возврата товаров в отчете по продажам

Как Менеджер по продажам я хочу
видеть в отчете по продажам отображение возвратов от покупателей 
чтобы понимать полную картину по продажам 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка отображения возврата товаров в отчете по продажам

* Создание документа Реализация товаров
	И В командном интерфейсе я выбираю 'Продажи' 'Реализации товаров и услуг'
	Тогда открылось окно 'Реализации товаров и услуг'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Реализация товаров и услуг (создание)'
	И я перехожу к закладке с именем "GroupOther"
	Когда открылось окно 'Реализация товаров и услуг (создание)'
	И в поле с именем 'Number' я ввожу текст '0'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button0'
	И в поле с именем 'Number' я ввожу текст '1 002'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Наименование'            |
		| 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
	Тогда открылось окно 'Номенклатура'
	И в таблице "List" я перехожу к строке:
		| 'Ссылка'                   |
		| 'Товар с характеристиками' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItemKey"
	Тогда открылось окно 'Характеристики'
	И в таблице "List" я перехожу к строке:
		| 'Номенклатура'             | 'Характеристика' |
		| 'Товар с характеристиками' | 'XS/Черный'      |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" в поле с именем 'ItemListQuantity' я ввожу текст '3,000'
	И в таблице "ItemList" в поле с именем 'ItemListPrice' я ввожу текст '1 000,00'
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Реализация товаров и услуг (создание) *' в течение 20 секунд
	
* Проверка отображения реализации в отчете по продажам
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	Когда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	Тогда табличный документ "Result" равен по шаблону:
		| 'Параметры:'               | 'Период: *'                          						       | ''         | ''                  | ''             |
		| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "ru наименование не заполнено"' | ''         | ''                  | ''             |
		| ''                         | ''                                                                  | ''         | ''                  | ''             |
		| 'Период, месяц'            | 'Итого'                                                             | ''         | ''                  | ''             |
		| 'Номенклатура'             | ''                                                                  | ''         | ''                  | ''             |
		| 'Характеристика'           | 'Количество'                                                        | 'Сумма'    | 'Сумма без налогов' | 'Сумма скидки' |
		| '*'       		         | '3,000'                                                             | '3 000,00' | '2 500,00'          | ''             |
		| 'Товар с характеристиками' | '3,000'                                                             | '3 000,00' | '2 500,00'          | ''             |
		| 'XS/Черный'                | '3,000'                                                             | '3 000,00' | '2 500,00'          | ''             |
		| 'Итого'                    | '3,000'                                                             | '3 000,00' | '2 500,00'          | ''             |

* Создание документа Возврат товаров
	И В командном интерфейсе я выбираю 'Продажи' 'Реализации товаров и услуг'
	Тогда открылось окно 'Реализации товаров и услуг'
	И в таблице "List" я перехожу к строке:
		| 'Номер' |
		| '1 002'     |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Реализация товаров и услуг * от *'
	И я нажимаю на кнопку с именем 'FormDocumentSalesReturnGenerate'
	Когда открылось окно 'Добавить строки из документов основания'
	И я нажимаю на кнопку с именем 'FormOk'
	Тогда открылось окно 'Возврат товаров от покупателя (создание)'
	И в таблице "ItemList" я выбираю текущую строку
	И в таблице "ItemList" в поле с именем 'ItemListQuantity' я ввожу текст '2,000'
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Возврат товаров от покупателя (создание) *' в течение 20 секунд

* Проверка отображения возврата товаров в отчете по продажам
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	Когда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	Тогда табличный документ "Result" равен по шаблону:
		| 'Параметры:'               | 'Период: *'                                						   | ''         | ''                  | ''             |
		| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "ru наименование не заполнено"' | ''         | ''                  | ''             |
		| ''                         | ''                                                                  | ''         | ''                  | ''             |
		| 'Период, месяц'            | 'Итого'                                                             | ''         | ''                  | ''             |
		| 'Номенклатура'             | ''                                                                  | ''         | ''                  | ''             |
		| 'Характеристика'           | 'Количество'                                                        | 'Сумма'    | 'Сумма без налогов' | 'Сумма скидки' |
		| '*'       		         | '1,000'                                                             | '1 000,00' | '833,33'         	  | ''             |
		| 'Товар с характеристиками' | '1,000'                                                             | '1 000,00' | '833,33'	          | ''             |
		| 'XS/Черный'                | '1,000'                                                             | '1 000,00' | '833,33'	          | ''             |
		| 'Итого'                    | '1,000'                                                             | '1 000,00' | '833,33'	          | ''             |
