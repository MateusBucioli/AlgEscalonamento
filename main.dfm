object frmPrinc: TfrmPrinc
  AlignWithMargins = True
  Left = 0
  Top = 0
  Anchors = [akLeft]
  Caption = 'Algoritmos de escalonamento'
  ClientHeight = 284
  ClientWidth = 559
  Color = clBtnFace
  Constraints.MinHeight = 315
  Constraints.MinWidth = 575
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
    Top = -1
    Width = 557
    Height = 136
    Hint = 'Informa'#231#245'es do Processo'
    Align = alCustom
    Caption = 'Informa'#231#245'es'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object txtProcesso: TStaticText
      Left = 3
      Top = 24
      Width = 47
      Height = 17
      Align = alCustom
      Caption = 'Processo'
      TabOrder = 6
    end
    object txtCiclos: TStaticText
      Left = 3
      Top = 53
      Width = 54
      Height = 17
      Align = alCustom
      Caption = 'Ciclos CPU'
      TabOrder = 7
    end
    object txtOrdemChegada: TStaticText
      Left = 3
      Top = 82
      Width = 97
      Height = 17
      Align = alCustom
      Caption = 'Ordem de Chegada'
      TabOrder = 8
    end
    object txtPrioridade: TStaticText
      Left = 3
      Top = 111
      Width = 52
      Height = 17
      Align = alCustom
      Caption = 'Prioridade'
      TabOrder = 9
    end
    object btnAdicionarProcesso: TBitBtn
      Left = 258
      Top = 19
      Width = 75
      Height = 24
      Hint = 'Adiciona as informa'#231#245'es do processo na tabela de registros'
      Caption = 'Adicionar'
      TabOrder = 4
      OnClick = btnAdicionarProcessoClick
    end
    object btnLimpaReg: TBitBtn
      Left = 339
      Top = 19
      Width = 75
      Height = 24
      Hint = 'Limpa todos os registros'
      Caption = 'Limpar'
      TabOrder = 5
      OnClick = btnLimpaRegClick
    end
    object grpMetodos: TGroupBox
      Left = 254
      Top = 51
      Width = 163
      Height = 80
      Hint = 'M'#233'todo de escalonamento a ser utilizado'
      Caption = 'Metodos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      object btnSRT: TBitBtn
        Left = 85
        Top = 20
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
        Top = 51
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
        Left = 85
        Top = 51
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
    end
    object edtCiclos: TEdit
      Left = 106
      Top = 49
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 1
    end
    object edtOrdemChegada: TEdit
      Left = 106
      Top = 78
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 2
    end
    object edtPrioridade: TEdit
      Left = 106
      Top = 107
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 3
    end
    object edtProcesso: TEdit
      Left = 106
      Top = 20
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 0
    end
  end
  object grpResultados: TGroupBox
    Left = 323
    Top = 134
    Width = 234
    Height = 147
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Resultados'
    TabOrder = 2
    ExplicitHeight = 139
    object grdResultados: TDBGrid
      Left = 2
      Top = 15
      Width = 230
      Height = 130
      Align = alClient
      DataSource = dsResultados
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Processo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Metodo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TempoRetorno'
          Visible = True
        end>
    end
  end
  object grpRegistros: TGroupBox
    Left = 0
    Top = 134
    Width = 326
    Height = 147
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Registros'
    TabOrder = 1
    ExplicitHeight = 139
    object grdRegistros: TDBGrid
      Left = 2
      Top = 15
      Width = 322
      Height = 130
      Align = alClient
      Anchors = [akLeft, akTop, akRight]
      DataSource = dsRegistros
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Processo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CiclosCPU'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OrdemChegada'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prioridade'
          Visible = True
        end>
    end
  end
  object edtLimpar: TEdit
    Left = 420
    Top = 18
    Width = 121
    Height = 24
    Hint = 'Insira o processo a ser excluido'
    TabOrder = 3
  end
  object cdsRegistros: TClientDataSet
    PersistDataPacket.Data = {
      710000009619E0BD01000000180000000400000000000300000071000850726F
      636573736F0100490004000100055749445448020002000A00094369636C6F73
      43505504000100040000000C4F7264656D436865676164610400010004000000
      0A5072696F72696461646502000100040000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 190
    object cdsRegistrosProcesso: TStringField
      FieldName = 'Processo'
      Required = True
      Size = 10
    end
    object cdsRegistrosCiclosCPU: TIntegerField
      DisplayLabel = 'Ciclos CPU'
      FieldName = 'CiclosCPU'
      Required = True
    end
    object cdsRegistrosOrdemChegada: TIntegerField
      DisplayLabel = 'Ordem de chegada'
      FieldName = 'OrdemChegada'
      Required = True
    end
    object cdsRegistrosPrioridade: TSmallintField
      FieldName = 'Prioridade'
      Required = True
    end
  end
  object cdsResultados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 192
    object cdsResultadosProcesso: TStringField
      FieldName = 'Processo'
      Required = True
      Size = 10
    end
    object cdsResultadosMetodo: TStringField
      FieldName = 'Metodo'
      Required = True
      Size = 4
    end
    object cdsResultadosTempoRetorno: TFloatField
      DisplayLabel = 'Tempo de retorno'
      FieldName = 'TempoRetorno'
      Required = True
    end
  end
  object dsRegistros: TDataSource
    DataSet = cdsRegistros
    Left = 40
    Top = 191
  end
  object dsResultados: TDataSource
    DataSet = cdsResultados
    Left = 361
    Top = 192
  end
end
