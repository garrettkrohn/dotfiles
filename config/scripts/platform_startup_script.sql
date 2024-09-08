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

-- add permissions to Tasks / task templates
insert into user_role_authorization_scope (authorization_scope_id, user_id, role_id, has_all_clients)
select (select id from authorization_scope where name = 'AuthScope_1_null_1'), 1, 53, true
where not exists (
    select 1 from user_role_authorization_scope where authorization_scope_id = (select id from authorization_scope where name = 'AuthScope_1_null_1') and user_id = 1 and role_id = 53
);

insert into client (name) 
values ('test client');

-- INSERT INTO task (id, name, description, notes, client_id, status_id, due_by, completed_at, created_by, updated_by, updated_at, created_at, instructions, recurring, started_at, priority_id, assignee) 
-- VALUES 
-- (1, 'Task 1', 'Description 1', 'Notes 1', 1, 1, '2023-01-01T10:00:00Z', '2023-01-02T10:00:00Z', 1, 1, '2023-01-01T10:00:00Z', '2023-01-01T09:00:00Z', 'Instructions 1', false, '2023-01-01T09:30:00Z', 1, 1), 
-- (2, 'Task 2', 'Description 2', 'Notes 2', 2, 2, '2023-01-02T10:00:00Z', '2023-01-03T10:00:00Z', 1, 1, '2023-01-02T10:00:00Z', '2023-01-02T09:00:00Z', 'Instructions 2', true, '2023-01-02T09:30:00Z', 1, 1), 
-- (3, 'Task 3', 'Description 3', 'Notes 3', 1, 3, '2023-01-03T10:00:00Z', '2023-01-04T10:00:00Z', 1, 1, '2023-01-03T10:00:00Z', '2023-01-03T09:00:00Z', 'Instructions 3', false, '2023-01-03T09:30:00Z', 1, 1), 
-- (4, 'Task 4', 'Description 4', 'Notes 4', 1, 1, '2023-01-04T10:00:00Z', '2023-01-05T10:00:00Z', 1, 1, '2023-01-04T10:00:00Z', '2023-01-04T09:00:00Z', 'Instructions 4', true, '2023-01-04T09:30:00Z', 1, 1), 
-- (5, 'Task 5', 'Description 5', 'Notes 5', 2, 2, '2023-01-05T10:00:00Z', '2023-01-06T10:00:00Z', 1, 1, '2023-01-05T10:00:00Z', '2023-01-05T09:00:00Z', 'Instructions 5', false, '2023-01-05T09:30:00Z', 1, 1), 
-- (6, 'Task 6', 'Description 6', 'Notes 6', 1, 3, '2023-01-06T10:00:00Z', '2023-01-07T10:00:00Z', 1, 1, '2023-01-06T10:00:00Z', '2023-01-06T09:00:00Z', 'Instructions 6', true, '2023-01-06T09:30:00Z', 1, 1), 
-- (7, 'Task 7', 'Description 7', 'Notes 7', 2, 3, '2023-01-07T10:00:00Z', '2023-01-08T10:00:00Z', 1, 1, '2023-01-07T10:00:00Z', '2023-01-07T09:00:00Z', 'Instructions 7', false, '2023-01-07T09:30:00Z', 1, 1), 
-- (8, 'Task 8', 'Description 8', 'Notes 8', 1, 2, '2023-01-08T10:00:00Z', '2023-01-09T10:00:00Z', 1, 1, '2023-01-08T10:00:00Z', '2023-01-08T09:00:00Z', 'Instructions 8', true, '2023-01-08T09:30:00Z', 1, 1), 
-- (9, 'Task 9', 'Description 9', 'Notes 9', 1, 1, '2023-01-09T10:00:00Z', '2023-01-10T10:00:00Z', 1, 1, '2023-01-09T10:00:00Z', '2023-01-09T09:00:00Z', 'Instructions 9', false, '2023-01-09T09:30:00Z', 1, 1), 
-- (10, 'Task 10', 'Description 10', 'Notes 10', 1, 1, '2023-01-10T10:00:00Z', '2023-01-11T10:00:00Z', 1, 1, '2023-01-10T10:00:00Z', '2023-01-10T09:00:00Z', 'Instructions 10', true, '2023-01-10T09:30:00Z', 1, 1), 
-- (11, 'Task 11', 'Description 11', 'Notes 11', 2, 1, '2023-01-11T10:00:00Z', '2023-01-12T10:00:00Z', 1, 1, '2023-01-11T10:00:00Z', '2023-01-11T09:00:00Z', 'Instructions 11', false, '2023-01-11T09:30:00Z', 1, 1), 
-- (12, 'Task 12', 'Description 12', 'Notes 12', 1, 1, '2023-01-12T10:00:00Z', '2023-01-13T10:00:00Z', 1, 1, '2023-01-12T10:00:00Z', '2023-01-12T09:00:00Z', 'Instructions 12', true, '2023-01-12T09:30:00Z', 1, 1), 
-- (13, 'Task 13', 'Description 13', 'Notes 13', 1, 1, '2023-01-13T10:00:00Z', '2023-01-14T10:00:00Z', 1, 1, '2023-01-13T10:00:00Z', '2023-01-13T09:00:00Z', 'Instructions 13', false, '2023-01-13T09:30:00Z', 1, 1), 
-- (14, 'Task 14', 'Description 14', 'Notes 14', 1, 1, '2023-01-14T10:00:00Z', '2023-01-15T10:00:00Z', 1, 1, '2023-01-14T10:00:00Z', '2023-01-14T09:00:00Z', 'Instructions 14', true, '2023-01-14T09:30:00Z', 1, 1), 
-- (15, 'Task 15', 'Description 15', 'Notes 15', 1, 1, '2023-01-15T10:00:00Z', '2023-01-16T10:00:00Z', 1, 1, '2023-01-15T10:00:00Z', '2023-01-15T09:00:00Z', 'Instructions 15', false, '2023-01-15T09:30:00Z', 1, 1), 
-- (16, 'Task 16', 'Description 16', 'Notes 16', 1, 1, '2023-01-16T10:00:00Z', '2023-01-17T10:00:00Z', 1, 1, '2023-01-16T10:00:00Z', '2023-01-16T09:00:00Z', 'Instructions 16', true, '2023-01-16T09:30:00Z', 1, 1), 
-- (17, 'Task 17', 'Description 17', 'Notes 17', 2, 1, '2023-01-17T10:00:00Z', '2023-01-18T10:00:00Z', 1, 1, '2023-01-17T10:00:00Z', '2023-01-17T09:00:00Z', 'Instructions 17', false, '2023-01-17T09:30:00Z', 1, 1), 
-- (18, 'Task 18', 'Description 18', 'Notes 18', 1, 1, '2023-01-18T10:00:00Z', '2023-01-19T10:00:00Z', 1, 1, '2023-01-18T10:00:00Z', '2023-01-18T09:00:00Z', 'Instructions 18', true, '2023-01-18T09:30:00Z', 1, 1), 
-- (19, 'Task 19', 'Description 19', 'Notes 19', 1, 1, '2023-01-19T10:00:00Z', '2023-01-20T10:00:00Z', 1, 1, '2023-01-19T10:00:00Z', '2023-01-19T09:00:00Z', 'Instructions 19', false, '2023-01-19T09:30:00Z', 1, 1);

-- add operations role
insert into user_role_authorization_scope (authorization_scope_id, user_id, role_id)
values (5, 0, 10);
