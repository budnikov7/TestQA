#language: ru

@tree

Функционал: Финальное задание. Задача 2.

Как cтудент я хочу
проверить формирование отчета Остатки 
чтобы сдать финальное задание 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка формирования отчета Остатки.
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Товарные запасы' 'Остатки товаров'
Тогда открылось окно 'Остатки товаров'
И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
Тогда открылось окно 'Выбор варианта отчета'
И в таблице "СписокНастроек" я перехожу к строке:
	| 'Представление'   |
	| 'Основной' 		|
И я нажимаю на кнопку с именем 'Загрузить'
И Пауза 5
И я нажимаю на кнопку с именем 'ФормаСформировать'
И я жду, что в табличном документе "Результат" ячейка "R1C1:R2C1" станет равна "Товар" в течение 5 секунд
Дано Табличный документ "Результат" равен макету "StockReport" по шаблону
И я закрываю сеанс текущего клиента тестирования


