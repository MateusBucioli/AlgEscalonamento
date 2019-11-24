unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Mask, Vcl.DBCtrls;

type
  Processo = record
    Ciclos: Integer;
    Ordem: Integer;
    Prioridade: Integer;
  end;

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
    cdsResultados: TClientDataSet;
    cdsResultadosProcesso: TStringField;
    cdsResultadosMetodo: TStringField;
    cdsResultadosTempoRetorno: TFloatField;
    dsRegistros: TDataSource;
    dsResultados: TDataSource;
    edtCiclos: TEdit;
    edtOrdemChegada: TEdit;
    edtPrioridade: TEdit;
    edtProcesso: TEdit;
    edtLimpar: TEdit;
    procedure btnFCFSClick(Sender: TObject);
    procedure btnSRTClick(Sender: TObject);
    procedure btnSJFClick(Sender: TObject);
    procedure btnRRClick(Sender: TObject);
    procedure btnAdicionarProcessoClick(Sender: TObject);
    procedure btnLimpaRegClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

{$R *.dfm}

procedure TfrmPrinc.btnAdicionarProcessoClick(Sender: TObject);
begin
  try
    try
      cdsRegistros.Append;
      cdsRegistrosProcesso.AsString := UpperCase(edtProcesso.Text);
      cdsRegistrosOrdemChegada.AsInteger := StrToInt(edtOrdemChegada.Text);
      cdsRegistrosCiclosCPU.AsInteger := StrToInt(edtCiclos.Text);
      cdsRegistrosPrioridade.AsInteger := StrToInt(edtPrioridade.Text);
    finally
      cdsRegistros.Post;
    end;
  except
    on e:Exception do
    begin
      ShowMessage('Erro ao adicionar dados na tabela.'+#13+' Motivo: ' + e.message);
    end;
  end;
end;

procedure TfrmPrinc.btnFCFSClick(Sender: TObject);
begin
  //
end;

procedure TfrmPrinc.btnLimpaRegClick(Sender: TObject);
begin
  try
    cdsResultados.First;
    cdsRegistros.First;    
    
    if edtLimpar.Text <> '' then
    begin
      while not cdsResultados.EOF do
      begin
        if cdsResultadosProcesso.AsString = UpperCase(edtLimpar.Text) then
          cdsResultados.Delete
        else
          cdsResultados.Next;
      end;
            
      while not cdsRegistros.EOF do
      begin
        if cdsRegistrosProcesso.AsString = UpperCase(edtLimpar.Text) then
          cdsRegistros.Delete
        else
          cdsRegistros.Next;
      end;      
    end
    else
    begin
      edtProcesso.Text := '';
      edtOrdemChegada.Text := '';
      edtCiclos.Text := '';;
      edtPrioridade.Text := '';
      
      while not cdsResultados.EOF do
      begin
        cdsResultados.Delete;
      end;
            
      while not cdsRegistros.EOF do
      begin
        cdsRegistros.Delete;
      end;            
    end;
  except
    on e:Exception do
    begin
      ShowMessage('Erro ao limpar os registros.'+#13+' Motivo: ' + e.message);
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
