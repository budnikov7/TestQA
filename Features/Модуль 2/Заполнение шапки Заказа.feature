﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild
Функционал: Заполнение шапки документа Заказ

Сценарий: Заполнение шапки документа Заказ

* Заполнение шапки
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
	