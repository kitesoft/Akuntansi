object f_cari: Tf_cari
  Left = 287
  Top = 126
  BorderStyle = bsDialog
  Caption = 'Pencarian'
  ClientHeight = 365
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Ed_cari: TsEdit
    Left = 4
    Top = 8
    Width = 573
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Ed_cariChange
    OnKeyDown = Ed_cariKeyDown
    SkinData.CustomColor = True
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
  end
  object grid: TcxGrid
    Left = 4
    Top = 32
    Width = 573
    Height = 321
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object t_data: TcxGridDBTableView
      OnDblClick = t_dataDblClick
      OnKeyDown = t_dataKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dm.ds_cari
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      object clm1: TcxGridDBColumn
        Tag = 1
        Width = 117
        IsCaptionAssigned = True
      end
      object clm2: TcxGridDBColumn
        Tag = 2
        Width = 184
        IsCaptionAssigned = True
      end
      object clm3: TcxGridDBColumn
        Tag = 3
        Width = 216
        IsCaptionAssigned = True
      end
      object clm4: TcxGridDBColumn
        Tag = 4
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
        IsCaptionAssigned = True
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 360
    Top = 104
  end
end
