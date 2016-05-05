object MainForm: TMainForm
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Choose file in which describes markdown syntax'
  ClientHeight = 215
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 62
    Width = 215
    Height = 13
    Caption = 'Choose markdown elements count in one line'
  end
  object Label3: TLabel
    Left = 416
    Top = 62
    Width = 106
    Height = 13
    Caption = 'Choose fuzz file count'
  end
  object Label4: TLabel
    Left = 384
    Top = 128
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 0
    Top = 160
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 479
    Top = 0
    Width = 301
    Height = 21
    Caption = 'Chose input file with simple text'
    Enabled = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Input_text: TEdit
    Left = 0
    Top = 0
    Width = 473
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 479
    Top = 31
    Width = 301
    Height = 25
    Caption = 'Choose folder in which fuzzed file will be saved'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Output_Folder: TEdit
    Left = 0
    Top = 31
    Width = 473
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object Button3: TButton
    Left = 0
    Top = 108
    Width = 780
    Height = 53
    Caption = 'Create fuzzed files'
    Enabled = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object CountElements: TEdit
    Left = 0
    Top = 81
    Width = 321
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 5
    Text = '50'
  end
  object CountFiles: TEdit
    Left = 416
    Top = 81
    Width = 321
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 6
    Text = '50'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 176
    Width = 780
    Height = 29
    TabOrder = 7
  end
  object MainMenu1: TMainMenu
    Left = 360
    Top = 176
    object N1: TMenuItem
      Caption = 'Open markdown syntax file'
      OnClick = N1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text File|*.txt'
    Left = 176
    Top = 152
  end
end
