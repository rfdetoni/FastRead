object frmRead: TfrmRead
  Left = 0
  Top = 0
  AlphaBlend = True
  BiDiMode = bdLeftToRight
  Caption = 'FastRead - Leia sem mover os olhos'
  ClientHeight = 442
  ClientWidth = 677
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBiDiMode = False
  StyleElements = [seFont, seClient]
  OnClick = FormClick
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object pnlText: TPanel
    Left = 0
    Top = 41
    Width = 677
    Height = 401
    Align = alClient
    BevelOuter = bvNone
    Color = clMedGray
    ParentBackground = False
    TabOrder = 0
    OnClick = pnlTextClick
    OnMouseMove = pnlTextMouseMove
    DesignSize = (
      677
      401)
    object lblWord: TLabel
      Left = 298
      Top = 200
      Width = 15
      Height = 15
      Cursor = crHandPoint
      Alignment = taCenter
      Anchors = []
      Caption = '.....'
      Transparent = True
      OnDblClick = lblWordDblClick
      ExplicitTop = 199
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 41
    Align = alTop
    Color = clMedGray
    UseDockManager = False
    DockSite = True
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      677
      41)
    object Label1: TLabel
      Left = 470
      Top = 12
      Width = 116
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Palavras por segundo:'
    end
    object Panel1: TPanel
      Left = 0
      Top = 4
      Width = 81
      Height = 32
      BevelOuter = bvNone
      Caption = '&Abrir'
      TabOrder = 0
      OnClick = Panel1Click
    end
    object BtStart: TPanel
      Left = 88
      Top = 4
      Width = 57
      Height = 32
      BevelOuter = bvNone
      Caption = '&Iniciar'
      TabOrder = 1
      OnClick = BtStartClick
    end
    object btPause: TPanel
      Left = 176
      Top = 4
      Width = 57
      Height = 32
      BevelOuter = bvNone
      BorderWidth = 1
      Caption = '&Pausar'
      TabOrder = 2
      OnClick = btPauseClick
    end
    object SpinWPS: TSpinEdit
      Left = 592
      Top = 9
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      EditorEnabled = False
      MaxValue = 0
      MinValue = 1
      StyleElements = [seFont]
      TabOrder = 3
      Value = 0
      OnChange = SpinWPSChange
      OnKeyUp = SpinWPSKeyUp
      OnMouseUp = SpinWPSMouseUp
    end
  end
  object fileSelect: TOpenDialog
    Left = 560
    Top = 40
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 560
    Top = 89
  end
end
