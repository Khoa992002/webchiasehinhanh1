/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [idImage]
      ,[images]
      ,[idCategory]
      ,[userID]
      ,[Tag]
      ,[TieuCu]
      ,[KhauDo]
      ,[TocDoManTrap]
      ,[ISO]
      ,[Camera]
      ,[LoaiHinhAnh]
      ,[date]
      ,[view]
      ,[ready]
      ,[IsPublic]
  FROM [DoAn].[dbo].[Images]