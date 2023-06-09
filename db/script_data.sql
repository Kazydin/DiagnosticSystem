USE [diagnostic_system]
GO
SET IDENTITY_INSERT [dbo].[params] ON 

INSERT [dbo].[params] ([param_id], [name]) VALUES (1, N'Inom')
INSERT [dbo].[params] ([param_id], [name]) VALUES (2, N'Tnom')
INSERT [dbo].[params] ([param_id], [name]) VALUES (3, N'Tп')
INSERT [dbo].[params] ([param_id], [name]) VALUES (4, N'Imax')
INSERT [dbo].[params] ([param_id], [name]) VALUES (5, N'фА')
INSERT [dbo].[params] ([param_id], [name]) VALUES (6, N'Тп')
SET IDENTITY_INSERT [dbo].[params] OFF
GO
SET IDENTITY_INSERT [dbo].[param_rules] ON 

INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (3, 1, N'MORE', CAST(161.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (4, 1, N'MORE', CAST(150.000 AS Numeric(15, 3)), CAST(160.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (5, 2, N'LESS', CAST(-99999.000 AS Numeric(15, 3)), CAST(24.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (6, 2, N'LESS', CAST(25.000 AS Numeric(15, 3)), CAST(40.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (7, 3, N'MORE', CAST(0.200 AS Numeric(15, 3)), CAST(0.499 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (8, 3, N'MORE', CAST(0.500 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (9, 4, N'MORE', CAST(240.000 AS Numeric(15, 3)), CAST(299.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (10, 4, N'MORE', CAST(300.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (11, 5, N'MORE', CAST(87.000 AS Numeric(15, 3)), CAST(93.000 AS Numeric(15, 3)), N'WARNING')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (12, 5, N'MORE', CAST(94.000 AS Numeric(15, 3)), CAST(99999.000 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (13, 6, N'LESS', CAST(-99999.000 AS Numeric(15, 3)), CAST(0.540 AS Numeric(15, 3)), N'ALERT')
INSERT [dbo].[param_rules] ([rule_id], [param_id], [rule_type], [min_value], [max_value], [alert_kind]) VALUES (14, 6, N'LESS', CAST(0.541 AS Numeric(15, 3)), CAST(0.700 AS Numeric(15, 3)), N'WARNING')
SET IDENTITY_INSERT [dbo].[param_rules] OFF
GO
SET IDENTITY_INSERT [dbo].[param_values] ON 

INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (17, 1, CAST(136.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:43:35.2900000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (18, 1, CAST(140.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:45:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (19, 1, CAST(150.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:47:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (20, 1, CAST(165.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:59:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (21, 1, CAST(166.000 AS Numeric(15, 3)), CAST(N'2023-04-13T15:06:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (22, 2, CAST(15.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (23, 2, CAST(20.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:01:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (24, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:03:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (25, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:05:00.0000000' AS DateTime2), 1)
INSERT [dbo].[param_values] ([value_id], [param_id], [value], [datetime], [is_checked]) VALUES (26, 2, CAST(25.000 AS Numeric(15, 3)), CAST(N'2023-04-13T13:07:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[param_values] OFF
GO
SET IDENTITY_INSERT [dbo].[alerts] ON 

INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (63, 1, 4, 19, NULL, 1)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (64, 1, 3, 20, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (65, 1, 3, 21, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (66, 2, 5, 22, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (67, 2, 5, 23, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (68, 2, 6, 24, NULL, 1)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (69, 2, 6, 25, NULL, 0)
INSERT [dbo].[alerts] ([alert_id], [param_id], [rule_id], [value_id], [consequence], [is_archived]) VALUES (70, 2, 6, 26, NULL, 0)
SET IDENTITY_INSERT [dbo].[alerts] OFF
GO
