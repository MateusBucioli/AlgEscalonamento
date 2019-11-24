object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Anchors = [akLeft]
  Caption = 'Algoritmos de escalonamento'
  ClientHeight = 276
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
      Left = 4
      Top = 28
      Width = 47
      Height = 17
      Align = alCustom
      Caption = 'Processo'
      TabOrder = 6
    end
    object edtProcesso: TEdit
      Left = 106
      Top = 24
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 0
    end
    object edtCiclos: TEdit
      Left = 106
      Top = 52
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 1
    end
    object txtCiclos: TStaticText
      Left = 4
      Top = 55
      Width = 54
      Height = 17
      Align = alCustom
      Caption = 'Ciclos CPU'
      TabOrder = 7
    end
    object edtOrdemChegada: TEdit
      Left = 106
      Top = 80
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 2
    end
    object txtOrdemChegada: TStaticText
      Left = 4
      Top = 83
      Width = 97
      Height = 17
      Align = alCustom
      Caption = 'Ordem de Chegada'
      TabOrder = 8
    end
    object txtPrioridade: TStaticText
      Left = 4
      Top = 110
      Width = 52
      Height = 17
      Align = alCustom
      Caption = 'Prioridade'
      TabOrder = 9
    end
    object edtPrioridade: TEdit
      Left = 106
      Top = 107
      Width = 121
      Height = 21
      Align = alCustom
      TabOrder = 3
    end
    object btnAdicionarProcesso: TBitBtn
      Left = 258
      Top = 21
      Width = 75
      Height = 24
      Hint = 'Adiciona as informa'#231#245'es do processo na tabela de registros'
      Caption = 'Adicionar'
      TabOrder = 4
    end
    object btnLimpaReg: TBitBtn
      Left = 339
      Top = 20
      Width = 75
      Height = 25
      Hint = 'Limpa todos os registros'
      Caption = 'Limpar'
      TabOrder = 5
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
  end
  object grpResultados: TGroupBox
    Left = 314
    Top = 134
    Width = 245
    Height = 139
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Resultados'
    TabOrder = 2
    object grdResultados: TDBGrid
      Left = 2
      Top = 15
      Width = 241
      Height = 122
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
    Width = 317
    Height = 139
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Registros'
    TabOrder = 1
    object grdRegistros: TDBGrid
      Left = 2
      Top = 15
      Width = 313
      Height = 122
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
  object cdsRegistros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 6
    object cdsRegistrosProcesso: TStringField
      FieldName = 'Processo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    Left = 488
    Top = 48
    object cdsResultadosProcesso: TStringField
      FieldName = 'Processo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    Left = 520
    Top = 7
  end
  object dsResultados: TDataSource
    DataSet = cdsResultados
    Left = 521
    Top = 48
  end
end
