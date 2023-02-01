CREATE PROCEDURE DataUpdate
	@Schema VARCHAR(40) = dbo,
	@TableName VARCHAR(100) = NULL
AS
DECLARE @ViewName VARCHAR(100),
	@Sql NVARCHAR(4000),
	@StartTime TIME,
	@EndTime TIME,
	@Duration INT,
	@UserLogin VARCHAR(250),
	@Msg NVARCHAR(2048)

BEGIN TRY 
SET @UserLogin = SUSER_NAME()
SET @StartTime = CONVERT(TIME, SYSDATETIMEOFFSET())
	IF @ViewName IS NOT NULL
	BEGIN
		SET @ViewName = SUBSTRING(@TableName, 2, 100)
		IF EXISTS (SELECT * FROM sys.schemas ss 
					JOIN sys.objects so
						ON ss.schema_id = so.schema_id AND ss.name = @Schema AND so.name = @TableName)
			BEGIN
				SET @Sql = N'truncate table ' + @TableName + ' insert into ' + @TableName + ' select * from ' + @ViewName
				EXEC sp_executesql @sql
			END
			ELSE
			BEGIN
				SET @Sql = N'truncate table ' + @TableName + ' from ' + @ViewName;
				EXEC sp_executesql @sql
		END 
	END
	ELSE
	BEGIN
		DECLARE MyCursor CURSOR FORWARD_ONLY READ_ONLY STATIC
		FOR
		SELECT so.name FROM sys.schemas ss 
			JOIN sys.objects so
				ON ss.schema_id = so.schema_id AND type_desc = 'VIEW' AND ss.name = @Schema
		OPEN MyCursor
		FETCH MyCursor INTO @ViewName
		WHILE @@FETCH_STATUS = 0
		BEGIN 
			SET @TableName = ('t') + @ViewName
			IF EXISTS (SELECT * FROM sys.schemas ss 
							JOIN sys.objects so
								ON ss.schema_id = so.schema_id AND ss.name = @Schema AND so.name = @TableName)
				BEGIN
					SET @Sql = N'truncate table ' + @TableName + ' insert into ' + @TableName + ' select * from ' + @ViewName
					EXEC sp_executesql @sql
				END 
				ELSE 
				BEGIN 
					SET @Sql = N'truncate table ' + @TableName + ' from ' + @ViewName;
					EXEC sp_executesql @sql
				END 
			FETCH MyCursor INTO @ViewName
		END
		CLOSE MyCursor
		DEALLOCATE MyCursor
	END
SET @EndTime = CONVERT(TIME, SYSDATETIMEOFFSET())
SET @Duration = DATEDIFF(MILLISECOND, @StartTime, @EndTime)
SET @Msg = 0

INSERT INTO Logs
VALUES (@StartTime, @Duration, @Schema + ', ' + @TableName, @UserLogin, @Msg)
END TRY 
BEGIN CATCH 
	CLOSE MyCursor
	DEALLOCATE MyCursor
	SET @Msg = ERROR_MESSAGE()
	INSERT INTO Logs 
	VALUES (@StartTime, @Duration, @Schema + ', ' + @TableName, @UserLogin, @Msg)
END CATCH


SELECT * FROM Logs
TRUNCATE TABLE Logs