create table param_values
(
    value_id   int identity
        constraint param_values_pk
            primary key,
    param_id   int            not null
        constraint FK_param_values_params
            references params,
    value      numeric(15, 3) not null,
    datetime   datetime2      not null,
    is_checked int default 0  not null
)
go

INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (17, 1, 136.000, N'2023-04-13 13:43:35.2900000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (18, 1, 140.000, N'2023-04-13 13:45:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (19, 1, 150.000, N'2023-04-13 13:47:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (20, 1, 165.000, N'2023-04-13 13:59:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (21, 1, 166.000, N'2023-04-13 15:06:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (22, 2, 15.000, N'2023-04-13 13:00:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (23, 2, 20.000, N'2023-04-13 13:01:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (24, 2, 25.000, N'2023-04-13 13:03:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (25, 2, 25.000, N'2023-04-13 13:05:00.0000000', 1);
INSERT INTO diagnostic_system.dbo.param_values (value_id, param_id, value, datetime, is_checked) VALUES (26, 2, 25.000, N'2023-04-13 13:07:00.0000000', 1);
