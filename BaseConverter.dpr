program BaseConverter;

uses
  Vcl.Forms,
  main in 'main.pas' {BaseConverter},
  DFBaseConverter in 'DFBaseConverter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBaseConverter, BaseConverter);
  Application.Run;
end.
