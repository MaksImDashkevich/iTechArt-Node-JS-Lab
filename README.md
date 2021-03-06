# iTechArt-Node-JS-Lab
Pizza Delivery

Задача: разработать приложение для заказа пиццы с доставкой.

Роли: администратор и пользователь.

Технологии: JavaScript, NodeJS, Express, Jest, MySQL, MongoDB, Git.

Возможности администратора:
Войти в систему используя email/password.
Просмотреть список всех пользователей в системе.
Добавить/удалить пиццу  из системы.
Добавить/удалить описание и ингредиенты для каждой пиццы.
Добавлять промо-коды на скидку для заказов, который имеет ограниченный срок действия.
Просмотреть информацию о текущих заказах.

Возможности пользователя:
Создать аккаунт. На один email можно зарегистрировать только один аккаунт.
Войти в систему используя email/password.
Просмотреть список всех пицц. Пицца должна иметь изображение, описание и состав.
Добавлять пиццу в корзину с указанием количества.
Добавлять/удалять пиццу из корзины.
Использовать промо-код, для получения скидки.
Делать заказ. При оформлении заказа указать адрес, способ доставки, способ оплаты и комментарий к заказу.
Просматривать статус заказа.
Удалить свой аккаунт.

Реализация:											
Разработать схему базы данных, учитывая пункты 2-17.
Разработать API для добавления пиццы.
Разработать API для удаления пиццы.
Разработать API для добавления ингредиентов пиццы.
Разработать API для добавления промо-кодов к заказам.
Разработать API для просмотра списка пицц.
Разработать API для просмотра детальной информации о пиццы и ее составе.
Разработать API для добавления пиццы в корзину.
Разработать API для просмотра, редактирования и удаление пицц, находящихся в корзине в корзине.
Разработать API для добавления промо-кода к заказу для получения скидки.
Разработать API для оформления заказа.
Разработать API для просмотра списка заказов и их статусов.
Разработать API для просмотра списка всех пользователей и их заказов.
Разработать API для регистрации пользователя. Добавить ограничение: все операции (кроме авторизации и регистрации) доступны только после аутентификации.
Разработать API для удаления своего аккаунта.
Добавить роли администратор, пользователь. Настроить механизм ограничения доступа к API на стороне сервера (механизм авторизации). Для доступа к списку пицц, добавления  пицц в корзину, просмотра, редактирования и удаления пицц из корзины, добавления промо-кода к заказу, оформления заказа, просмотра своих заказов и на удаление своего аккаунта должна быть роль пользователя. 
Для доступа к управлению пользователями, добавлению/удалению пицц, добавлению ингредиентов пицц, добавлению промо-кодов и просмотра заказов пользователей должна быть роль администратора. 
Покрыть юнит тестами серверную часть, отвечающую  за управление пользователем своей корзиной (просмотр, добавление, редактирование, удаление пицц из корзины).  Для написания тестов использовать фреймворк Jest. 
Добавить в приложение валидацию на стороне сервера.
Добавить в приложение работу с файлами. Изображение пиццы должны храниться в папке на сервере, но при этом должна запись о их местоположении в БД (ссылка). 
Реализовать механизм транзакций для удаления пиццы. Удаляем пиццу, далее, если изображение пиццы не удаляется, то делаем откат и посылаем соответствующее сообщение.
Добавить пагинацию на стороне сервера для страниц со списками пользователей, пицц и заказов.
Реализовать 2 ендпоинта для аналитики без использования ORM. Задача первого - найти пиццу, которая за выбранный месяц чаще всего заказывалась (не просто добавленные в корзину, а именно прикрепленные уже к заказу).  Задача второго - найти пользователей,  у  которых средний показатель среднего чека по заказам (для пользователей, которые сделали не меньше 3 заказов)  >= чем среднее значение среднего чека по заказам среди всех пользователей.

Дополнительные требования:
Добавить рассылку email уведомлений при удалении и регистрации аккаунта.
Реализовать автоматическое удаление пицц, которые не заказывались более 1 месяца.
Предусмотреть функционал редактирования профиля (First Name, Last Name) и смены пароля.
Добавить возможность поиска пользователей (по имени и фамилии).
Добавить логирование. Логи должны сохраняться в MongoDB. В логи должны сохраняться ошибки, а также справочная информация.
Разработать гибкую/модульную систему уведомлений – в email критические ошибки.

Rockstar требования:
Разработать гибкую/модульную систему уведомлений – в telegram.
Добавить уровень абстракции позволяющий моментально переключиться на другую БД, например с PostgreSQL на MongoDB.
Добавить в приложение работу с Docker. Каждая часть приложения (база данных, микросервис, очередь сообщений и т.д.) должна быть помещена в отдельный контейнер. Работа с docker-контейнерами ведётся с помощью docker-compose.
Реализовать минимальный CI process с помощью GitHub Actions. Работу с репозиторием необходимо вести в отдельной ветке для каждой задачи. При попытке сделать git push в master ветку, автоматически запускаются тесты. При неудачном завершении - сообщение об ошибке.
Разбить приложение на микросервисы. Между собой микросервисы должны общаться с помощью RabbitMQ.
Добавить возможность полнотекстового поиска по описаниям локаций с использованием ElasticSearch.
