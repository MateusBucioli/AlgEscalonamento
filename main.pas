unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus;

type
  Processo = record
    Ciclos: Integer;
    Ordem: Integer;
    Prioridade: Integer;
  end;

type
  TfrmPrinc = class(TForm)
    grpResultados: TGroupBox;
    btnFCFS: TBitBtn;
    btnRR: TBitBtn;
    btnSJF: TBitBtn;
    btnSRT: TBitBtn;
    grpInfo: TGroupBox;
    txtProcesso: TStaticText;
    edtProcesso: TEdit;
    edtCiclos: TEdit;
    txtCiclos: TStaticText;
    edtOrdemChegada: TEdit;
    txtOrdemChegada: TStaticText;
    txtPrioridade: TStaticText;
    edtPrioridade: TEdit;
    grpRegistros: TGroupBox;
    scrlbxRegistros: TScrollBox;
    scrlbxResultados: TScrollBox;
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