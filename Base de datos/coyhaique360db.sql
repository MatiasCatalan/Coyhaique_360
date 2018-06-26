-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2018 a las 05:59:09
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coyhaique360db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_CANCHA_CODIGO` (IN `CCodigo_C` VARCHAR(10))  BEGIN
	SELECT C.Codigo_C, CC.Nombre_CC, SC.Nombre_SC, C.Descripcion_C, C.Precio_C, C.Imagen_C, C.Estado_C FROM CANCHAS C
	INNER JOIN clase_cancha CC ON CC.Codigo_CC = C.Codigo_CC
	INNER JOIN suelo_cancha SC ON SC.Codigo_SC = C.Codigo_SC
	WHERE C.Codigo_C = CCodigo_C and C.Estado_C = 'HAB' ORDER BY cc.Nombre_CC ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_ARRIENDO` (IN `CCodigo_A` VARCHAR(10))  BEGIN
	DELETE FROM DETALLE_ARRIENDO WHERE DETALLE_ARRIENDO.Codigo_A=CCodigo_A;
    DELETE FROM ARRIENDO WHERE ARRIENDO.Codigo_A=CCodigo_A;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CANCHA` (IN `CCodigo_C` VARCHAR(10))  begin
	update CANCHAS set Estado_C='INH' where Codigo_C=CCodigo_C;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CLASE_CANCHA` (IN `CCodigo_CC` VARCHAR(10))  begin
	update CLASE_CANCHA set Estado_CC='INH' where Codigo_CC=UPPER(CCodigo_CC);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_DETALLE_ARRIENDO` (IN `CCodigo_A` VARCHAR(10))  BEGIN
	DELETE FROM DETALLE_ARRIENDO WHERE Codigo_A = CCodigo_A;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_SUELO_CANCHA` (IN `CCodigo_SC` VARCHAR(10))  begin
	update SUELO_CANCHA set Estado_SC='INH' where Codigo_SC=CCodigo_SC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USUARIO` (IN `CCodigo_U` VARCHAR(10))  begin
	update USUARIO set Estado_U='INH' where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGEAR_USUARIO` (IN `IId_U` VARCHAR(30))  begin
	select Codigo_U,Id_U,Clave_U,Estado_U from USUARIO
    where Id_U = IId_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CANCHA` (IN `CCodigo_C` VARCHAR(10), IN `NNombre_CC` VARCHAR(30), IN `NNombre_SC` VARCHAR(30), IN `DDescripcion_C` VARCHAR(50), IN `PPrecio_C` DECIMAL(6,2), IN `IImagen_C` VARCHAR(50))  begin
	declare CCodigo_CC varchar(10);
    declare CCodigo_SC varchar(10);
    
    set CCodigo_CC = (SELECT Codigo_CC FROM clase_cancha where Nombre_CC = NNombre_CC);
    set CCodigo_SC = (SELECT Codigo_SC FROM suelo_cancha where Nombre_SC = NNombre_SC);

	update CANCHAS set Codigo_CC=UPPER(CCodigo_CC), Codigo_MC=UPPER(CCodigo_SC), Descripcion_C=UPPER(DDescripcion_C), Precio_C=UPPER(PPrecio_C), Imagen_C=IImagen_C where Codigo_C=UPPER(CCodigo_C);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLASE_CANCHA` (IN `CCodigo_CC` VARCHAR(10), IN `NNombre_CC` VARCHAR(30))  begin
	update CLASE_CANCHA set Nombre_CC=UPPER(NNombre_CC) where Codigo_CC=UPPER(CCodigo_CC);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLAVE_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `CClave_U` VARCHAR(20))  begin
	update USUARIO set Clave_U=CClave_U where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_EMAIL_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `EEmail_U` VARCHAR(50))  begin
	update USUARIO set Email_U=EEmail_U where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_SUELO_CANCHA` (IN `CCodigo_SC` VARCHAR(10), IN `NNombre_SC` VARCHAR(30))  begin
	update SUELO_CANCHA set Nombre_SC=UPPER(NNombre_SC) where Codigo_SC=CCodigo_SC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_USUARIO` (IN `CCodigo_U` VARCHAR(10), IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `DDni_U` CHAR(8), IN `CCiudad_U` VARCHAR(20), IN `RRegion_U` VARCHAR(20), IN `PPais_U` VARCHAR(20), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(9))  begin
	update USUARIO set Nombres_U=UPPER(NNombres_U), Apellidos_U=UPPER(AApellidos_U), Dni_U=UPPER(DDni_U), Ciudad_U=UPPER(CCiudad_U), Region_U=UPPER(RRegion_U), Pais_U=UPPER(PPais_U), Direccion1_U=UPPER(DDireccion1_U), Direccion2_U=UPPER(DDireccion2_U), Telefono_U=TTelefono_U where Codigo_U=UPPER(CCodigo_U);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_ARRIENDO` ()  BEGIN
	SELECT Codigo_A, USUARIO.Codigo_U, concat(USUARIO.Nombres_U,', ', USUARIO.Apellidos_U) AS Cliente, Total, DATE_FORMAT(Fecha,'%d/%m/%Y a las %H:%i:%s horas') AS Fecha  FROM ARRIENDO
    INNER JOIN USUARIO ON USUARIO.Codigo_U = ARRIENDO.Codigo_U 
    ORDER BY Fecha desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CANCHAS_ELIMINADAS` ()  BEGIN
	SELECT C.Codigo_C, CC.Nombre_CC as Clase_C, SC.Nombre_SC as Suelo_C, V.Descripcion_C, C.Precio_C, C.Imagen_C, C.Estado_C FROM CANCHA C
	INNER JOIN clase_cancha CC ON CC.Codigo_CC = C.Codigo_CC
	INNER JOIN suelo_cancha SC ON SC.Codigo_SC = C.Codigo_SC
	WHERE C.Estado_C = 'INH' ORDER BY cc.Nombre_Cc ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CANCHAS_HABILITADAS` ()  BEGIN
	SELECT C.Codigo_C, CC.Nombre_CC as Clase_C, SC.Nombre_SC as Suelo_C, C.Descripcion_C, C.Precio_C, C.Imagen_C, C.Estado_C FROM CANCHAS C
	INNER JOIN clase_cancha CC ON CC.Codigo_CC = C.Codigo_CC
	INNER JOIN suelo_cancha SC ON SC.Codigo_SC = C.Codigo_SC
	WHERE C.Estado_C = 'HAB' and CC.Estado_CC = 'HAB' and SC.Estado_SC = 'HAB' ORDER BY cc.Nombre_CC ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASE_CANCHAS_HABILITADAS` ()  BEGIN
	SELECT * FROM CLASE_CANCHA
    WHERE Estado_CC = 'HAB'
    ORDER BY Nombre_CC ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASE_CANCHAS_INHABILITADAS` ()  BEGIN
	SELECT * FROM CLASE_CANCHA
    WHERE Estado_CC = 'INH'
    ORDER BY Nombre_CC ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_ARRIENDO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_A) from ARRIENDO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_A FROM ARRIENDO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_CANCHA` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_C) from CANCHAS);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_C FROM CANCHAS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_CLASE_CANCHA` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CC) from CLASE_CANCHA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_CC FROM CLASE_CANCHA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_SUELO_CANCHA` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_SC) from SUELO_CANCHA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('MP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('MP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('MP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('MP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'MP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_SC FROM SUELO_CANCHA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_USUARIO` ()  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_U FROM USUARIO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_DETALLE_ARRIENDO_POR_CODIGO` (IN `CCodigo_A` VARCHAR(10))  BEGIN
	SELECT da.Codigo_A, CONCAT(cc.Nombre_CC,' ',s.Nombre_SC,' - ',c.Descripcion_C) as Canchas, da.Precio, da.Cantidad, da.Descuento, da.SubTotal
    FROM DETALLE_ARRIENDO da
    INNER JOIN CANCHAS c ON c.Codigo_C = da.Codigo_C
    INNER JOIN CLASE_CANCHA cc ON cc.Codigo_CC = c.Codigo_CC
    INNER JOIN SUELO_CANCHA s ON s.Codigo_SC = c.Codigo_SC
    WHERE da.Codigo_A = CCodigo_A;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_SUELO_CANCHAS_HABILITADAS` ()  begin
	SELECT * FROM SUELO_CANCHA
    where Estado_SC = 'HAB'
    ORDER BY Nombre_SC ASC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_SUELO_CANCHAS_INHABILITADAS` ()  begin
	SELECT * FROM SUELO_CANCHA
    where Estado_SC = 'INH'
    ORDER BY Nombre_SC ASC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_HABILITADOS` ()  begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'HAB'
    order by Nombres_U asc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_INHABILITADOS` ()  begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'INH'
    order by Nombres_U asc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIO_POR_CODIGO` (IN `CCodigo_U` VARCHAR(10))  begin
	select * from USUARIO
    where Codigo_U = CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_CANCHA` (IN `CCodigo_V` VARCHAR(10))  begin
	update CANCHAS set Estado_C='HAB' where Codigo_C=CCodigo_C;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_CLASE_CANCHA` (IN `CCodigo_CC` VARCHAR(10))  begin
	update CLASE_CANCHA set Estado_CC='HAB' where Codigo_CC=UPPER(CCodigo_CC);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_SUELO_CANCHA` (IN `CCodigo_SC` VARCHAR(10))  begin
	update SUELO_CANCHA set Estado_SC='HAB' where Codigo_SC=CCodigo_SC;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_USUARIO` (IN `CCodigo_U` VARCHAR(10))  begin
	update USUARIO set Estado_U='HAB' where Codigo_U=CCodigo_U;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_ARRIENDO` (IN `NNombre_U` VARCHAR(100), IN `TTotal` DECIMAL(10,2))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_U varchar(10);
	
    set max = (select MAX(Codigo_A) from ARRIENDO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    set CCodigo_U = (SELECT Codigo_U FROM USUARIO WHERE concat(Nombres_U,', ',Apellidos_U)=NNombre_U);
    
    if not exists (select Codigo_A from ARRIENDO where Codigo_A = CCodigo) then
		insert into ARRIENDO(Codigo_A, Codigo_U, Total) values (UPPER(CCodigo), UPPER(CCodigo_U), TTotal);
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_CANCHA` (IN `NNombre_CC` VARCHAR(30), IN `NNombre_SC` VARCHAR(30), IN `DDescripcion_C` VARCHAR(50), IN `PPrecio_C` DECIMAL(6,2), IN `IImagen_C` VARCHAR(50))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_CC varchar(30);
    declare CCodigo_SC varchar(30);
	
    set max = (select MAX(Codigo_C) from CANCHAS);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    set CCodigo_CC = (SELECT Codigo_CC FROM clase_cancha where Nombre_CC = NNombre_CC);
    set CCodigo_SC = (SELECT Codigo_SC FROM suelo_cancha where Nombre_SC = NNombre_SC);
    
    
    if not exists (select Codigo_C,Codigo_CC,Codigo_SC,Descripcion_C,Precio_C,Estado_C from CANCHAS
    where Codigo_C=CCodigo or Codigo_CC=CCodigo_CC and Codigo_SC = CCodigo_SC and Descripcion_C = DDescripcion_C and Precio_C=PPrecio_C and (Estado_C='HAB' or Estado_C='INH')) then
		insert into CANCHAS(Codigo_C, Codigo_CC, Codigo_SC, Descripcion_C, Precio_C, Imagen_C) values (UPPER(CCodigo) ,UPPER(CCodigo_CC), UPPER(CCodigo_SC), UPPER(DDescripcion_C), UPPER(PPrecio_C), IImagen_C);
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_CLASE_CANCHA` (IN `NNombre_CC` VARCHAR(30))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CC) from CLASE_CANCHA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    if not exists (select Codigo_CC,Nombre_CC,Estado_CC from CLASE_CANCHA where Codigo_CC=CCodigo or Nombre_CC=NNombre_CC and (Estado_CC='HAB' or Estado_CC='INH')) then
		insert into CLASE_CANCHA(Codigo_CC,Nombre_CC) values (UPPER(CCodigo) ,UPPER(NNombre_CC));
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_DETALLE_ARRIENDO` (IN `CCodigo_A` VARCHAR(10), IN `NNombre_C` VARCHAR(100), IN `PPrecio` DECIMAL(10,2), IN `CCantidad` DECIMAL(10,2), IN `DDescuento` DECIMAL(10,2), IN `SSubTotal` DECIMAL(10,2))  BEGIN
	declare CCodigo_C varchar(10);
    
    set CCodigo_C = (SELECT Codigo_C FROM CANCHAS C
    INNER JOIN clase_cancha CC ON CC.Codigo_CC = C.Codigo_CC
    INNER JOIN suelo_cancha SC ON SC.Codigo_SC = C.Codigo_SC
    WHERE CONCAT(CC.Nombre_CC,' ',SC.Nombre_SC,' - ',C.Descripcion_C) = NNombre_C);
    
    INSERT INTO DETALLE_ARRIENDO(Codigo_A, Codigo_C, Precio, Cantidad, Descuento, SubTotal) VALUES(UPPER(CCodigo_A),UPPER(CCodigo_C),PPrecio,CCantidad,DDescuento,SSubTotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO` (IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `DDni_U` CHAR(8), IN `EEmail_U` VARCHAR(50), IN `CCIUDAD_U` VARCHAR(20), IN `RREGION_U` VARCHAR(20), IN `PPAIS_U` VARCHAR(20), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(9), IN `IId_U` VARCHAR(30), IN `CClave_U` VARCHAR(20), IN `TTipo_U` VARCHAR(15))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
		insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,CIUDAD_U,REGION_U,PAIS_U,Direccion1_U,Direccion2_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),DDni_U,EEmail_U,UPPER(CCIUDAD_U),UPPER(RREGION_U),UPPER(PPAIS_U),UPPER(DDireccion1_U),UPPER(DDireccion2_U),TTelefono_U,IId_U,CClave_U,UPPER(TTipo_U),'HAB');
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO_CLIENTE` (IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `DDni_U` CHAR(8), IN `EEmail_U` VARCHAR(50), IN `CCiudad_U` VARCHAR(20), IN `RRegion_U` VARCHAR(20), IN `PPAIS_U` VARCHAR(20), IN `DDireccion1_U` VARCHAR(50), IN `DDireccion2_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(9), IN `IId_U` VARCHAR(30), IN `CClave_U` VARCHAR(20))  BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
		insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Ciudad_U,Region_U,Pais_U,Direccion1_U,Direccion2_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),DDni_U,EEmail_U,UPPER(CCiudad_U),UPPER(RRegion_U),UPPER(PPais_U),UPPER(DDireccion1_U), UPPER(DDireccion2_U),TTelefono_U,IId_U,CClave_U,'CLIENTE','HAB');
	end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arriendo`
--

CREATE TABLE `arriendo` (
  `Codigo_A` varchar(20) NOT NULL,
  `Codigo_U` varchar(10) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arriendo`
--

INSERT INTO `arriendo` (`Codigo_A`, `Codigo_U`, `Total`, `Fecha`) VALUES
('V0049', 'U0001', '25000.00', '2018-06-25 23:24:25'),
('V0050', 'U0012', '25000.00', '2018-06-26 04:50:30'),
('V0051', 'U0012', '25000.00', '2018-06-26 05:24:12'),
('V0052', 'U0013', '25000.00', '2018-06-26 05:51:56'),
('V0053', 'U0013', '0.00', '2018-06-26 05:54:11'),
('V0054', 'U0013', '75000.00', '2018-06-26 05:54:28'),
('V0055', 'U0013', '25000.00', '2018-06-26 05:57:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canchas`
--

CREATE TABLE `canchas` (
  `Codigo_C` varchar(10) NOT NULL,
  `Codigo_CC` varchar(10) NOT NULL,
  `Codigo_SC` varchar(10) NOT NULL,
  `Descripcion_C` varchar(100) NOT NULL,
  `Precio_C` decimal(10,2) NOT NULL,
  `Stock_C` decimal(6,2) DEFAULT '0.00',
  `Imagen_C` varchar(100) DEFAULT NULL,
  `Estado_C` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `canchas`
--

INSERT INTO `canchas` (`Codigo_C`, `Codigo_CC`, `Codigo_SC`, `Descripcion_C`, `Precio_C`, `Stock_C`, `Imagen_C`, `Estado_C`) VALUES
('P0001', 'CP0003', 'MP0001', 'Cancha Las Nieves', '25000.00', '10.00', 'IM1.bmp', 'HAB'),
('P0002', 'CP0005', 'MP0004', 'Cancha Fiscal', '25000.00', '30.00', 'IM2.png', 'HAB'),
('P0003', 'CP0002', 'MP0004', 'Cancha Almirante', '18000.00', '30.00', 'M12.jpg', 'HAB'),
('P0004', 'CP0002', 'MP0004', 'Cancha Antuan', '25000.00', '30.00', 'IM9.jpg', 'HAB'),
('P0005', 'CP0003', 'MP0004', 'Cancha Pedro Quintana Mansilla', '18000.00', '30.00', 'IM5.jpg', 'HAB'),
('P0006', 'CP0005', 'MP0002', 'Cancha Campo de Hielo', '25000.00', '30.00', 'IM4.jpg', 'HAB'),
('P0007', 'CP0003', 'MP0005', 'Gimnasio Regional', '25000.00', '20.00', 'IM3.jpg', 'HAB'),
('P0008', 'CP0002', 'MP0004', 'Cancha Austral', '25000.00', '20.00', 'IM8.jpg', 'HAB'),
('P0009', 'CP0005', 'MP0002', 'Cancha 2 Campo Hielo', '27000.00', '30.00', 'IM33.jpg', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_cancha`
--

CREATE TABLE `clase_cancha` (
  `Codigo_CC` varchar(10) NOT NULL,
  `Nombre_CC` varchar(30) NOT NULL,
  `Estado_CC` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clase_cancha`
--

INSERT INTO `clase_cancha` (`Codigo_CC`, `Nombre_CC`, `Estado_CC`) VALUES
('CP0002', 'BABY FUTBOL', 'HAB'),
('CP0003', 'FUTBOL CALLE', 'HAB'),
('CP0004', 'FUTBOLITO', 'HAB'),
('CP0005', 'FUTSAL', 'HAB'),
('CP0006', 'FUTBOL 10', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_arriendo`
--

CREATE TABLE `detalle_arriendo` (
  `Codigo_A` varchar(20) NOT NULL,
  `Codigo_C` varchar(10) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL,
  `SubTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_arriendo`
--

INSERT INTO `detalle_arriendo` (`Codigo_A`, `Codigo_C`, `Precio`, `Cantidad`, `Descuento`, `SubTotal`) VALUES
('V0049', 'P0001', '25000.00', '1.00', '0.00', '25000.00'),
('V0050', 'P0004', '25000.00', '1.00', '0.00', '25000.00'),
('V0051', 'P0001', '25000.00', '1.00', '0.00', '25000.00'),
('V0052', 'P0008', '25000.00', '1.00', '0.00', '25000.00'),
('V0054', 'P0008', '25000.00', '3.00', '0.00', '75000.00'),
('V0055', 'P0008', '25000.00', '1.00', '0.00', '25000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suelo_cancha`
--

CREATE TABLE `suelo_cancha` (
  `Codigo_SC` varchar(10) NOT NULL,
  `Nombre_SC` varchar(30) NOT NULL,
  `Estado_SC` char(3) DEFAULT 'HAB'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `suelo_cancha`
--

INSERT INTO `suelo_cancha` (`Codigo_SC`, `Nombre_SC`, `Estado_SC`) VALUES
('MP0001', 'CEMENTO', 'HAB'),
('MP0002', 'CARPETA', 'HAB'),
('MP0003', 'CESPED', 'HAB'),
('MP0004', 'CESPED ARTIFICIAL', 'HAB'),
('MP0005', 'CARPETA', 'HAB'),
('MP0006', 'TIERRA', 'HAB'),
('MP0007', 'MADERA', 'HAB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo_U` varchar(10) NOT NULL,
  `Nombres_U` varchar(50) NOT NULL,
  `Apellidos_U` varchar(50) NOT NULL,
  `Dni_U` char(8) NOT NULL,
  `Email_U` varchar(50) NOT NULL,
  `Ciudad_U` varchar(20) NOT NULL,
  `Region_U` varchar(20) NOT NULL,
  `Pais_U` varchar(20) NOT NULL,
  `Direccion1_U` varchar(50) NOT NULL,
  `Direccion2_U` varchar(50) DEFAULT NULL,
  `Telefono_U` varchar(9) NOT NULL,
  `Id_U` varchar(30) NOT NULL,
  `Clave_U` varchar(20) NOT NULL,
  `Tipo_U` varchar(15) NOT NULL,
  `Estado_U` char(3) DEFAULT 'INH'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo_U`, `Nombres_U`, `Apellidos_U`, `Dni_U`, `Email_U`, `Ciudad_U`, `Region_U`, `Pais_U`, `Direccion1_U`, `Direccion2_U`, `Telefono_U`, `Id_U`, `Clave_U`, `Tipo_U`, `Estado_U`) VALUES
('U0001', 'LUIS ALEJANDRO', 'CARCAMO ESPINOZA', '7777777', 'luiscarcamo@elantojao.com', '12 DE OCTUBRE 654', 'COYHAIQUE', 'COYHAIQUEC', 'LEJOS DE COYHAIQUE', 'MAS LEJOS', '222222212', 'luis', 'administrador', 'ADMINISTRADOR', 'HAB'),
('U0012', 'MATIAS IGNACIO', 'CATALAN SCHWENKE', '19462137', 'mtatias.catalan9@htmail.com', 'COYHAIQUE', 'AYSEN', 'CHILE', 'CALLE FALSA 123', 'CALLE FALSA 123', '77777777', 'mcatalan', '123456789', 'CLIENTE', 'HAB'),
('U0013', 'DILAN BRULLELI', 'RANNI ULE', '19132134', 'dylan.ranni@gmail.com', 'COYHAIQUE', 'AYSEN', 'CHILE', 'CALLE SUR 4', '', '908767675', 'dilan', '1234', 'CLIENTE', 'HAB');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arriendo`
--
ALTER TABLE `arriendo`
  ADD PRIMARY KEY (`Codigo_A`),
  ADD KEY `FK_Codigo_U` (`Codigo_U`);

--
-- Indices de la tabla `canchas`
--
ALTER TABLE `canchas`
  ADD PRIMARY KEY (`Codigo_C`),
  ADD KEY `FK_Codigo_CP` (`Codigo_CC`),
  ADD KEY `FK_Codigo_MP` (`Codigo_SC`);

--
-- Indices de la tabla `clase_cancha`
--
ALTER TABLE `clase_cancha`
  ADD PRIMARY KEY (`Codigo_CC`);

--
-- Indices de la tabla `detalle_arriendo`
--
ALTER TABLE `detalle_arriendo`
  ADD KEY `FK_Codigo_V` (`Codigo_A`),
  ADD KEY `FK_Codigo_P` (`Codigo_C`);

--
-- Indices de la tabla `suelo_cancha`
--
ALTER TABLE `suelo_cancha`
  ADD PRIMARY KEY (`Codigo_SC`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo_U`),
  ADD UNIQUE KEY `U_Id_U` (`Id_U`),
  ADD UNIQUE KEY `U_Dni_U` (`Dni_U`),
  ADD UNIQUE KEY `U_Email_U` (`Email_U`),
  ADD UNIQUE KEY `U_Telefono_U` (`Telefono_U`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arriendo`
--
ALTER TABLE `arriendo`
  ADD CONSTRAINT `FK_Codigo_U` FOREIGN KEY (`Codigo_U`) REFERENCES `usuario` (`Codigo_U`);

--
-- Filtros para la tabla `canchas`
--
ALTER TABLE `canchas`
  ADD CONSTRAINT `FK_Codigo_CP` FOREIGN KEY (`Codigo_CC`) REFERENCES `clase_cancha` (`Codigo_CC`),
  ADD CONSTRAINT `FK_Codigo_MP` FOREIGN KEY (`Codigo_SC`) REFERENCES `suelo_cancha` (`Codigo_SC`);

--
-- Filtros para la tabla `detalle_arriendo`
--
ALTER TABLE `detalle_arriendo`
  ADD CONSTRAINT `detalle_arriendo_ibfk_1` FOREIGN KEY (`Codigo_A`) REFERENCES `arriendo` (`Codigo_A`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_arriendo_ibfk_2` FOREIGN KEY (`Codigo_C`) REFERENCES `canchas` (`Codigo_C`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
