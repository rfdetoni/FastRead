unit uFrmRead;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ToolWin,
  uConfig,
  Vcl.ExtCtrls,
  PdfiumCore,
  PdfiumCtrl,
  Vcl.Clipbrd,
  Vcl.Samples.Spin,
  System.Threading;

type
  TfrmRead = class(TForm)
    fileSelect: TOpenDialog;
    pnlText: TPanel;
    lblWord: TLabel;
    pnlMenu: TPanel;
    Timer1: TTimer;
    Panel1: TPanel;
    BtStart: TPanel;
    btPause: TPanel;
    Label1: TLabel;
    SpinWPS: TSpinEdit;
    procedure lblWordDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pnlTextMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure SpinWPSChange(Sender: TObject);
    procedure btPauseClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure pnlTextClick(Sender: TObject);
    procedure SpinWPSKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinWPSMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    var
      Text : TStringList;
      WordList :TStringList;
      fSpeed : INTEGER;
      Play : Boolean;
    function getFPdf: TstringList;
    procedure SetPDF(const Value: TstringList);
    procedure SetPanelColor;
    function GetSpeed: Integer;
    procedure SetSpeed(const Value: Integer);
    procedure TreatText;
    property FPdf :TstringList  read getFPdf Write SetPDF;
    procedure ReadPdf(const APDF: String);
    { Private declarations }
  public
    property Speed: Integer read GetSpeed write SetSpeed;
  end;

var
  frmRead: TfrmRead;

implementation
  uses  FastRead.Singleton.Configuration;

{$R *.dfm}




procedure TfrmRead.FormClick(Sender: TObject);
begin
  frmRead.borderStyle := bsSizeable;
end;

procedure TfrmRead.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Text) then
  begin
    Text.DisposeOf;
  end;
  if Assigned(WordList) then
  begin
    WordList.DisposeOf;
  end;
end;

procedure TfrmRead.FormCreate(Sender: TObject);
begin
  {$IFDEF CPUX64}
  PDFiumDllDir := ExtractFilePath(ParamStr(0)) + 'x64';
  {$ELSE}
  PDFiumDllDir := ExtractFilePath(ParamStr(0)) + 'x86';
  {$ENDIF CPUX64}
end;

procedure TfrmRead.FormResize(Sender: TObject);
begin
  lblWord.Left := (pnlText.Width - lblWord.Width) div 2;
  lblWord.Top := (pnlText.Height - lblWord.Height) div 2;
end;

procedure TfrmRead.FormShow(Sender: TObject);
begin
  lblWord.Font := TConfig.Instance.Font;
  frmRead.Color := TConfig.Instance.BGColor;
end;

function TfrmRead.getFPdf: TstringList;
begin
  result := FPdf;
end;

function TfrmRead.GetSpeed: Integer;
begin
  result := FSpeed;
end;

procedure TfrmRead.lblWordDblClick(Sender: TObject);
var config : TfrmConfig;
begin
  config := TfrmConfig.Create(self);
  with config do
  begin
      showModal;
      lblWord.Font := TConfig.Instance.Font;
      SetPanelColor;
  end;
end;

procedure TfrmRead.Panel1Click(Sender: TObject);
begin
  if fileSelect.Execute then
  begin
    ReadPDF(FileSelect.FileName);
  end;
end;

procedure TfrmRead.btPauseClick(Sender: TObject);
begin
  case Play of
    true  :
    begin
      Timer1.Enabled := false;
      btPause.Caption :='&Retomar';
    end;
    false :
    begin
      Timer1.Enabled := true;
      btPause.Caption :='&Pausar';
    end;
  end;
  play := Timer1.Enabled;
end;

procedure TfrmRead.BtStartClick(Sender: TObject);
begin
  if not btStart.Enabled then
  begin
    exit;
  end;
  TreatText;
  btStart.Enabled := false;
  LblWord.Tag := 0; // Zere a tag para começar do início do TStringList
  Timer1.Enabled := True;
  play := true;
end;

procedure TFrmRead.TreatText;
begin
  if not assigned(WordList) then
  begin
    WordList := TStringList.Create;
  end;
  ExtractStrings([' ', #13, #10], [], PChar(Text.Text), WordList);
end;

procedure TfrmRead.ReadPdf(Const APDF : String);
Var
  PDF : TPDfControl;
  s : String;
begin
  pdf := nil;
  Text := TStringList.Create;
  try
    PDF := TPdfControl.Create(Self);
    pdf.Parent := self;
    PDf.Font := TConfig.Instance.getFont;
    SetPanelColor;
    PDF.LoadFromFile(APDF);

    for var Index := 0 to pred(pdf.PageCount) do
    begin
      pdf.PageIndex := Index;
      PDF.SelectAll;
      Text.Add(pdf.SelText);
     // application.UseRightToLeftAlignment;
      lblWord.Caption := 'Carregando texto...';
      Application.ProcessMessages;
    end;
    lblWord.Caption:= 'Pronto';
    BtStart.Enabled := true;
    btPause.Enabled := true;
  finally
    Pdf.disposeOf;
  end;
end;

procedure TfrmRead.SetPanelColor;
begin
  for var i := 0 to Self.ComponentCount - 1 do
  begin
    if self.Components[i] is TPanel then
    begin
      tPanel(self.Components[I]).Color := TConfig.Instance.BGColor;
    end;
  end;
  SpinWPS.Color := TConfig.Instance.BGColor;

end;

procedure TfrmRead.SetPDF(const Value: TstringList);
begin
  if FPDF = Value then
  begin
    exit;
  end;
  fPdf := value;
end;

procedure TfrmRead.SetSpeed(const Value: Integer);
begin
   if FSpeed = value then
   begin
     exit;
   end;
   FSpeed := value;
end;

procedure TfrmRead.SpinWPSChange(Sender: TObject);
Var
_Speed : Integer;
begin
(*  case SpinWPS.Text = '0' of
    true  : _speed := 1;
    false : _Speed := StrToInt(SpinWPS.Text);
  end;
  Timer1.Interval := 1000 div _speed ;   *)
end;

procedure TfrmRead.SpinWPSKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if SpinWPS.text = '0' then
 begin
   exit;
 end;
 Timer1.Interval := 1000 div StrToInt(SpinWPS.Text);
end;

procedure TfrmRead.SpinWPSMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if SpinWPS.text = '0' then
 begin
   exit;
 end;
  Timer1.Interval := 1000 div StrToInt(SpinWPS.Text); ;
end;

procedure TfrmRead.Timer1Timer(Sender: TObject);
begin
 if (lblWord.Tag < WordList.Count) then
  begin
    lblWord.Caption := WordList[lblWord.Tag];
    lblWord.Left := (pnlText.Width - lblWord.Width) div 2;
    lblWord.Tag := lblWord.Tag + 1;
  end
  else
  begin
    Timer1.Enabled := False;
    lblWord.Caption := '...FIM...';
  end;
end;

procedure TfrmRead.pnlTextClick(Sender: TObject);
begin
  case frmRead.borderStyle = bsNone of
    true  : frmRead.borderStyle := bsSizeable;
    false : frmRead.borderStyle := bsNone;
  end;
end;

procedure TfrmRead.pnlTextMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 pnlMenu.Visible := true;
end;

end.
