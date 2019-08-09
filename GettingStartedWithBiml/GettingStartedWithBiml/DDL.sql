CREATE DATABASE TypeMoreClickLess;
GO

USE TypeMoreClickLess;
GO

CREATE SCHEMA [RAW] AUTHORIZATION dbo;
GO

CREATE SCHEMA [AUD] AUTHORIZATION dbo;
GO

CREATE TABLE [RAW].[OPS_PICKUP](
    [PAS_PU_SEND_DT] [varchar](8) NULL,
    [PAS_PU_SEND_TIME] [varchar](8) NULL,
    [PAS_PU_DT] [varchar](8) NULL,
    [PAS_PU_TERM] [varchar](4) NULL,
    [PCT_ZONE] [varchar](1) NULL,
    [PAS_STATUS_CODE] [varchar](1) NULL,
    [PAS_PU_TIME_ARRIVE] [varchar](4) NULL,
    [PAS_PU_TIME_DEPART] [varchar](4) NULL,
    [PAS_PU_REFERENCE_ID] [varchar](8) NULL,
    [PAS_PU_MASTER_REF_ID] [varchar](8) NULL,
    [PAS_PU_SHPR_NAME] [varchar](60) NULL,
    [PAS_PU_ADDR] [varchar](60) NULL,
    [PAS_PU_CITY] [varchar](35) NULL,
    [PAS_PU_STATE] [varchar](2) NULL,
    [PAS_PU_ZIP] [varchar](6) NULL,
    [PAS_CTRY_RPRTD] [varchar](3) NULL,
    [PCT_PU_NAME] [varchar](20) NULL,
    [PCT_PU_PHONE] [varchar](18) NULL,
    [PCT_CO_NAME] [varchar](20) NULL,
    [PCT_CO_PHONE] [varchar](18) NULL,
    [PCT_READY_HH] [varchar](2) NULL,
    [PCT_READY_MM] [varchar](2) NULL,
    [PCT_CLOSE_HH] [varchar](2) NULL,
    [PCT_CLOSE_MM] [varchar](2) NULL,
    [PAS_PU_TRAILER] [varchar](10) NULL,
    [PCT_NUM_SHPS] [varchar](3) NULL,
    [PAS_PU_WGT] [varchar](6) NULL,
    [PAS_DRIVER_NAME] [varchar](15) NULL,
    [PAS_REASON_CODE] [varchar](4) NULL,
    [PAS_SERVICE_TYPE] [varchar](4) NULL,
    [PAS_QUOTE_ID] [varchar](8) NULL,
    [PAS_ECM_ID] [varchar](8) NULL,
    [PCT_CPUP] [varchar](1) NULL,
    [PCT_T_LINE] [varchar](20) NULL,
    [PCT_TAKEN_BY] [varchar](7) NULL,
    [PAS_BUS_ID] [varchar](11) NULL,
    [PAS_DEPT_CODE] [varchar](3) NULL,
    [PAS_TAG] [varchar](20) NULL,
    [PAS_TYPE] [varchar](4) NULL,
    [PCT_PU_COMM1] [varchar](25) NULL,
    [PCT_PU_COMM2] [varchar](25) NULL,
    [PCT_REPORT_DATE] [varchar](8) NULL,
    [PAS_PU_PCS] [varchar](5) NULL,
    [PAS_GROUP_ID] [varchar](14) NULL,
    [PAS_RAPID_ROUTE_CD] [varchar](10) NULL,
    [PAS_PU_DTS_ASSIGN] [varchar](16) NULL,
    [PAS_PU_DTS_ACKNOWLEDGE] [varchar](16) NULL,
    [PAS_PU_ARRIVE_LAT] [varchar](11) NULL,
    [PAS_PU_ARRIVE_LON] [varchar](11) NULL,
    [PAS_RPRTD_PU_DT] [varchar](8) NULL,
    [PAS_RPRTD_NBR_SHPTS] [varchar](3) NULL,
    [PAS_RPRTD_PU_WGT] [varchar](6) NULL,
    [PAS_RPRTD_PU_PCS] [varchar](5) NULL,
    [PAS_PU_ARRIVE_TIMESTAMP] [varchar](16) NULL,
    [PAS_PU_DEPART_TIMESTAMP] [varchar](16) NULL,
    [PAS_REASON_TEXT] [varchar](50) NULL
) ;
GO
CREATE TABLE RAW.SalesCurrency
(
    CurrencyCode nchar(3) NOT NULL
,   CurrencyName nvarchar(50) NOT NULL
);
GO
CREATE TABLE RAW.PICKUP
(
    SEND_DT varchar(08)
,   SEND_TIME varchar(08)
,   DT varchar(08)
,   TERM varchar(04)
,   PCT_ZONE varchar(01)
,   STATUS_CODE varchar(01)
,   TIME_ARRIVE varchar(04)
,   TIME_DEPART varchar(04)
,   REFERENCE_ID varchar(08)
,   MASTER_REF_ID varchar(08)
,   SHPR_NAME varchar(60)
,   ADDR varchar(60)
,   CITY varchar(35)
,   STATE varchar(02)
,   ZIP varchar(06)
,   CTRY_RPRTD varchar(03)
,   PCT_PU_NAME varchar(20)
,   PCT_PU_PHONE varchar(18)
,   PCT_CO_NAME varchar(20)
,   PCT_CO_PHONE varchar(18)
,   PCT_READY_HH varchar(02)
,   PCT_READY_MM varchar(02)
,   PCT_CLOSE_HH varchar(02)
,   PCT_CLOSE_MM varchar(02)
,   TRAILER varchar(10)
,   PCT_NUM_SHPS varchar(03)
,   WGT varchar(06)
,   DRIVER_NAME varchar(15)
,   REASON_CODE varchar(04)
,   SERVICE_TYPE varchar(04)
,   QUOTE_ID varchar(08)
,   ECM_ID varchar(08)
,   PCT_CPUP varchar(01)
,   PCT_T_LINE varchar(20)
,   PCT_TAKEN_BY varchar(07)
,   BUS_ID varchar(11)
,   DEPT_CODE varchar(03)
,   TAG varchar(20)
,   PICK_TYPE varchar(04)
,   PCT_PU_COMM1 varchar(25)
,   PCT_PU_COMM2 varchar(25)
,   PCT_REPORT_DATE varchar(08)
,   PCS varchar(05)
,   GROUP_ID varchar(14)
,   RAPID_ROUTE_CD varchar(10)
,   DTS_ASSIGN varchar(16)
,   DTS_ACKNOWLEDGE varchar(16)
,   ARRIVE_LAT varchar(11)
,   ARRIVE_LON varchar(11)
,   RPRTD_PU_DT varchar(8)
,   RPRTD_NBR_SHPTS varchar(3)
,   RPRTD_PU_WGT varchar(6)
,   RPRTD_PU_PCS varchar(5)
) ;
GO

