CREATE TABLE Calendar
 (Dates Date)
GO
CREATE PROCEDURE DateInsert
AS
DECLARE @Date DATE;
DECLARE	@StartDate DATE;
DECLARE @EndDate DATE;
DELETE Calendar;
SET @StartDate = '2022-01-01';
SET @EndDate = '2023-01-01';
SET @Date = @StartDate;
WHILE (@Date != @EndDate)
	BEGIN
		INSERT INTO Calendar
		VALUES(@Date);
		SET @Date = DATEADD(dd, 1, @Date)
	END
;



