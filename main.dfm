object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'Algoritmos de escalonamento'
  ClientHeight = 286
  ClientWidth = 704
  Color = clBtnFace
  Constraints.MinHeight = 325
  Constraints.MinWidth = 720
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpInfo: TGroupBox
    Left = 0
    Top = 0
    Width = 239
    Height = 139
    Hint = 'Informa'#231#245'es do Processo'
    Align = alCustom
    Caption = 'Informa'#231#245'es'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object txtProcesso: TStaticText
      Left = 4
      Top = 28
      Width = 47
      Height = 17
      Align = alCustom
      Caption = 'Processo'
      TabOrder = 0
    end
    object edtProcesso: TEdit
      Left = 106
      Top = 24
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 1
    end
    object edtCiclos: TEdit
      Left = 106
      Top = 52
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 2
    end
    object txtCiclos: TStaticText
      Left = 4
      Top = 55
      Width = 54
      Height = 17
      Align = alCustom
      Caption = 'Ciclos CPU'
      TabOrder = 3
    end
    object edtOrdemChegada: TEdit
      Left = 106
      Top = 80
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 4
    end
    object txtOrdemChegada: TStaticText
      Left = 4
      Top = 83
      Width = 97
      Height = 17
      Align = alCustom
      Caption = 'Ordem de Chegada'
      TabOrder = 5
    end
    object txtPrioridade: TStaticText
      Left = 4
      Top = 110
      Width = 52
      Height = 17
      Align = alCustom
      Caption = 'Prioridade'
      TabOrder = 6
    end
    object edtPrioridade: TEdit
      Left = 106
      Top = 107
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 7
    end
  end
  object grpMetodos: TGroupBox
    Left = 0
    Top = 143
    Width = 239
    Height = 139
    Hint = 'M'#233'todo de escalonamento a ser utilizado'
    Caption = 'Metodos'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object btnFCFS: TBitBtn
      Left = 4
      Top = 20
      Width = 75
      Height = 25
      Hint = 'First Come First Served'
      Align = alCustom
      Caption = 'FCFS'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnFCFSClick
    end
    object btnSRT: TBitBtn
      Left = 4
      Top = 49
      Width = 75
      Height = 25
      Hint = 'Shortest Remaining Time'
      Caption = 'SRT'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnSRTClick
    end
    object btnSJF: TBitBtn
      Left = 4
      Top = 78
      Width = 75
      Height = 25
      Hint = 'Shortest Job First'
      Caption = 'SJF'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSJFClick
    end
    object btnRR: TBitBtn
      Left = 4
      Top = 107
      Width = 75
      Height = 25
      Hint = 'Round Robin'
      Align = alCustom
      Caption = 'RR'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnRRClick
    end
  end
  object grpResultados: TGroupBox
    Left = 238
    Top = 143
    Width = 465
    Height = 139
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Resultados'
    TabOrder = 2
    object dbgrdResultados: TDBGrid
      Left = 2
      Top = 15
      Width = 461
      Height = 122
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object grpRegistros: TGroupBox
    Left = 238
    Top = 0
    Width = 465
    Height = 139
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Registros'
    TabOrder = 3
    object grdRegistros: TDBGrid
      Left = 2
      Top = 15
      Width = 461
      Height = 122
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
