unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPrinc = class(TForm)
    grpInfo: TGroupBox;
    txtProcesso: TStaticText;
    txtCiclos: TStaticText;
    txtOrdemChegada: TStaticText;
    txtPrioridade: TStaticText;
    grpResultados: TGroupBox;
    grdResultados: TDBGrid;
    grpRegistros: TGroupBox;
    grdRegistros: TDBGrid;
    btnAdicionarProcesso: TBitBtn;
    btnLimpaReg: TBitBtn;
    grpMetodos: TGroupBox;
    btnSRT: TBitBtn;
    btnSJF: TBitBtn;
    btnRR: TBitBtn;
    btnFCFS: TBitBtn;
    cdsRegistros: TClientDataSet;
    cdsRegistrosProcesso: TStringField;
    cdsRegistrosCiclosCPU: TIntegerField;
    cdsRegistrosOrdemChegada: TIntegerField;
    cdsRegistrosPrioridade: TSmallintField;
    dsRegistros: TDataSource;
    edtCiclos: TEdit;
    edtOrdemChegada: TEdit;
    edtPrioridade: TEdit;
    edtProcesso: TEdit;
    edtLimpar: TEdit;
    dspRegistros: TDataSetProvider;
    cdsResultados: TClientDataSet;
    cdsResultadosProcesso: TStringField;
    cdsResultadosCiclosCPU: TIntegerField;
    cdsResultadosOrdemChegada: TIntegerField;
    cdsResultadosPrioridade: TSmallintField;
    cdsResultadosTempoRetorno: TFloatField;
    cdsResultadosMetodo: TStringField;
    dsResultado: TDataSource;
    procedure btnFCFSClick(Sender: TObject);
    procedure btnSRTClick(Sender: TObject);
    procedure btnSJFClick(Sender: TObject);
    procedure btnRRClick(Sender: TObject);
    procedure btnAdicionarProcessoClick(Sender: TObject);
    procedure btnLimpaRegClick(Sender: TObject);

  private
    { Private declarations }
    procedure limpaRegistroEscolhido;
    procedure limpaTodosRegistros;
    procedure adicionaRegistro;

  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

{$R *.dfm}

procedure TfrmPrinc.btnAdicionarProcessoClick(Sender: TObject);
begin
  adicionaRegistro;
end;

procedure TfrmPrinc.adicionaRegistro;
begin
  try
    cdsRegistros.Append;
    if cdsRegistros.Locate('processo', edtProcesso.Text, [loCaseInsensitive]) then
    begin
      ShowMessage('Já existe um processo com essa nomenclatura.');
      Exit;
    end
    else
    begin
      cdsRegistros.Append;
      cdsRegistrosProcesso.AsString := UpperCase(edtProcesso.Text);
      cdsRegistrosOrdemChegada.AsInteger := StrToInt(edtOrdemChegada.Text);
      cdsRegistrosCiclosCPU.AsInteger := StrToInt(edtCiclos.Text);
      cdsRegistrosPrioridade.AsInteger := StrToInt(edtPrioridade.Text);
      cdsRegistros.Post;
    end;
  except
    on e:Exception do
    begin
      ShowMessage('Erro ao adicionar dados na tabela.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.btnLimpaRegClick(Sender: TObject);
begin
  if edtLimpar.Text <> '' then
  begin
    limpaRegistroEscolhido;
  end
  else
  begin
    limpaTodosRegistros;
  end;
end;

procedure TfrmPrinc.limpaRegistroEscolhido;
begin
  try
    cdsResultados.Active := True;
    cdsResultados.First;
    while not cdsResultados.EOF do
    begin
      if cdsResultadosProcesso.AsString = UpperCase(edtLimpar.Text) then
        cdsResultados.Delete
      else
        cdsResultados.Next;
    end;

    cdsRegistros.Active := True;
    cdsRegistros.First;
    while not cdsRegistros.EOF do
    begin
      if cdsRegistrosProcesso.AsString = UpperCase(edtLimpar.Text) then
        cdsRegistros.Delete
      else
        cdsRegistros.Next;
    end;
  except
  on e:Exception do
    begin
      ShowMessage('Erro ao limpar os registros escolhidos.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.limpaTodosRegistros;
begin
  try
    edtProcesso.Text := '';
    edtOrdemChegada.Text := '';
    edtCiclos.Text := '';;
    edtPrioridade.Text := '';

    cdsResultados.Active := True;
    cdsResultados.EmptyDataSet;

    cdsRegistros.Active := True;
    cdsRegistros.EmptyDataSet;
  except
  on e:Exception do
    begin
      ShowMessage('Erro ao limpar os registros.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.btnFCFSClick(Sender: TObject);
var
  vTempoTotal: Double;
begin
  try
    cdsResultados.Active := True;
    cdsResultados.EmptyDataSet;

    cdsRegistros.Active := True;
    cdsRegistros.First;

    cdsResultados.Active := True;
    cdsResultados.First;

    while (not cdsRegistros.Eof) do
    begin
      cdsResultados.Append;
      cdsResultadosProcesso.AsString := cdsRegistrosProcesso.AsString;
      cdsResultadosPrioridade.AsInteger := cdsRegistrosPrioridade.AsInteger;
      cdsResultadosOrdemChegada.AsInteger := cdsRegistrosOrdemChegada.AsInteger;
      cdsResultadosCiclosCPU.AsInteger := cdsRegistrosCiclosCPU.AsInteger;

      cdsResultadosMetodo.AsString := 'FCFS';

      vTempoTotal := vTempoTotal + cdsRegistrosCiclosCPU.AsFloat;
      cdsResultadosTempoRetorno.AsFloat := vTempoTotal;

      cdsRegistros.Next;
      cdsResultados.Next;
    end;
  except
  on e:Exception do
    begin
      ShowMessage('Erro na execução do método.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.btnRRClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrinc.btnSJFClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrinc.btnSRTClick(Sender: TObject);
begin
  //
end;

end.
