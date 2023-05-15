unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, DACs, formIncluir, formAlterar,
  FMX.Effects;


//uses DACs;

type
  TFormMain = class(TForm)
    Incluir: TButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Alterar: TButton;
    Excluir: TButton;
    Sair: TButton;

    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Rectangle3: TRectangle;
    Titulo: TLabel;
    procedure IncluirClick(Sender: TObject);
   // procedure AlterarClick(Sender: TObject);
    procedure AlteracaoCliente(linha: Integer);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure Grid1CellClick(const Column: TColumn; const Row: Integer);
    procedure Grid1CellDblClick(const Column: TColumn; const Row: Integer);


  private
    { Private declarations }
  public
    Grid1: TGrid;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}







procedure TFormMain.AlteracaoCliente(linha: Integer);
var
  alterar: TForm2;
  cliente, empresa: string;
  tipo : string;
begin
  if (linha > 0) then
  begin
    cliente := DataModule1.qryPesq.FieldByName('sCLI_Nome').AsString;
    empresa := DataModule1.qryPesq.FieldByName('sCLI_Empresa').AsString;
    linha := DataModule1.qryPesq.FieldByName('iCLI_id').AsInteger;
    alterar := TForm2.Create(Self);
    alterar.Show;
    alterar.alterarCliente(cliente, empresa, linha);
  end;
end;





procedure TFormMain.IncluirClick(Sender: TObject);
var inclusao: TForm;

begin
    inclusao := formIncluir.TForm1.Create(self);
    inclusao.Show;


end;




procedure TFormMain.AlterarClick(Sender: TObject);
var linha : Integer;
begin
  linha := DataModule1.qryPesq.RecNo;
  AlteracaoCliente(linha);
end;


procedure TFormMain.ExcluirClick(Sender: TObject);
var
  id: Integer;
  resposta: TModalResult;
begin
  id := DataModule1.qryPesq.FieldByName('iCLI_id').AsInteger;


  ShowMessage('O cliente com os seguintes atributos est� selecionado:'+ #13 +' Empresa: ' + DataModule1.qryPesq.FieldByName('sCLI_Empresa').AsString + #13 +'Cliente: ' + DataModule1.qryPesq.FieldByName('sCLI_Nome').AsString );
  resposta := MessageDlg('Tem certeza que deseja excluir o cliente?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

  if resposta = mrYes then
  begin
    DataModule1.ExcluirCliente(id);
    ShowMessage('Cliente exclu�do com sucesso.');
  end;
end;

procedure TFormMain.Grid1CellClick(const Column: TColumn; const Row: Integer);
begin
  Titulo.Text := DataModule1.qryPesq.FieldByName('sCLI_Nome').AsString;
end;

procedure TFormMain.Grid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  ShowMessage('Empresa: ' + DataModule1.qryPesq.FieldByName('sCLI_Empresa').AsString + #13 +'Cliente: ' + DataModule1.qryPesq.FieldByName('sCLI_Nome').AsString )
end;

procedure TFormMain.SairClick(Sender: TObject);
  begin
    DataModule1.FDConnection1.Close;
    Application.Terminate;
    Close;

  end;


end.
