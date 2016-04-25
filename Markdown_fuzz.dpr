program Markdown_fuzz;

uses
  Vcl.Forms,
  main in 'F:\TestFiles\Markdown_fuzz\main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
