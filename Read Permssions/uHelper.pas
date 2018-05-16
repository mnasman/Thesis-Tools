unit uHelper;

interface
uses
  SysUtils, Classes, Generics.Collections;
const
  PKG      = 'package: ';
  PER_STR  = 'uses-permission: name=''';
  AND_PER  = 'android.permission.';

type
  TPermission = class
  private
    FPackage: string;
    FPermissionList: TStringList;
    procedure SetPackage(const Value: string);
    procedure SetPermissionList(const Value: TStringList);
  public
    constructor create;
    destructor Destroy;override;
    property PermissionList:TStringList read FPermissionList write SetPermissionList;
    property Package      :string read FPackage write SetPackage;
  end;

//  TPermissionList = class

function CheckPackage(S:string):Integer;
function GetPackage(s:string):string;
function GetPermission(s:string):string;
function GetShortPermissionName(s:string):string;
implementation

function CheckPackage(S:string):Integer;
begin
  Result := Pos(PKG,s);
end;

function GetPackage(s:string):string;
begin
  if CheckPackage(S) > 0 then
    Result := Copy(s,Length(PKG),Length(s) - Length(PKG)+1)
end;

function GetPermission(s:string):string;
begin
  Result := Copy(s,Length(PER_STR),Length(s) - Length(PER_STR)+1)
end;
{ TPermission }

constructor TPermission.create;
begin
  FPermissionList := TStringList.Create;
end;

destructor TPermission.Destroy;
var
  I: Integer;
begin
//  for i := FPermissionList.Count - 1 downto
//    FPermissionList.Items[i].free;
  FPermissionList.Free;
  inherited;
end;

procedure TPermission.SetPackage(const Value: string);
begin
  FPackage := Value;
end;

procedure TPermission.SetPermissionList(const Value: TStringList);
begin
  FPermissionList := Value;
end;

function GetShortPermissionName(s:string):string;
var
  str : string;
  P : Integer;
begin
  Result := '';
  P := Pos(AND_PER,s);
  if P > 0 then
    Result := Copy(s,Length(AND_PER)+1,Length(s) - Length(AND_PER)+1);
end;

end.
