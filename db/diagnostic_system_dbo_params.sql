create table params
(
    param_id int identity
        constraint params_pk
            primary key
        constraint IX_params
            unique,
    name     varchar(500) not null
)
go

INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (1, N'Inom');
INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (2, N'Tnom');
INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (3, N'Tп');
INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (4, N'Imax');
INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (5, N'фА');
INSERT INTO diagnostic_system.dbo.params (param_id, name) VALUES (6, N'Тп');
