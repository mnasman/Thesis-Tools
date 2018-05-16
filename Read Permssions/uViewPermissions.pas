unit uViewPermissions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, uHelper,Generics.Collections, StdCtrls, Vcl.Buttons;


type
  TfrmViewPermissions = class(TForm)
    grdPermissions: TStringGrid;
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    mmo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    FPermissionList: TStringList;
    FPackages : TStringList;
    FPermissios: TStringList;
    FPermissionObjects: TObjectList<TPermission>;
    FCurPath: string;
    procedure SetPermissionList(const Value: TStringList);
    procedure ProcessRow(aRow:integer;s:string);
    procedure SeperatePackagesAndPermissions;
    procedure SetPermissionObjects(const Value: TObjectList<TPermission>);
    function GetRowIndex(s:string):integer;
    function GetColumnIndex(s:string):Integer;
    procedure SaveToCSV;
    procedure SetCurPath(const Value: string);
  public
    property PermissionList:TStringList read FPermissionList write SetPermissionList;
    property PermissionObjects:TObjectList<TPermission> read FPermissionObjects write SetPermissionObjects;
    property CurPath:string read FCurPath write SetCurPath;
  end;

var
  frmViewPermissions: TfrmViewPermissions;

implementation

{$R *.dfm}


{ TfrmViewPermissions }

procedure TfrmViewPermissions.btn1Click(Sender: TObject);
var
  I,J: Integer;
  s: string;
  rowIndex,ColIndex : Integer;
begin
  for I := 0 to PermissionObjects.Count - 1 do
  begin
    rowIndex := GetRowIndex(GetPackage(PermissionObjects.Items[I].Package));
    if rowIndex >= 0 then
    begin
      for J := 0 to PermissionObjects.Items[I].PermissionList.Count - 1 do
      begin
        ColIndex := GetColumnIndex(GetShortPermissionName(PermissionObjects.Items[I].PermissionList[J]));
        if ColIndex >= 0 then
          grdPermissions.Cells[ColIndex,rowIndex] := 'X';
      end;
    end;
  end;
end;

procedure TfrmViewPermissions.btn2Click(Sender: TObject);
begin
   SaveToCSV
end;

procedure TfrmViewPermissions.FormCreate(Sender: TObject);
begin
  FPermissionList := TStringList.Create;
  FPackages := TStringList.Create;
  FPermissios := TStringList.Create;

end;

procedure TfrmViewPermissions.FormShow(Sender: TObject);
var
  I,P: Integer;
  s : string;
begin
  grdPermissions.RowCount := PermissionObjects.Count + 1;
  grdPermissions.ColCount := mmo1.Lines.Count+1;
//
//  for i := 0 to 600 - 1 do
//    grdPermissions.Cells[i,0] := 'Cell No' + IntToStr( I);

  for I := 0 to PermissionObjects.Count - 1 do
  begin
    grdPermissions.Cells[0,I+1] := GetPackage(PermissionObjects.Items[I].Package);

    for P := 1 to mmo1.Lines.Count  do
    begin
      grdPermissions.Cells[P ,0] := mmo1.Lines[p-1];
      grdPermissions.ColWidths[P ] := 150;
    end;
  end;
      grdPermissions.ColWidths[0] := 300;
//  if Assigned(FPermissionList) then
//  begin
//    SeperatePackagesAndPermissions;
//  end;
end;

function TfrmViewPermissions.GetColumnIndex(s: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 1 to grdPermissions.ColCount -1 do
  begin
    if s = grdPermissions.Cells[I,0] then
      Exit(I);
  end;
end;

function TfrmViewPermissions.GetRowIndex(s: string): integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 1 to grdPermissions.RowCount -1 do
  begin
    if s = grdPermissions.Cells[0,I] then
      Exit(I);
  end;

end;

procedure TfrmViewPermissions.ProcessRow(aRow:integer;s: string);
begin
//  if grdPermissions.row then
  //  FPermissionList.cell[0] := S;
end;


procedure TfrmViewPermissions.SaveToCSV;
var
  SD : TSaveDialog;
  I : Integer;
  CSV : TStrings;
  FileName : String;
begin
  Try
  // Filedialog erzeugen
  SD := TSaveDialog.Create(Self);
  SD.InitialDir := CurPath;
  SD.Filter := 'CSV Files (*.csv)|*.CSV';
  //Filedialog ausführen
  If SD.Execute = True Then
  Begin
    //Filename zuweisen
    FileName := SD.FileName;
    If Copy(FileName,Pos('.',FileName),Length(FileName)-Pos('.',FileName)+1) <> '.csv' Then FileName := FileName + '.csv';
    Screen.Cursor := crHourGlass;
    //Stringliste erzeugen
    CSV := TStringList.Create;
    Try
      //Stringliste füllen
      For I := 0 To grdPermissions.RowCount - 1 Do CSV.Add(grdPermissions.Rows[I].CommaText);
      //CSV speichern
      CSV.SaveToFile(FileName);
//      Result := True;
    Finally
      CSV.Free;
    End;
  End;

  Finally
    SD.Free;
    Screen.Cursor := crDefault;
  End;
end;

procedure TfrmViewPermissions.SeperatePackagesAndPermissions;
var
 I: Integer;
 s : string;
begin
  if Assigned(FPermissionList) then
  begin
    for s in FPermissionList do
    begin
      if CheckPackage(S) > 0 then
        FPackages.Add(Copy(s,Length(PKG),Length(s) - Length(PKG)+1))
      else
      begin
        if FPermissios.IndexOf(S) < 0 then
          FPermissios.Add(S);
      end;
    end;
    grdPermissions.RowCount := FPackages.Count + 1;
    grdPermissions.ColCount := FPermissios.Count + 1;
  end;

  for I := 0 to FPermissios.Count - 1 do
    grdPermissions.Cells[I+1,0] := FPermissios[I];

  for I := 0 to FPackages.Count - 1 do
    grdPermissions.Cells[0,I+1] := FPackages[I];

  grdPermissions.ColWidths[0] := 200;
end;

procedure TfrmViewPermissions.SetCurPath(const Value: string);
begin
  FCurPath := Value;
end;

procedure TfrmViewPermissions.SetPermissionList(const Value: TStringList);
begin
  FPermissionList := Value;
end;

procedure TfrmViewPermissions.SetPermissionObjects(
  const Value: TObjectList<TPermission>);
begin
  FPermissionObjects := Value;
end;

end.
