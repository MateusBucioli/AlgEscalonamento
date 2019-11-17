object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'Algoritmos de escalonamento'
  ClientHeight = 292
  ClientWidth = 734
  Color = clBtnFace
  Constraints.MinHeight = 325
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpResultados: TGroupBox
    Left = 0
    Top = 144
    Width = 734
    Height = 148
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Resultados'
    TabOrder = 0
    object btnFCFS: TBitBtn
      Left = 3
      Top = 19
      Width = 75
      Height = 25
      Caption = 'FCFS'
      TabOrder = 0
      OnClick = btnFCFSClick
    end
    object btnRR: TBitBtn
      Left = 3
      Top = 106
      Width = 75
      Height = 25
      Caption = 'RR'
      TabOrder = 1
      OnClick = btnRRClick
    end
    object btnSJF: TBitBtn
      Left = 3
      Top = 77
      Width = 75
      Height = 25
      Caption = 'SJF'
      TabOrder = 2
      OnClick = btnSJFClick
    end
    object btnSRT: TBitBtn
      Left = 3
      Top = 48
      Width = 75
      Height = 25
      Caption = 'SRT'
      TabOrder = 3
      OnClick = btnSRTClick
    end
    object scrlbxResultados: TScrollBox
      AlignWithMargins = True
      Left = 81
      Top = 18
      Width = 648
      Height = 125
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
    end
  end
  object grpInfo: TGroupBox
    Left = 0
    Top = 0
    Width = 268
    Height = 144
    Align = alLeft
    Caption = 'Informa'#231#245'es'
    TabOrder = 1
    ExplicitLeft = -1
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
      Left = 121
      Top = 24
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 1
    end
    object edtCiclos: TEdit
      Left = 121
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
      Left = 121
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
      Left = 121
      Top = 107
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 7
    end
  end
  object grpRegistros: TGroupBox
    Left = 268
    Top = 0
    Width = 466
    Height = 144
    Align = alClient
    Caption = 'Registros'
    TabOrder = 2
    object scrlbxRegistros: TScrollBox
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 456
      Height = 121
      Align = alClient
      BevelOuter = bvRaised
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 17
    end
  end
end
