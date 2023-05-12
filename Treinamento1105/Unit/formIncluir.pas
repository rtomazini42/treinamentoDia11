unit formIncluir;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,  DACs;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    entradaCliente: TEdit;
    entradaEmpresa: TEdit;
    btnIncluir: TButton;
    btnCancelar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure InclusaoCliente(cliente: String; empresa: String);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.InclusaoCliente(cliente: String; empresa: String);
begin
  if (Length(cliente) = 0) and (Length(empresa) = 0) then
  begin
       ShowMessage('Não pode haver campos vazios na inclusão');
  end
  else
  begin
    DataModule1.qryExec.Close;
    DataModule1.qryExec.SQL.Clear;

    DataModule1.qryExec.SQL.Add('INSERT INTO CLIENTE (sCLI_Nome, sCLI_Empresa) VALUES (:Nome, :Empresa)');
    DataModule1.qryExec.ParamByName('Nome').AsString := cliente;
    DataModule1.qryExec.ParamByName('Empresa').AsString := empresa;
    DataModule1.qryExec.ExecSQL;

    DataModule1.qryExec.Close;
    ShowMessage('Incluido com sucesso');
    DataModule1.qryPesq.Refresh;
    Close;
  end;



end;



procedure TForm1.btnIncluirClick(Sender: TObject);
begin
  var Cliente, Empresa :String;

  Cliente := entradaCliente.Text;
  Empresa := entradaEmpresa.Text;

  InclusaoCliente(Cliente,Empresa);
end;

end.
