unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Input_text: TEdit;
    Button2: TButton;
    Output_Folder: TEdit;
    Button3: TButton;
    CountElements: TEdit;
    CountFiles: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  syntax_source: string;
  WW, PW, HH, PH: integer;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Input_text.Text := OpenDialog1.FileName;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    try
      Options := [fdoPickFolders];
      if Execute then
        Output_Folder.Text := FileName;
    finally
      Free;
    end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var
  i, j, k: integer;
  source, markdown, fuzz_file_path: string;
  input, output, syntax, fuzz: file;
  InList: TStrings;
  SynList: TStrings;
  FuzzList: TStrings;
begin
  InList := TStringList.Create;
  SynList := TStringList.Create;
  FuzzList := TStringList.Create;
  Label5.Caption := '';
  ProgressBar1.Max := StrToInt(CountFiles.Text);
  Randomize;
  if FileExists(Input_text.Text) then
    InList.LoadFromFile(Input_text.Text) // Load all strings from input file
  else
  begin
    ShowMessage('Input file doesnt exist!');
    exit
  end;
  if FileExists(syntax_source) then
    SynList.LoadFromFile(syntax_source)
  else
  begin
    ShowMessage('Syntax file doesnt exist!');
    exit
  end;
  if not DirectoryExists(Output_Folder.Text,true) then
  begin
    ShowMessage('Directory for file creation doesnt exist!');
    exit
  end;

  // Load all markdown syntax
  for k := 1 to StrToInt(CountFiles.Text) do
  begin
    fuzz_file_path := Output_Folder.Text + '\' + inttostr(k) + '.md';
    // Create path to file name
    for i := 0 to InList.Count - 1 do
    begin
      source := InList[i];
      for j := 1 to StrToInt(CountElements.Text) do
      begin
        markdown := SynList[Random(SynList.Count)];
        insert(markdown, source, Random(length(source)));
        // insert markdown element in random place of string
      end;
      FuzzList.Add(source)
    end;
    FuzzList.SaveToFile(fuzz_file_path); // Generating fuzzed file
    FuzzList.Clear;
    ProgressBar1.StepBy(1);
    Label5.Caption := 'Created ' + inttostr(k) + ' for ' + CountFiles.Text;
  end;
  SynList.Clear;
  InList.Clear;
  ShowMessage('Genereating Complete');
  ProgressBar1.Position := 0;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    syntax_source := OpenDialog1.FileName;
    MainForm.Caption := 'File with markdown syntax ' + OpenDialog1.FileName;
    Button1.Enabled := true;
    Input_text.Enabled := true;
    Button2.Enabled := true;
    Output_Folder.Enabled := true;
    Button3.Enabled := true;
    CountElements.Enabled := true;
    CountFiles.Enabled := true;
  end;
end;

end.
