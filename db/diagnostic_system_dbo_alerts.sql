create table alerts
(
    alert_id    int identity
        constraint alerts_pk
            primary key,
    param_id    int
        constraint params___fk
            references params
            on delete cascade,
    rule_id     int
        constraint alerts_param_rules_rule_id_fk
            references param_rules
            on delete cascade,
    value_id    int
        constraint alerts_param_values_value_id_fk
            references param_values
            on delete cascade,
    consequence varchar(500),
    is_archived int default 0
)
go

INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (63, 1, 4, 19, null, 1);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (64, 1, 3, 20, null, 0);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (65, 1, 3, 21, null, 0);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (66, 2, 5, 22, null, 0);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (67, 2, 5, 23, null, 0);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (68, 2, 6, 24, null, 1);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (69, 2, 6, 25, null, 0);
INSERT INTO diagnostic_system.dbo.alerts (alert_id, param_id, rule_id, value_id, consequence, is_archived) VALUES (70, 2, 6, 26, null, 0);
