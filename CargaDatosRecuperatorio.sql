

USE PeluqueriaDB;
GO

SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    -- 1. Cargar dos profesionales.
    IF NOT EXISTS (SELECT 1 FROM dbo.Profesionales WHERE Nombre = N'Ana López')
        INSERT INTO dbo.Profesionales (Nombre, PrecioPorTurno)
        VALUES (N'Ana López', 8000.00);

    IF NOT EXISTS (SELECT 1 FROM dbo.Profesionales WHERE Nombre = N'Lucas Pérez')
        INSERT INTO dbo.Profesionales (Nombre, PrecioPorTurno)
        VALUES (N'Lucas Pérez', 10000.00);

    -- Obtener los identificadores generados por IDENTITY.
    -- No se supone que sean 1 y 2, porque la tabla podría tener otros datos.
    DECLARE @IdAna INT;
    DECLARE @IdLucas INT;

    SELECT @IdAna = IdProfesional
    FROM dbo.Profesionales
    WHERE Nombre = N'Ana López';

    SELECT @IdLucas = IdProfesional
    FROM dbo.Profesionales
    WHERE Nombre = N'Lucas Pérez';

    -- 2. Cargar cuatro turnos: dos pagados y dos pendientes.
    -- Pagado: 0 = pendiente, 1 = pagado.
    IF NOT EXISTS (
        SELECT 1 FROM dbo.Turnos
        WHERE IdProfesional = @IdAna AND Fecha = '20261007' AND Hora = N'16:00'
    )
        INSERT INTO dbo.Turnos (IdProfesional, Cliente, Fecha, Hora, Pagado)
        VALUES (@IdAna, N'María Gómez', '20261007', N'16:00', 1);

    IF NOT EXISTS (
        SELECT 1 FROM dbo.Turnos
        WHERE IdProfesional = @IdAna AND Fecha = '20261007' AND Hora = N'17:00'
    )
        INSERT INTO dbo.Turnos (IdProfesional, Cliente, Fecha, Hora, Pagado)
        VALUES (@IdAna, N'Carla Fernández', '20261007', N'17:00', 0);

    IF NOT EXISTS (
        SELECT 1 FROM dbo.Turnos
        WHERE IdProfesional = @IdLucas AND Fecha = '20261008' AND Hora = N'16:00'
    )
        INSERT INTO dbo.Turnos (IdProfesional, Cliente, Fecha, Hora, Pagado)
        VALUES (@IdLucas, N'Pedro Rodríguez', '20261008', N'16:00', 1);

    IF NOT EXISTS (
        SELECT 1 FROM dbo.Turnos
        WHERE IdProfesional = @IdLucas AND Fecha = '20261008' AND Hora = N'17:00'
    )
        INSERT INTO dbo.Turnos (IdProfesional, Cliente, Fecha, Hora, Pagado)
        VALUES (@IdLucas, N'Sofía Martínez', '20261008', N'17:00', 0);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO


