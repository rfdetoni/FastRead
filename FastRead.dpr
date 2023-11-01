program FastRead;

uses
  fastmm4,
  Vcl.Forms,
  SysUtils,
  uFrmRead in 'src\uFrmRead.pas' {frmRead},
  uConfig in 'src\uConfig.pas' {frmConfig},
  FastRead.Singleton.Configuration in 'src\Singleton\FastRead.Singleton.Configuration.pas',
  PdfiumCore in 'third-part\PdfiumCore.pas',
  PdfiumCtrl in 'third-part\PdfiumCtrl.pas',
  PdfiumLib in 'third-part\PdfiumLib.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRead, frmRead);
  Application.Run;
end.
