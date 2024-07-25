-- testing for asn association
insert into domain (client_id,name,is_monitored)
values(1,'www.test.com', true);

insert into asn_company (start_ip, end_ip, join_key, name, domain, type, asn, as_name, as_domain, as_type, country)
values('1.1.1.1','1.1.100.9',null,'www.test.com','www.test.com','business','AB1234','www.test.com','www.test.com','business','USA');

insert into asset_dedup (client_id, domain, domain_id)
values (1, 'www.test.com', (
    select id from domain where name = 'www.test.com'
    ));

insert into tag (name, created_by)
values ('test tag', 1),
       ('test tag 2', 1);

-- add permissions to add assets
insert into user_role_authorization_scope(authorization_scope_id, user_id, role_id, has_all_clients)
values(5, 1, 42, true);

