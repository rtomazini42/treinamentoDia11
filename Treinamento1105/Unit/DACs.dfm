object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Tomazini\Desktop\Projeto\Dados\Dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 536
    Top = 264
  end
  object qryPesq: TFDQuery
    Connection = FDConnection1
    Left = 536
    Top = 344
  end
  object qryExec: TFDQuery
    Connection = FDConnection1
    Left = 536
    Top = 408
  end
end
