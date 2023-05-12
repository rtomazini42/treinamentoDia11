unit formAlterar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, DACs;

type
  TForm2 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    btnAlterar: TButton;
    btnCancelar: TButton;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
  entradaCliente: TEdit;
  entradaEmpresa: TEdit;
  procedure alterarCliente(cliente: string; empresa: string; linha : Integer);
  end;

var
  Form2: TForm2;
  var id: Integer;

implementation

{$R *.fmx}



procedure TForm2.alterarCliente(cliente: string; empresa: string; linha: Integer);

begin

          id := linha;
          ShowMessage('Alterando cliente: ' + cliente + ' da empresa ' + empresa);

end;






procedure TForm2.btnAlterarClick(Sender: TObject);
var
  cliente, empresa: string;

begin

  cliente := entradaCliente.Text;
  empresa := entradaEmpresa.Text;

  // Verifica se os campos estão preenchidos
  if (cliente <> '') and (empresa <> '') then
  begin
    //id := FIDCliente; // Se estiver usando uma variável global

    cliente := entradaCliente.Text;
    empresa := entradaEmpresa.Text;

    // Verifica se os campos estão preenchidos
    if (cliente <> '') and (empresa <> '') then
    begin
        // Realize a alteração no banco de dados usando o TFDQuery
        DataModule1.qryExec.Close;
        DataModule1.qryExec.SQL.Clear;
        DataModule1.qryExec.SQL.Add('UPDATE CLIENTE SET sCLI_Nome = :Cliente, sCLI_Empresa = :Empresa WHERE iCLI_id = :ID');
        DataModule1.qryExec.ParamByName('Cliente').AsString := cliente;
        DataModule1.qryExec.ParamByName('Empresa').AsString := empresa;
        DataModule1.qryExec.ParamByName('ID').AsInteger := id;
        DataModule1.qryExec.ExecSQL;
        DataModule1.qryExec.Close;

        ShowMessage('Registro alterado com sucesso');
    end
  end

  else
    ShowMessage('Preencha todos os campos');
end;

procedure TForm2.btnCancelarClick(Sender: TObject);
begin
       ShowMessage('Cancelado');
       Close;
end;





end.


