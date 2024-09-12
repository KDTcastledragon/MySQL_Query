
drop table product;

create table product (
   product_code Int Auto_increment Primary key,
   protype varchar(2) not null default 1,
   domestic varchar(2),
   writer varchar(30),
   title Varchar(100) Not null,
   translator Varchar(30),
   publisher Varchar(30) Not null,
   publish_date varchar(20) Not null,
   category Varchar(20),
   genre Varchar(10),
   summary Varchar(1000),
   image Varchar(2000),
   intro_image Varchar(2000),
   content Varchar(1000),
   price Int Not null,
   stack Int not null,
   sellcount int not null default 0,
   gradeavg double,
   viewcount int,
   regdate varchar(20),
   moddate varchar(20)
);

insert into product(protype, domestic, writer, title, translator, publisher, publish_date, category, genre, summary, image, intro_image, content, price, stack, sellcount, gradeavg, viewcount)
values(1, 2, '진짜된다고?', '진짜된다고?', '', '씨엘비북스', '2020-06-20', 'novel', 'melo', '유',
 'gakgakseason.jpg', 'gakgakseason.jpg', '1. 봄<br/>2. 여름<br/>3. 가을<br/>4. 그에게는 봄', 22000, 1000, 4239, 0, 0);

insert into product(protype, domestic, writer, title, translator, publisher, publish_date, category, genre, summary, image, intro_image, content, price, stack, sellcount, gradeavg, viewcount)
values(1, 2, '왜되는거야', '왜되는거야', '', '문학동네', '2021-06-20', 'novel', 'melo', '최은영의 세번째 ','littlelight.jpg', 'littlelight.jpg', '', 17910, 100, 129, 0, 0);

insert into product(protype, domestic, writer, title, translator, publisher, publish_date, category, genre, summary, image, intro_image, content, price, stack, sellcount, gradeavg, viewcount)
values(1, 1, '나도 모르겠어', '나도 모르겠어', '', '문학동네', '2021-06-20', 'novel', 'melo', '불행'
,'bicomeshop.jpg', 'bicomeshop.jpg', '', 15120, 100, 2789, 0, 0);

insert into product(protype, domestic, writer, title, translator, publisher, publish_date, category, genre, summary, image, intro_image, content, price, stack, sellcount, gradeavg, viewcount)
values(1, 3, '하아', '하아', '이도우', '수박설탕', '2019-03-12', 'novel', 'melo', '카네기상, 안데르센상에 빛나는 엘리너 파전의 클래식 명작 『작은 책방』을 소설가 이도우가 공들여 우리말로 옮겼다. ', 'bookstore.jpg'
, 'bookstore_intro.jpg', '일곱 번째 공주<br/>금붕어<br/>레몬 빛깔 강아지<br/>모란앵무<br/>왕과 보리밭<br/>작은 재봉사', 18000, 100, 564, 0, 0);


