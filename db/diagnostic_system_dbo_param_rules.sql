create table param_rules
(
    rule_id    int identity
        constraint param_rules_pk
            primary key,
    param_id   int            not null
        constraint FK_param_rules_params
            references params,
    rule_type  varchar(10)    not null,
    min_value  numeric(15, 3) not null,
    max_value  numeric(15, 3),
    alert_kind varchar(10)
)
go

INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (3, 1, N'MORE', 161.000, 99999.000, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (4, 1, N'MORE', 150.000, 160.000, N'WARNING');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (5, 2, N'LESS', -99999.000, 24.000, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (6, 2, N'LESS', 25.000, 40.000, N'WARNING');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (7, 3, N'MORE', 0.200, 0.499, N'WARNING');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (8, 3, N'MORE', 0.500, 99999.000, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (9, 4, N'MORE', 240.000, 299.000, N'WARNING');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (10, 4, N'MORE', 300.000, 99999.000, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (11, 5, N'MORE', 87.000, 93.000, N'WARNING');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (12, 5, N'MORE', 94.000, 99999.000, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (13, 6, N'LESS', -99999.000, 0.540, N'ALERT');
INSERT INTO diagnostic_system.dbo.param_rules (rule_id, param_id, rule_type, min_value, max_value, alert_kind) VALUES (14, 6, N'LESS', 0.541, 0.700, N'WARNING');
