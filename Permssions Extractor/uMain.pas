unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  FileCtrl, Vcl.Buttons;

type
  TForm1 = class(TForm)
    lstApkFiles: TFileListBox;
    dlgOpenAAPT: TOpenDialog;
    lbl1: TLabel;
    edtApptPath: TEdit;
    btnSelectAPK: TBitBtn;
    lblFolderPath: TLabel;
    lbl3: TLabel;
    edtOutputPath: TEdit;
    mmoOutput: TMemo;
    lbl2: TLabel;
    btnClear: TBitBtn;
    btnExtract: TBitBtn;
    btnSave: TBitBtn;
    dlgSave1: TSaveDialog;
    btnApptPath: TSpeedButton;
    btnOutputPath: TSpeedButton;
    dlgSelectFolder: TFileOpenDialog;
    procedure btnSelectAPKClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnApptPathClick(Sender: TObject);
    procedure btnOutputPathClick(Sender: TObject);
  private
    procedure ReadSettings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  IniFiles, ShellAPI;

const
  SETTINGS_KEY = 'Settings';

var
  iniSettings : TIniFile;
  //
function QuotedString(s:string):string;
begin
  Result := AnsiQuotedStr(s,'"');
end;

procedure WriteSettings(secName,KeyName,KeyValue: string);
begin
  iniSettings.WriteString(secName,KeyName,QuotedStr(KeyValue));
end;


function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 9600;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
 begin
 try
   saSecurity.nLength := SizeOf(saSecurity);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning  := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;
           OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
 finally
 end;
end;


procedure TForm1.btnApptPathClick(Sender: TObject);
begin
  dlgOpenAAPT.FileName := 'aapt.exe';
  if dlgOpenAAPT.Execute then
  begin
    edtApptPath.Text := dlgOpenAAPT.FileName;
    WriteSettings(SETTINGS_KEY,'AAPT_Path',dlgOpenAAPT.FileName);
  end;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  mmoOutput.Clear;
end;


procedure TForm1.btnExtractClick(Sender: TObject);
var
  I: Integer;
  cmd,output : string;
begin

  cmd := '';
  if edtApptPath.Text ='' then
  begin
    MessageDlg('You have to specify APPT.EXE path',mtError,[mbOK],0);
  end
  else
  begin
    for I := 0 to  lstApkFiles.Count - 1 do
    begin
      output := QuotedString(edtOutputPath.Text +'\' + lstApkFiles.Items[i] + '.txt');
      cmd :=   QuotedString(lstApkFiles.Directory +'\'+ lstApkFiles.Items[i]);
      ShellExecute(0, nil, PChar(ExtractFilePath(Application.ExeName)+ 'ex.bat'), PChar(cmd + ' ' + output), nil, SW_SHOWNORMAL);
      mmoOutput.Lines.Add(output + ' has created')
    end;
  end;
end;

procedure TForm1.btnOutputPathClick(Sender: TObject);
begin
  if dlgSelectFolder.Execute then
  begin
    edtOutputPath.Text := dlgSelectFolder.FileName;
    WriteSettings(SETTINGS_KEY,'Output_Path',edtOutputPath.Text);
  end;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
begin
  if dlgSave1.Execute then
  begin
    mmoOutput.Lines.SaveToFile(dlgSave1.FileName);
  end;
end;

procedure TForm1.btnSelectAPKClick(Sender: TObject);
begin
  if dlgSelectFolder.Execute then
  begin
    lstApkFiles.Directory := dlgSelectFolder.FileName;
    lblFolderPath.Caption := lstApkFiles.Directory;
    WriteSettings(SETTINGS_KEY,'APK_Path',lstApkFiles.Directory);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  iniSettings := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Settings.ini');
  ReadSettings;
end;

procedure TForm1.ReadSettings;
begin
  lblFolderPath.Caption := iniSettings.ReadString(SETTINGS_KEY,'APK_PATH','');
  lstApkFiles.Directory := lblFolderPath.Caption;

  edtApptPath.Text := iniSettings.ReadString(SETTINGS_KEY,'AAPT_PATH','');

  edtOutputPath.Text := iniSettings.ReadString(SETTINGS_KEY,'OUTPUT_PATH','');

end;

end.
