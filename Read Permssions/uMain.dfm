object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Read Permissions'
  ClientHeight = 435
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    634
    435)
  PixelsPerInch = 96
  TextHeight = 14
  object lblFolderPath: TLabel
    Left = 8
    Top = 39
    Width = 264
    Height = 13
    AutoSize = False
    Caption = 'c:\path\sdfdsfsfdsfsd\fdfd'
    EllipsisPosition = epPathEllipsis
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lstApkFiles: TFileListBox
    Left = 8
    Top = 58
    Width = 264
    Height = 369
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 18
    Mask = '*.txt'
    TabOrder = 0
  end
  object btnSelectAPK: TBitBtn
    Left = 8
    Top = 8
    Width = 139
    Height = 25
    Caption = 'Select TXT Folder'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFEAD0B4FFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEF
      DEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFFDEFDEFFEAD0B4FFE5C4A1FFE7BA
      89FFE7BA89FFE7BA89FFE7B988FFE5BE93FFF2DABFFFF2DBC0FFF2DBC0FFF2DB
      C0FFF2DBC0FFF2DBC0FFF2DBC0FFF2DBC0FFF2DBC0FFE6C9ABFFEACBABFFFDDC
      B6FFFDDCB5FFFDDCB6FFF8D4ACFFE3BF98FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = btnSelectAPKClick
  end
  object btnView: TBitBtn
    Left = 278
    Top = 8
    Width = 159
    Height = 25
    Caption = 'View Permissons'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4C8ABFFF3E7DAFFF3E7DAFFF3E7DAFFF3E7DAFFF3E7DAFFF3E7
      DAFFF3E7DAFFF3E7DAFFF3E7DAFFE4C7A8FF0000000000000000000000000000
      000000000000E7CDA9FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFF6EDE4FF0000000000000000000000000000
      000000000000E8CDA6FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFDFDFF0000000000000000000000000000
      000000000000E3C3A3FFFEFEFEFFDFB487FFE7B077FFE7B077FFE7B077FFE7B0
      77FFE7B077FFE7B077FFE0B07DFFFCF8F5FFE5C9ADFF00000000FDF2E4FFFDF2
      E4FFFDF2E4FFE9CCADFFF8F2EBFFE8C9A9FFFDD4A8FFF4CDA3FFFDE0C1FFFDE0
      C1FFFDE0C1FFFDE0C1FFEFBD89FFF6ECE2FFE5C9ADFF00000000000000000000
      00000000000000000000EDD9C4FFEDD9C5FFF7D0A6FFEED2B5FFFCEFE3FFFEF4
      EAFFFEF4EAFFFEF4EAFFF5C899FFF0DECBFFEDD8C4FF00000000FDF2E4FFFDF2
      E4FFFDF2E4FFF9EADAFFE8CDB2FFF8F2EBFFDFA66CFFE7B077FFE7B077FFE7B0
      77FFE7B077FFE7B077FFE4AD73FFE7C8A8FFF4E8DCFF00000000FDF2E4FFFDF2
      E4FFFDF2E4FFFDF2E4FFE4C6A5FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFAF6F1FF00000000000000000000
      00000000000000000000E9CFB2FFFCD6AEFFFDD6ACFFFDD6ACFFFDD6ACFFFDD6
      ACFFFDD6ACFFFDD6ACFFFDD6ACFFFDD6ACFFFDD5ABFFE6C29DFF000000000000
      0000000000000000000000000000EEBB85FFF2BE87FFF2BE87FFF2BE87FFF2BE
      87FFF2BE87FFF2BE87FFF2BE87FFF2BE87FFF2BE87FFE2B384FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 2
    OnClick = btnViewClick
  end
  object btnJoin: TBitBtn
    Left = 153
    Top = 8
    Width = 119
    Height = 25
    Caption = 'Join Permissions'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7C9ABFFE7C9ABFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2DBC0FFF2DBC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2DBC0FFF2DBC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCB087FFF2DBC0FFFBEBD8FFFBEBD8FFF3DB
      C0FFDCB087FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5C4A0FFFDEEDDFFFDEEDDFFE5C4
      A0FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9CAAAFFE9CAAAFF0000
      000000000000000000000000000000000000000000000000000000000000DEBA
      95FFDCB790FFDCB790FFDCB790FFDCB790FFDCB790FFD1A06BFFD1A06BFFDCB7
      90FFDCB790FFDCB790FFDCB790FFDCB790FFDEBA95FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEBA
      95FFDDB790FFDDB790FFDDB790FFDDB790FFDDB790FFD1A06BFFD1A06BFFDDB7
      90FFDDB790FFDDB790FFDDB790FFDDB790FFDEBA95FF00000000000000000000
      00000000000000000000000000000000000000000000E9CAAAFFE9CAAAFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5C4A0FFFDEEDDFFFDEEDDFFE5C4
      A0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCB087FFF2DBC0FFFBEBD8FFFBEBD8FFF2DB
      C0FFDCB087FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2DBC0FFF2DBC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2DBC0FFF2DBC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6C9ABFFE6C9ABFF0000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 3
    OnClick = btnJoinClick
  end
  object mmoOuput: TMemo
    Left = 278
    Top = 58
    Width = 348
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 4
  end
  object dlgSave1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text File|*.txt|All files|*.*'
    Left = 134
    Top = 360
  end
  object dlgSelectFolder: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 184
    Top = 240
  end
end