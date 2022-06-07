USE ums;


INSERT INTO users (id, name, password, email, registration)
VALUES (1, 'Karen21', '123', 'karen@gmailcom','02-17-2019');

INSERT INTO users (id, name, password, email, registration)
VALUES (2, 'Bob65', '234', 'Bob@gmail.com','02-18-2019');

INSERT INTO users (id, name, password, email, registration)
VALUES (3, 'Josh78', '345', 'Josh@gmail.com', '02-19-2019');


INSERT INTO roles (id, name, description)
VALUES (1, 'Producer', 'posting messages');

INSERT INTO roles (id, name, description)
VALUES (2, 'Subscriber', 'reading messages');


INSERT INTO user_roles (user_id, role_id)
VALUES (1, 1);

INSERT INTO user_roles (user_id, role_id)
VALUES (2, 2);

INSERT INTO user_roles (user_id, role_id)
VALUES (3, 2);



USE messaging;

INSERT INTO producers (producer_id, first_name, last_name)
VALUES (1, 'Karen', 'Lopez');


INSERT INTO message (id, producer_id, content, timestamp)
VALUES (1, 1, 'hey guys', '2022-12-12 06:00:01');

INSERT INTO message (id, producer_id, content, timestamp)
VALUES (2, 1, 'whats up', '2022-12-12 07:00:01');

INSERT INTO message (id, producer_id, content, timestamp)
VALUES (3, 1, 'this is your girl karen', '2022-12-12 08:00:01');

INSERT INTO message (id, producer_id, content, timestamp)
VALUES (4, 1, 'just checkin in on ya', '2022-12-12 09:00:01');

INSERT INTO message (id, producer_id, content, timestamp)
VALUES (5, 1, 'yeah yeah yeah', '2022-12-12 10:00:01');


INSERT INTO subscription (id, subscriber_id, producer_id)
VALUES (1, 2, 1);

INSERT INTO subscription (id, subscriber_id, producer_id)
VALUES (2, 3, 1);