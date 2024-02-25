# HW3_DB
HW3 of DB course

# Задание
Дано два csv-файла с данными о клиентах (customer.csv) и их транзакциях (transaction.csv). Необходимо выполнить следующие пункты:  
Создать таблицы со следующими структурами и загрузить данные из csv-файлов (описание приведено ниже);  
Выполнить следующие запросы:  
Вывести распределение (количество) клиентов по сферам деятельности, отсортировав результат по убыванию количества. — (1 балл)  
Найти сумму транзакций за каждый месяц по сферам деятельности, отсортировав по месяцам и по сфере деятельности. — (1 балл)  
Вывести количество онлайн-заказов для всех брендов в рамках подтвержденных заказов клиентов из сферы IT. — (1 балл)  
Найти по всем клиентам сумму всех транзакций (list_price), максимум, минимум и количество транзакций, отсортировав результат по убыванию суммы транзакций и количества клиентов. Выполните двумя способами: используя только group by и используя только оконные функции. Сравните результат. — (2 балла)  
Найти имена и фамилии клиентов с минимальной/максимальной суммой транзакций за весь период (сумма транзакций не может быть null). Напишите отдельные запросы для минимальной и максимальной суммы. — (2 балла)  
Вывести только самые первые транзакции клиентов. Решить с помощью оконных функций. — (1 балл)  
Вывести имена, фамилии и профессии клиентов, между транзакциями которых был максимальный интервал (интервал вычисляется в днях) — (2 балла).    


# Решение

Скрипт решения [HW3_Script.sql](https://github.com/yar21023/HW3_DB/blob/main/HW3_Script.sql)  
* Вывести распределение (количество) клиентов по сферам деятельности, отсортировав результат по убыванию количества.  
![HW3_t1.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t1.JPG)  
* Найти сумму транзакций за каждый месяц по сферам деятельности, отсортировав по месяцам и по сфере деятельности.   
![HW3_t2.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t2.JPG)  
* Вывести количество онлайн-заказов для всех брендов в рамках подтвержденных заказов клиентов из сферы IT.   
![HW3_t3.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t1.JPG)   
* Найти по всем клиентам сумму всех транзакций (list_price), максимум, минимум и количество транзакций, отсортировав результат по убыванию суммы транзакций и количества клиентов. Выполните двумя способами: используя только group by и используя только оконные функции. Сравните результат.
![HW3_t4_1.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t4_1.JPG)
Результаты совпадают
![HW3_t4_2.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t4_2.JPG) 
* Найти имена и фамилии клиентов с минимальной/максимальной суммой транзакций за весь период (сумма транзакций не может быть null). Напишите отдельные запросы для минимальной и максимальной суммы. .  
![HW3_t5_1.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t5_1.JPG)  
![HW3_t5_2.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t5_2.JPG)  
* Вывести только самые первые транзакции клиентов. Решить с помощью оконных функций.  
![HW3_t6.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t6.JPG)  
* Вывести имена, фамилии и профессии клиентов, между транзакциями которых был максимальный интервал (интервал вычисляется в днях) 
![HW3_t7.JPG](https://github.com/yar21023/HW3_DB/blob/main/HW3_t7.JPG)
