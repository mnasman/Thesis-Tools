unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Buttons, Vcl.FileCtrl
  ,uHelper,Generics.Collections;

type

  TJoinPermssions = class
    private
      SL : TStringList;
      FPackage: string;
      FPermisions: TStringList;
      procedure SetPackage(const Value: string);
      procedure SetPermisions(const Value: TStringList);
      procedure ReadPackage(s:string);
      procedure ReadContent(SL:TStringList);
      function  ReadPermission(s:string):string;
    public
      constructor Create(fileName:string);overload;
      destructor Destroy;override;
      property Package: string read FPackage write SetPackage;
      property Permisions:TStringList read FPermisions write SetPermisions;
  end;

  TForm1 = class(TForm)
    lstApkFiles: TFileListBox;
    btnSelectAPK: TBitBtn;
    lblFolderPath: TLabel;
    btnView: TBitBtn;
    dlgSave1: TSaveDialog;
    btnJoin: TBitBtn;
    mmoOuput: TMemo;
    dlgSelectFolder: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectAPKClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    PL : TObjectList<TPermission>;
     procedure ReadSettings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  IniFiles, uViewPermissions;

{$R *.dfm}

const
  SETTINGS_KEY = 'Settings';
var
  iniSettings : TIniFile;

function QuotedString(s:string):string;
begin
  Result := AnsiQuotedStr(s,'"');
end;

procedure WriteSettings(secName,KeyName,KeyValue: string);
begin
  iniSettings.WriteString(secName,KeyName,QuotedStr(KeyValue));
end;

procedure TForm1.btnViewClick(Sender: TObject);
var
  sl : TStringList;
  I: Integer;
begin
  with TfrmViewPermissions.Create(nil) do
  try
    CurPath := lblFolderPath.Caption;
    PermissionObjects := PL;
    PermissionList.Assign(mmoOuput.Lines);
    ShowModal;
  finally
    Release;
  end;
//  if dlgSave1.Execute then
//  begin
//    sl := TStringList.Create;
//    for I := 0 to lstApkFiles.Count - 1 do
//    begin
//
//    end;
//    sl.SaveToFile(dlgSave1.FileName);
//  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  I: Integer;

begin
//  for I := 0 to lstApkFiles.Count - 1 do
//  begin
//    P := TPersistentClass.Create;
//
//  end;
end;

procedure TForm1.btnJoinClick(Sender: TObject);
var
  I: Integer;
  per : TJoinPermssions;
  P: TPermission;
  j: Integer;
begin
  PL := TObjectList<TPermission>.Create;
  mmoOuput.Clear;
  for I := 0 to lstApkFiles.Count - 1 do
  begin
    try
      P := TPermission.create;
      per := TJoinPermssions.Create(lstApkFiles.Directory +'\'+ lstApkFiles.Items[i]);
  //    mmoOuput.Lines.Add(per.Package);
      P.Package := per.Package;
  //    mmoOuput.Lines.AddStrings(per.Permisions);
      P.PermissionList.Assign(Per.Permisions);
      PL.Add(P);
    finally
      per.Free;
    end;
  end;

    mmoOuput.Lines.BeginUpdate;
  for I := 0 to PL.Count - 1 do
  begin
    mmoOuput.Lines.Add(pl.Items[i].Package);
    for j := 0 to PL.Items[i].PermissionList.Count - 1 do
      mmoOuput.Lines.Add(PL.Items[i].PermissionList[j])
  end;
  mmoOuput.Lines.EndUpdate;
end;

procedure TForm1.btnSelectAPKClick(Sender: TObject);
begin
  if dlgSelectFolder.Execute then
  begin
    lstApkFiles.Directory := dlgSelectFolder.FileName;
    lblFolderPath.Caption := lstApkFiles.Directory;
        WriteSettings(SETTINGS_KEY,'TXT_Path',lstApkFiles.Directory);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  iniSettings := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Settings.ini');
  ReadSettings;
end;

procedure TForm1.ReadSettings;
begin
  lblFolderPath.Caption := iniSettings.ReadString(SETTINGS_KEY,'TXT_PATH','');
  lstApkFiles.Directory := lblFolderPath.Caption;
end;

{ TJoinPermssions }

constructor TJoinPermssions.Create(fileName: string);
begin
  Sl := TStringList.Create;
  FPermisions := TStringList.Create;
  Sl.LoadFromFile(fileName);
  ReadPackage(SL[0]);
  ReadContent(SL);
end;

destructor TJoinPermssions.Destroy;
begin
  FPermisions.Free;
  Sl.Free;
  inherited;
end;

procedure TJoinPermssions.ReadContent(SL: TStringList);
var
  I: Integer;
begin
  for I := 1 to sl.Count - 1 do
    Permisions.Add(ReadPermission(SL[i]));
end;

procedure TJoinPermssions.ReadPackage(s: string);
var
  P : Integer;
begin
  FPackage := '';
  P := CheckPackage(S);
  if P >= 0 then
    FPackage := Copy(S,P,Length(S));
end;

function TJoinPermssions.ReadPermission(s: string): string;
var
  I : Integer;
begin
  Result := '';
  I := Pos(PER_STR,S);
  if I >= 0 then
    Result := Copy(S,I + Length(PER_STR),Length(S) - Length(PER_STR) -1);
end;

procedure TJoinPermssions.SetPackage(const Value: string);
begin
  FPackage := Value;
end;

procedure TJoinPermssions.SetPermisions(const Value: TStringList);
begin
  FPermisions := Value;
end;

end.
