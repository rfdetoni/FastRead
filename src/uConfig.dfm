object frmConfig: TfrmConfig
  AlignWithMargins = True
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 262
  ClientWidth = 286
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.SheetOfGlass = True
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 286
    Height = 229
    Align = alClient
    Color = clWindowFrame
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 282
    ExplicitHeight = 228
    object Label2: TLabel
      Left = 117
      Top = 107
      Width = 33
      Height = 15
      Alignment = taCenter
      Caption = 'TEXTO'
    end
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 286
    Height = 33
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 282
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 284
      Height = 33
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 280
      DesignSize = (
        284
        33)
      object BitBtn6: TBitBtn
        Left = 224
        Top = 4
        Width = 53
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Aplicar'
        TabOrder = 0
        OnClick = BitBtn6Click
        ExplicitWidth = 49
      end
      object btFonte: TBitBtn
        Left = -1
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Fonte'
        TabOrder = 1
        OnClick = btFonteClick
      end
      object BitBtn2: TBitBtn
        Left = 84
        Top = 4
        Width = 83
        Height = 25
        Caption = 'Cor de fundo'
        TabOrder = 2
        OnClick = BitBtn2Click
      end
    end
  end
  object FontDLG: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 40
    Top = 160
  end
  object ColorDLG: TColorDialog
    Left = 32
    Top = 88
  end
end
