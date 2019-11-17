program PrjAlgEscalonamento;

uses
  Vcl.Forms,
  main in 'main.pas' {frmPrinc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.Run;
end.
