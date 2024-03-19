unit DFBaseConverter;

interface

{
  DelphiFan.com Library: BaseConverter
  Provides functions for converting numbers between different bases.
}

uses
  System.SysUtils,
  System.StrUtils;


function DecimalToBinary(Value: Int64): String;
function BinaryToDecimal(Value: String): Int64;
function DecimalToHexadecimal(Value: Int64): String;
function HexadecimalToDecimal(Value: String): Int64;
function DecimalToOctal(Value: Int64): String;
function OctalToDecimal(Value: String): Int64;
function DecimalToDuodecimal(Value: Int64): String;
function DuodecimalToDecimal(Value: String): Int64;

// Additional base conversion functions
function DecimalToSexagesimal(Value: Int64): String;
function SexagesimalToDecimal(Value: String): Int64;
function DecimalToVigesimal(Value: Int64): String;
function VigesimalToDecimal(Value: String): Int64;
function DecimalToBase36(Value: Int64): String;
function Base36ToDecimal(Value: String): Int64;
function DecimalToBalancedTernary(Value: Int64): String;
function BalancedTernaryToDecimal(Value: String): Int64;
function DecimalToSenary(Value: Int64): String;
function SenaryToDecimal(Value: String): Int64;
function DecimalToQuaternary(Value: Int64): String;
function QuaternaryToDecimal(Value: String): Int64;
function DecimalToTernary(Value: Int64): String;
function TernaryToDecimal(Value: String): Int64;
function DecimalToQuinary(Value: Int64): String;
function QuinaryToDecimal(Value: String): Int64;
function DecimalToDuot32(Value: Int64): String;
function Duot32ToDecimal(Value: String): Int64;
function DecimalToTridecimal(Value: Int64): String;
function TridecimalToDecimal(Value: String): Int64;
function DecimalToSeptenary(Value: Int64): String;
function SeptenaryToDecimal(Value: String): Int64;
function DecimalToNonary(Value: Int64): String;
function NonaryToDecimal(Value: String): Int64;
function DecimalToPentadecimal(Value: Int64): String;
function PentadecimalToDecimal(Value: String): Int64;
function DecimalToHexatridecimal(Value: Int64): String;
function HexatridecimalToDecimal(Value: String): Int64;
function DecimalToBase64(Value: Int64): String;
function Base64ToDecimal(Value: String): Int64;

implementation

function IntToBin(Value: Int64; Digits: Integer): String;
var
  S: String;
begin
  S := '';
  while Digits > 0 do
  begin
    if (Value and 1) = 1 then
      S := '1' + S
    else
      S := '0' + S;
    Value := Value shr 1;
    Dec(Digits);
  end;
  Result := S;
end;

function DecimalToBinary(Value: Int64): String;
begin
  Result := IntToBin(Value, 64);
end;


function BinaryToDecimal(Value: String): Int64;
begin
  Result := StrToInt64('$' + Value);
end;

function DecimalToHexadecimal(Value: Int64): String;
begin
  Result := IntToHex(Value, 1);
end;

function HexadecimalToDecimal(Value: String): Int64;
begin
  Result := StrToInt64('$' + Value);
end;

function IntToOct(Value: Int64): String;
const
  OctalDigits: array[0..7] of Char = ('0', '1', '2', '3', '4', '5', '6', '7');
var
  TempValue: Int64;
begin
  Result := '';
  TempValue := Value;
  if TempValue = 0 then
    Result := '0'
  else
    while (TempValue <> 0) do
    begin
      Result := OctalDigits[(TempValue and $7)] + Result;
      TempValue := (TempValue shr 3);
    end;
end;

function DecimalToOctal(Value: Int64): String;
begin
  Result := IntToOct(Value);
end;

function OctalToDecimal(Value: String): Int64;
begin
  Result := StrToInt64('$' + Value);
end;

function DecimalToDuodecimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 12) + Result;
    Value := Value div 12;
  end;
  if Result = '' then Result := '0';
end;

function DuodecimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 12 + StrToInt(Value[i]);
  end;
end;

// Additional base conversion functions

function DecimalToSexagesimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 60) + Result;
    Value := Value div 60;
  end;
  if Result = '' then Result := '0';
end;

function SexagesimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 60 + StrToInt(Value[i]);
  end;
end;

function DecimalToVigesimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 20) + Result;
    Value := Value div 20;
  end;
  if Result = '' then Result := '0';
end;

function VigesimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 20 + StrToInt(Value[i]);
  end;
end;

function DecimalToBase36(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 36) + Result;
    Value := Value div 36;
  end;
  if Result = '' then Result := '0';
end;

function Base36ToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 36 + StrToInt(Value[i]);
  end;
end;

function DecimalToBalancedTernary(Value: Int64): String;
begin
  Result := '';
  while Value <> 0 do
  begin
    Result := IntToStr(Abs(Value) mod 3) + Result;
    Value := Value div 3;
    if Value < 0 then
      Value := Value + 1;
  end;
  if Result = '' then Result := '0';
end;

function BalancedTernaryToDecimal(Value: String): Int64;
var
  i, Multiplier: Integer;
begin
  Result := 0;
  Multiplier := 1;
  for i := Length(Value) downto 1 do
  begin
    Result := Result + StrToInt(Value[i]) * Multiplier;
    Multiplier := Multiplier * 3;
    if Value[i] = '-' then
      Result := Result - 2 * Multiplier;
  end;
end;

function DecimalToSenary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 6) + Result;
    Value := Value div 6;
  end;
  if Result = '' then Result := '0';
end;

function SenaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 6 + StrToInt(Value[i]);
  end;
end;

function DecimalToQuaternary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 4) + Result;
    Value := Value div 4;
  end;
  if Result = '' then Result := '0';
end;

function QuaternaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 4 + StrToInt(Value[i]);
  end;
end;

function DecimalToTernary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 3) + Result;
    Value := Value div 3;
  end;
  if Result = '' then Result := '0';
end;

function TernaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 3 + StrToInt(Value[i]);
  end;
end;

function DecimalToQuinary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 5) + Result;
    Value := Value div 5;
  end;
  if Result = '' then Result := '0';
end;

function QuinaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 5 + StrToInt(Value[i]);
  end;
end;

function DecimalToDuot32(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 32) + Result;
    Value := Value div 32;
  end;
  if Result = '' then Result := '0';
end;

function Duot32ToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 32 + StrToInt(Value[i]);
  end;
end;

function DecimalToTridecimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 13) + Result;
    Value := Value div 13;
  end;
  if Result = '' then Result := '0';
end;

function TridecimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 13 + StrToInt(Value[i]);
  end;
end;

function DecimalToSeptenary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 7) + Result;
    Value := Value div 7;
  end;
  if Result = '' then Result := '0';
end;

function SeptenaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 7 + StrToInt(Value[i]);
  end;
end;

function DecimalToNonary(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 9) + Result;
    Value := Value div 9;
  end;
  if Result = '' then Result := '0';
end;

function NonaryToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 9 + StrToInt(Value[i]);
  end;
end;

function DecimalToPentadecimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 15) + Result;
    Value := Value div 15;
  end;
  if Result = '' then Result := '0';
end;

function PentadecimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 15 + StrToInt(Value[i]);
  end;
end;

function DecimalToHexatridecimal(Value: Int64): String;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := IntToStr(Value mod 23) + Result;
    Value := Value div 23;
  end;
  if Result = '' then Result := '0';
end;

function HexatridecimalToDecimal(Value: String): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result * 23 + StrToInt(Value[i]);
  end;
end;

function DecimalToBase64(Value: Int64): String;
const
  Base64Chars: String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  i: Integer;
begin
  Result := '';
  while Value > 0 do
  begin
    Result := Base64Chars[(Value mod 64) + 1] + Result;
    Value := Value div 64;
  end;
  if Result = '' then Result := 'A';
end;

function Base64ToDecimal(Value: String): Int64;
const
  Base64Chars: String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  i, CharIndex, PowerValue: Integer;
begin
  Result := 0;
  PowerValue := 1; // Initialize power of 64
  for i := Length(Value) downto 1 do
  begin
    CharIndex := Pos(Value[i], Base64Chars) - 1;
    if CharIndex >= 0 then
    begin
      // Calculate the value of the current character position
      Result := Result + CharIndex * PowerValue;
      // Update the power of 64 for the next character
      PowerValue := PowerValue * 64;
    end;
  end;
end;

end.

