/*AVISO: Cambiar manualmente el nombre de la tabla de User  a  Users. User genera conflictos con una palabra reservada... (upss)*/

USE MYHEALTHMANAGER;

ALTER TABLE dbo.Users ADD TotalSugar DECIMAL(4,2);