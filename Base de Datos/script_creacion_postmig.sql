/****** Object:  Sequence [gd_esquema].[sq_publicacion]    Script Date: 08/06/2016 04:25:47 p.m. ******/
CREATE SEQUENCE [gd_esquema].[sq_publicacion] 
 AS [bigint]
 START WITH 71079
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO

INSERT INTO [gd_esquema].[Usuario]
           ([Username], [PassHash], [PassSalt])
     VALUES
           ('admin', 'U3hc2PwspfX6gECdhWXkk9n4MEtL7NIPsXsvdUZPOu8n2YCi', 'J9mAog==')
GO
