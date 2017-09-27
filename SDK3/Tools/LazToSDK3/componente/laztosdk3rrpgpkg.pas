{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit Laztosdk3rrpgpkg;

interface

uses
  componentes1, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('componentes1', @componentes1.Register);
end;

initialization
  RegisterPackage('Laztosdk3rrpgpkg', @Register);
end.
