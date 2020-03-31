insert into Blogger (age,name) VALUES (21, 'Chronos');
insert into Blogger (age,name) VALUES (26, 'Spectre');
insert into STORY (title,content,posted,blogger_id) values ('Teszt cím','Teszt tartalom', CURRENT_DATE(), (select id FROM BLOGGER where name = 'Chronos') );
insert into STORY (title,content,posted,blogger_id) values ('Teszt2 cím','Teszt2 tartalom2', CURRENT_DATE(), (select id FROM BLOGGER where name = 'Chronos') );
insert into STORY (title,content,posted,blogger_id) values ('Spectre cím','Spectre tartalom', CURRENT_DATE(), (select id FROM BLOGGER where name = 'Spectre') );
insert into STORY (title,content,posted,blogger_id) values ('Spectre2 cím','Spectre2 tartalom2', CURRENT_DATE(), (select id FROM BLOGGER where name = 'Spectre') );
insert into STORY (title,content,posted,blogger_id) values ('szia','Szia tartalom2', CURRENT_DATE(), (select id FROM BLOGGER where name = 'Spectre') );