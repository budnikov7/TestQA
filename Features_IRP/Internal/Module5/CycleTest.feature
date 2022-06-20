#language: ru

@tree

Функционал: <описание фичи>

Как Тестировщик я хочу
создать большое количество элементов номенклатуры 
чтобы проверить работу системы под нагрузкой 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание номенклатуры
И Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
И Я запоминаю значение выражения '1' в переменную "Счетчик"
И я делаю 10 раз
	И Я запоминаю значение выражения '"Номенклатура " + $Счетчик$' в переменную "Наименование"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                           	  | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' 	   | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 										  | ''       | ''       | ''            | ''               | ''                 | '$Наименование$'     | ''       		  |          |          |          |          |         |
	И Я запоминаю значение выражения '$Счетчик$ + 1' в переменную "Счетчик"
