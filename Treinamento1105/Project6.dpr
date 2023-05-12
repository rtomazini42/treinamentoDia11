program Project6;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Unit\Main.pas' {FormMain},
  DACs in 'Unit\DACs.pas' {DataModule1: TDataModule},
  formIncluir in 'Unit\formIncluir.pas' {Form1},
  formAlterar in 'Unit\formAlterar.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
