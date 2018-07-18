USE BDTioJuanito
GO

/* SP de la tabla Colegio */
CREATE PROCEDURE sp_Colegio
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Colegio
            (idColg,nomColg)
        VALUES (@Codigo,@Nombre);
        SELECT * FROM Colegio
    END
GO
/* Ejecutar SP */
EXEC sp_Colegio @Codigo = 1,@Nombre = 'Pepito Perez'
GO

/* SP de la tabla Barrio */
CREATE PROCEDURE sp_Barrio
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Barrio
            (idBarrio,nomBarrio)
        VALUES (@Codigo,@Nombre);
        SELECT * FROM Barrio
    END
GO
/* Ejecutar SP */
EXEC sp_Barrio @Codigo = 1,@Nombre = 'Av. LAS FLORES'
GO

/* SP de la tabla Niño */
CREATE PROCEDURE sp_