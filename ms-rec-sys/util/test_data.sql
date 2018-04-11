-- Test users data:
--   1, 2 like JS;
--   3, 4 like Literature;
insert into users(id, cluster_id) values (1, 0);
insert into users(id, cluster_id) values (2, 0);
insert into users(id, cluster_id) values (3, 0);
insert into users(id, cluster_id) values (4, 0);

insert into user_tags(id, javascript, literature) values (1, 40, 10);
insert into user_tags(id, javascript, literature) values (2, 20, 0);
insert into user_tags(id, javascript, literature) values (3, 0, 60);
insert into user_tags(id, javascript, literature) values (4, 10, 50);


-- Test articles data:
--   1, 2, 3 are about JS
--   4, 5, 6 are about Literature
insert into articles(id, body_json)
values (1, '{"link":"http://www.bbc.com/sport/golf/43634645","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/01E8/production/_100688400_tiger_reuters.jpg","subtitle":"News about JS # 1","source":{"link":"https://techcrunch.com","name":"TechCrunch","icon":"http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg"},"title":"Masters: Tiger Woods, Rory McIlroy, Justin Rose tee times announced"}');
insert into articles(id, body_json)
values (2, '{"link":"http://www.bbc.com/sport/cricket/43624239","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/12DF0/production/_100669277_englandfield_getty.jpg","subtitle":"New Zealand held their nerve to secure a dramatic draw against England in the second Test in Christchurch and claim a 1-0 series victory.","source":{"link":"http://bbc.com","name":"BBC","icon":"http://icons.iconarchive.com/icons/martz90/circle/512/bbc-news-icon.png"},"title":"News about JS # 2"}');
insert into articles(id, body_json)
values (3, '{"link":"http://www.bbc.com/sport/tennis/43613957","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/17ABB/production/_100655969_isner_reuters.jpg","subtitle":"American John Isner won his first ever Masters 1,000 title with a 6-7 (4-7) 6-4 6-4 victory over German Alexander Zverev in the Miami Open final.","source":{"link":"https://techcrunch.com","name":"TechCrunch","icon":"http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg"},"title":"News about JS # 3"}');
insert into articles(id, body_json)
values (4, '{"link":"http://www.bbc.com/sport/golf/43634645","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/01E8/production/_100688400_tiger_reuters.jpg","subtitle":"Four-time winner Tiger Woods will be among the early starters when the Masters at Augusta begins on Thursday.","source":{"link":"https://techcrunch.com","name":"TechCrunch","icon":"http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg"},"title":"News about Literature #4"}');
insert into articles(id, body_json)
values (5, '{"link":"http://www.bbc.com/sport/cricket/43624239","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/12DF0/production/_100669277_englandfield_getty.jpg","subtitle":"New Zealand held their nerve to secure a dramatic draw against England in the second Test in Christchurch and claim a 1-0 series victory.","source":{"link":"http://bbc.com","name":"BBC","icon":"http://icons.iconarchive.com/icons/martz90/circle/512/bbc-news-icon.png"},"title":"News about Literature #5"}');
insert into articles(id, body_json)
values (6, '{"link":"http://www.bbc.com/sport/tennis/43613957","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/17ABB/production/_100655969_isner_reuters.jpg","subtitle":"American John Isner won his first ever Masters 1,000 title with a 6-7 (4-7) 6-4 6-4 victory over German Alexander Zverev in the Miami Open final.","source":{"link":"https://techcrunch.com","name":"TechCrunch","icon":"http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg"},"title":"News about Literature #6"}');

insert into article_tags(id, javascript, literature) values (1, 1, 0);
insert into article_tags(id, javascript, literature) values (2, 1, 0);
insert into article_tags(id, javascript, literature) values (3, 1, 0);
insert into article_tags(id, javascript, literature) values (4, 0, 1);
insert into article_tags(id, javascript, literature) values (5, 0, 1);
insert into article_tags(id, javascript, literature) values (6, 0, 1);