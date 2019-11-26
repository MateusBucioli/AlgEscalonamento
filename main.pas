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
    cdsResultados: TClientDataSet;
    cdsResultadosProcesso: TStringField;
    cdsResultadosTempoRetorno: TIntegerField;
    cdsResultadosCiclosCPU: TIntegerField;
    cdsResultadosTempoMedio: TFloatField;
    cdsResultadosMetodo: TStringField;
    cdsResultadosOrdemChegada: TIntegerField;
    cdsResultadosPrioridade: TIntegerField;
    dsResultados: TDataSource;
    cdsAux: TClientDataSet;
    procedure btnFCFSClick(Sender: TObject);
    procedure btnSRTClick(Sender: TObject);
    procedure btnSJFClick(Sender: TObject);
    procedure btnRRClick(Sender: TObject);
    procedure btnAdicionarProcessoClick(Sender: TObject);
    procedure btnLimpaRegClick(Sender: TObject);

  private
    { Private declarations }
    vgTempoTotal: Integer;
    vgCount: Integer;
    vgTempomedio: Integer;
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
begin
  cdsRegistros.IndexName := 'OrdemChegadaCrescente';
  cdsResultados.IndexName := 'OrdemChegadaCrescente';

  vgTempoTotal := 0;
  vgTempomedio := 0;
  vgCount := 0;

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

      vgTempoTotal := vgTempoTotal + cdsRegistrosCiclosCPU.AsInteger;
      cdsResultadosTempoRetorno.AsInteger := vgTempoTotal;

      vgTempomedio := vgTempomedio + vgTempoTotal;
      vgCount := vgCount + 1;
      cdsResultadosTempoMedio.AsFloat := vgTempomedio / vgCount;

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

procedure TfrmPrinc.btnSJFClick(Sender: TObject);
begin
  cdsResultados.IndexName := 'CiclosCPUCrescente';
  cdsRegistros.IndexName := 'CiclosCPUCrescente';

  vgTempoTotal := 0;
  vgTempomedio := 0;
  vgCount := 0;

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

      cdsResultadosMetodo.AsString := 'SJF';

      vgTempoTotal := vgTempoTotal + cdsRegistrosCiclosCPU.AsInteger;
      cdsResultadosTempoRetorno.AsInteger := vgTempoTotal;

      vgTempomedio := vgTempomedio + vgTempoTotal;
      vgCount := vgCount + 1;
      cdsResultadosTempoMedio.AsFloat := vgTempomedio / vgCount;

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
var
  vQuantum: Integer;
  vRetorno: Boolean;

begin
// Metodo está falhando devido a um erro na implementação do CDS
// Devido a falta de tempo a correção do erro não foi possível
// O método RR depende principalmente de um espaço de tempo denominado qunatum
// Onde todos os processos podem ser executados independentes de uas caracteristicas contanto
// que o quantum nao finalize, ao final do quantum o algoritmo ira visualizar o proximo processo
// e só retornará ao processo que expirou quando a lista for completamente finalizada
// seguindo esse fluxo, ele percorrera inumeras vezes a lista até todos os processos sejam finalizados

  cdsResultados.IndexName := '';
  cdsRegistros.IndexName := '';

  vgTempoTotal := 0;
  vgTempomedio := 0;
  vgCount := 0;
  vQuantum := 50;
  vRetorno := False;

  try
    cdsResultados.Active := True;
    cdsResultados.EmptyDataSet;

    cdsRegistros.Active := True;
    cdsRegistros.First;

    cdsResultados.Active := True;
    cdsResultados.First;

    cdsResultados.Append;
    while (not cdsRegistros.Eof) do
    begin
      if cdsRegistrosCiclosCPU.AsInteger > vQuantum then
      begin
        cdsResultadosCiclosCPU.AsInteger := cdsRegistrosCiclosCPU.AsInteger - vQuantum;
        cdsResultadosTempoRetorno.AsInteger := cdsRegistrosCiclosCPU.AsInteger;
        vRetorno := True;
      end
      else
      begin
        cdsResultadosProcesso.AsString := cdsRegistrosProcesso.AsString;
        cdsResultadosPrioridade.AsInteger := cdsRegistrosPrioridade.AsInteger;
        cdsResultadosOrdemChegada.AsInteger := cdsRegistrosOrdemChegada.AsInteger;
        cdsResultadosCiclosCPU.AsInteger := cdsRegistrosCiclosCPU.AsInteger;

        cdsResultadosMetodo.AsString := 'RR';

        vgTempoTotal := vgTempoTotal + cdsRegistrosCiclosCPU.AsInteger;
        cdsResultadosTempoRetorno.AsInteger := vgTempoTotal;

        vgTempomedio := vgTempomedio + vgTempoTotal;
        vgCount := vgCount + 1;
        cdsResultadosTempoMedio.AsFloat := vgTempomedio / vgCount;
      end;

      if (cdsRegistros.Eof) = true then
      begin
        if vRetorno then
        begin
          cdsResultados.Active := True;
          cdsResultados.First;

          cdsRegistros.Active := True;
          cdsRegistros.First;
        end;
      end
      else
      begin
        cdsRegistros.Next;
        cdsResultados.Next;
      end;
    end;
  except
  on e:Exception do
    begin
      ShowMessage('Erro na execução do método.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.btnSRTClick(Sender: TObject);
begin
  cdsResultados.IndexName := 'CiclosCPUCrescente';
  cdsRegistros.IndexName := 'CiclosCPUCrescente';

  vgTempoTotal := 0;
  vgTempomedio := 0;
  vgCount := 0;

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

      cdsResultadosMetodo.AsString := 'SRT';

      vgTempoTotal := vgTempoTotal + cdsRegistrosCiclosCPU.AsInteger;
      cdsResultadosTempoRetorno.AsInteger := vgTempoTotal;

      vgTempomedio := vgTempomedio + vgTempoTotal;
      vgCount := vgCount + 1;
      cdsResultadosTempoMedio.AsFloat := vgTempomedio / vgCount;

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

end.
