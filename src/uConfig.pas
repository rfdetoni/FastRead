unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConfig = class(TForm)
    FontDLG: TFontDialog;
    ColorDLG: TColorDialog;
    Panel1: TPanel;
    MenuPanel: TPanel;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    btFonte: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure btFonteClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetPAnelColor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation
  uses FastRead.Singleton.Configuration;

{$R *.dfm}

procedure TfrmConfig.BitBtn2Click(Sender: TObject);
begin
  if ColorDLG.execute then
  begin
    TConfig.Instance.BGColor := ColorDlg.Color;
    SetPanelColor;
  end;
end;


procedure TFrmConfig.SetPanelColor;
begin
  for var i := 0 to Self.ComponentCount - 1 do
  begin
    if self.Components[i] is TPanel then
    begin
      tPanel(self.Components[I]).Color := TConfig.Instance.BGColor;
    end;
  end;
end;

procedure TfrmConfig.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TfrmConfig.btFonteClick(Sender: TObject);
begin
  if fontDlg.Execute then
  begin
    TConfig.Instance.setfont(FontDlg.Font);
    Label2.Font := TConfig.Instance.Font;
  end;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  SetPanelColor;
end;

end.
