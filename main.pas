unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient;

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
    edtProcesso: TEdit;
    edtCiclos: TEdit;
    txtCiclos: TStaticText;
    edtOrdemChegada: TEdit;
    txtOrdemChegada: TStaticText;
    txtPrioridade: TStaticText;
    edtPrioridade: TEdit;
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
    procedure btnFCFSClick(Sender: TObject);
    procedure btnSRTClick(Sender: TObject);
    procedure btnSJFClick(Sender: TObject);
    procedure btnRRClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

{$R *.dfm}

procedure TfrmPrinc.btnFCFSClick(Sender: TObject);
begin
  //
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
