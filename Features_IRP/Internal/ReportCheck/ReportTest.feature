#language: ru

@tree

Функционал: Тестирование отчетов
Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Тестирование отчетов
Когда Экспорт основных данных
Когда экспорт документов закупок
И я выполняю код встроенного языка на сервере
"""bsl
	Документы.PurchaseOrder.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	Документы.PurchaseOrder.НайтиПоНомеру("2").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	Документы.PurchaseOrder.НайтиПоНомеру("3").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	Документы.PurchaseInvoice.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	Документы.PurchaseInvoice.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
"""