# DB-Bus-Station-project
База от данни за автогара
Изготвил: Йончо Йончев, ФН: 72065
1. Обхват на модела. Дефиниране на задачата.
Базата от данни за автогарата, ще съхранява информация за
данните на автогарата. Автогарата е разположена в град. 
Агенцията работи с билети, за които пази информация. Билетите  могат да бъдат два вида – нормални или намалени . На автогарата работят касиери  и шофьори.
Те се определят еднозначно по служебен номер. За касиерите  и шофьори се пази информация за служебен номер, телефонен номер и имена на служителя.
Всеки касиер отговаря за определена каса, а всеки шофьор за определен автобус.
Билетите в себе си съдържат дата и час, място и дали е нормален или намален.Автогарата  разполага и с разписание в което пише кога автобусите  тръгват , кога пристигат и къде отиват.
Всеки автобус съдържа в себе си с колко места разполага, името на шофьора и за къде пътува. 
В автогарите има и каси, за която се знае кой и е касиера.
Има и пътници като за тях се знае дали имат билет или не.


2. Множества от същности и техните атрибути
  •	Автогара-  местоположение
  •	Разписание- списък с отиващи и заминаващи
  •	Каси- номер на касата, касиер
  •	Касиери-  служебен номер, телефонен номер, име, номера на касата на която работи
  •	Билети- място, дата-час,  направление,  вид
  •	Автобуси- номер на автобуса, шофьор, направление, места 
  •	Шофьори- служебен номер, телефонен номер, име, номера на автобуса на който работи
  •	Пътник-  дали разполага с билет
3.Домейн на атрибутите
  •	Автогара-  местоположение:  низ
  •	Разписание- списък с отиващи и заминаващи: низ
  •	Каси- номер на касата: цяло положително число, касиер: низ
  •	Касиери-  служебен номер: цяло положително число, телефонен номер: низ, име: низ, номера на касата на която работи: цяло положително число
  •	Билети- място: цяло положително число, дата-час: низ,  направление: низ,  вид: низ
  •	Автобуси- номер на автобуса: цяло положително число, шофьор: низ, направление: низ, места: цяло положително число
  •	Шофьори- служебен номер: цяло положително число, телефонен номер: низ,  име: низ,  номера на автобуса на който работи: цяло положително число
  •	Пътник-  дали разполага с билет : цяло число (0 или 1)
4. Връзки
  •	Автогарата има много служители, каси и автобуси, но те принадлежат към една автогара.
  •	Една автогара има едно разписание и едно разписание има една автогара
  •	Една каса има един касиер и един касиер има една каса
  •	Касиерите могат да продават много билети , но билета може да бъде продаден от един касиер 
  •	Един билет има един пътник и един пътник може да има  един билет
  •	Автобусите имат много пътници, но един пътник може да се вози в един автобус  
  •	Шофьорите имат един автобус и автобусите имат един шофьор
5. Ограничения по единствена стойност, референтна цялостност и друг тип ограничения
  •	Каси- номер на касата: еднозначно определя касата
  •	Касиери-  служебен номер: еднозначно определя касиера
  •	Билети- место: еднозначно определя билета
  •	Автобуси- номер на автобуса: еднозначно определя автобуса 
  •	Шофьори- служебен номер: еднозначно определя шофьора

