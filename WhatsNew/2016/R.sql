EXECUTE sys.sp_execute_external_script
    @language = N'R'
,   @script = N'anscombe_data <- anscombe;'
,   @output_data_1_name = N'anscombe_data'
WITH RESULT SETS
(
    (
        "x1" int NOT NULL
    ,   "x2" int NOT NULL
    ,   "x3" int NOT NULL
    ,   "x4" int NOT NULL
    ,   "y1" float NOT NULL
    ,   "y2" float NOT NULL
    ,   "y3" float NOT NULL
    ,   "y4" float NOT NULL
    )
);