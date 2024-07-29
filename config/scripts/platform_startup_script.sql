-- testing for asn association
insert into domain (client_id, name, is_monitored)
select 1, 'www.test.com', true
where not exists (
    select 1 from domain where client_id = 1 and name = 'www.test.com'
);

insert into asn_company (start_ip, end_ip, join_key, name, domain, type, asn, as_name, as_domain, as_type, country)
select '1.1.1.1', '1.1.100.9', null, 'www.test.com', 'www.test.com', 'business', 'AB1234', 'www.test.com', 'www.test.com', 'business', 'USA'
where not exists (
    select 1 from asn_company where start_ip = '1.1.1.1' and end_ip = '1.1.100.9' and name = 'www.test.com'
);

insert into asset_dedup (client_id, domain, domain_id)
select 1, 'www.test.com', (
    select id from domain where name = 'www.test.com'
)
where not exists (
    select 1 from asset_dedup where client_id = 1 and domain = 'www.test.com'
);

insert into tag (name, created_by, client_id)
select 'test tag', 1, 1
where not exists (
    select 1 from tag where name = 'test tag' and created_by = 1 and client_id = 1
);

insert into tag (name, created_by, client_id)
select 'test tag 2', 1, 1
where not exists (
    select 1 from tag where name = 'test tag 2' and created_by = 1 and client_id = 1
);

-- add permissions to add assets
insert into user_role_authorization_scope (authorization_scope_id, user_id, role_id, has_all_clients)
select (select id from authorization_scope where name = 'AuthScope_1_null_1'), 1, 42, true
where not exists (
    select 1 from user_role_authorization_scope where authorization_scope_id = (select id from authorization_scope where name = 'AuthScope_1_null_1') and user_id = 1 and role_id = 42
);

