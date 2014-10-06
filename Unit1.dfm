object Form1: TForm1
  Left = 694
  Top = 453
  AutoScroll = False
  AutoSize = True
  BorderIcons = []
  Caption = 'Form1'
  ClientHeight = 107
  ClientWidth = 220
  Color = clCaptionText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 32
    Width = 220
    Height = 75
    Caption = 'BTC-E '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -67
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnDblClick = Label1DblClick
  end
  object Label2: TLabel
    Left = 8
    Top = 0
    Width = 68
    Height = 16
    Caption = 'by Kolja153'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
