unit FastRead.Singleton.Configuration;

interface

uses
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  System.UITypes,
  SysUtils;

type
  IConfig = Interface
  ['{43DE52EA-7542-49DE-B82C-9E9F6FCFAF11}']
    function GetFont : TFont;
    function GetBGColor : TColor;
    procedure putFont(Const aFont: Tfont);
    procedure putBGColor(const AColor : TColor);
    function setFont(Const aFont : TFont) : IConfig;
    function setBGColor(Const aColor : TColor) : IConfig;
    property Font : TFont read GetFont write Putfont;
    property BGColor : TColor read GetBGColor write putBGColor;
  End;

  TConfig = class (TInterfacedObject, iConfig)
    Strict private
      FBgColor: TColor;
      FFont : TFont;
      procedure putFont(Const aFont: Tfont);
      procedure putBGColor(const AColor : TColor);

      function GetBGColor : TColor;
  private

    public
      class function Instance: IConfig;
      constructor Create;
      destructor Destroy;override;
      function setFont(Const aFont : TFont) : IConfig;
      function setBGColor(Const aColor : TColor) : IConfig;
      function GetFont : TFont;

  end;
implementation

{ TConfig }

var
  FInstance: IConfig;


constructor TConfig.Create;
begin
  inherited Create;
  if not assigned(FFont) then
  begin
    FFont := tFont.Create;
  end;
  FFont.Color := vcl.Graphics.clBlack;
  FFont.Name := 'Segoe UI';
  FFont.Size := 12;

  FBgColor := clGrayText;

end;


function TConfig.GetBGColor: TColor;
begin
  result := FBgColor;
end;

function TConfig.GetFont: TFont;
begin
  Result := FFont;
end;

procedure TConfig.putBGColor(const AColor: TColor);
begin
  if FBgColor = AColor then
  begin
    exit;
  end;

  FBgColor := AColor;
end;

procedure TConfig.putFont(const aFont: Tfont);
begin
  if FFont = AFont then
  begin
    exit;
  end;

  FFont := AFont;
end;

function TConfig.setBGColor(const aColor: TColor): IConfig;
begin
  putBgColor(aColor);
  Result := Self;
end;

function TConfig.setFont(const aFont: TFont): IConfig;
begin
  putFont(afont);
  Result := Self;
end;

class function TConfig.Instance: IConfig;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := Create;
  end;

  Result := FInstance;
end;

Destructor TConfig.Destroy;
begin
{  if assigned(fFont) then
  begin
   FFont.free;
  end;
 } inherited;
end;

initialization
  FInstance := nil;


end.
