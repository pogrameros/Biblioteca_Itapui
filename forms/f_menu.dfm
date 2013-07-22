object frm_menu: Tfrm_menu
  Left = 0
  Top = 0
  Caption = 'Biblioteca - Menu Principal'
  ClientHeight = 521
  ClientWidth = 1127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1127
    Height = 49
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastros'
    end
    object TabSheet2: TTabSheet
      Caption = 'Movimenta'#231#227'o'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 502
    Width = 1127
    Height = 19
    Panels = <
      item
        Text = 'Usu'#225'rio:'
        Width = 50
      end
      item
        Width = 200
      end
      item
        Text = 'Status:'
        Width = 50
      end
      item
        Width = 120
      end>
  end
  object rkGlassButton1: TrkGlassButton
    Left = 400
    Top = 175
    Width = 201
    Height = 137
    Caption = 'Glass'
    Color = clWhite
    ColorDown = clBlack
    ColorFrame = clGray
    GlossyLevel = 37
    DropDownAlignment = paLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 2
    OnClick = rkGlassButton1Click
  end
  object zconn: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    Port = 0
    User = 'supervisor'
    Protocol = 'mysql'
    Left = 24
    Top = 56
  end
end
