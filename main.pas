unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,DFBaseConverter, Vcl.StdCtrls;

type
  TBaseConverterForm = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TestBaseConversions;
  end;

var
  BaseConverterForm: TBaseConverterForm;

implementation

{$R *.dfm}

procedure TBaseConverterForm.FormShow(Sender: TObject);
begin
memo1.clear;
TestBaseConversions;
end;

procedure TBaseConverterForm.TestBaseConversions;
var
  DecimalValue: Int64;
  BinaryValue, HexValue, OctalValue, Base64Value: String;
begin
  DecimalValue := 1234567890;

  // Decimal to Binary
  BinaryValue := DecimalToBinary(DecimalValue);
  Memo1.Lines.Add('Decimal to Binary: ' + BinaryValue);

  // Decimal to Hexadecimal
  HexValue := DecimalToHexadecimal(DecimalValue);
  Memo1.Lines.Add('Decimal to Hexadecimal: ' + HexValue);

  // Decimal to Octal
  OctalValue := DecimalToOctal(DecimalValue);
  Memo1.Lines.Add('Decimal to Octal: ' + OctalValue);

  // Decimal to Base64
  Base64Value := DecimalToBase64(DecimalValue);
  Memo1.Lines.Add('Decimal to Base64: ' + Base64Value);
end;
end.
