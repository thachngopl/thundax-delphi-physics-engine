(*
 * Copyright (c) 2010-2012 Thundax Delphi Physics Engine
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the name of 'TDPE' nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *)
unit Testtdpe.lib.vector;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Math, tdpe.lib.vector, SysUtils;

type
  // Test methods for class TVector

  TestTVector = class(TTestCase)
  strict private
    FVector: IVector;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSetPoint;
    procedure TestClone;
    procedure TestInnerProduct;
    procedure TestOuterProduct;
    procedure TestAdd;
    procedure TestSubstract;
    procedure TestScalarProduct;
    procedure TestDivide;
    procedure TestDistance;
    procedure TestTimes;
    procedure TestMagnitude;
    procedure TestNormalise;
    procedure TestToString;
    procedure TestTurnAngle;
    procedure TestResetAngle;
    procedure TestNew;
  end;

implementation

uses
  tdpe.lib.math;

procedure TestTVector.SetUp;
begin
  FVector := TVector.Create;
end;

procedure TestTVector.TearDown;
begin
  FVector := nil;
end;

procedure TestTVector.TestSetPoint;
var
  ReturnValue: IVector;
  py: Double;
  px: Double;
begin
  px := 10;
  py := 10;
  ReturnValue := FVector.SetPoint(px, py);
  CheckTrue(ReturnValue.x = px, Format('Wrong value, expected %f but was %f',[px, ReturnValue.x]));
  CheckTrue(ReturnValue.y = py, Format('Wrong value, expected %f but was %f',[py, ReturnValue.y]));
end;

procedure TestTVector.TestClone;
var
  vector: IVector;
  py: Double;
  px: Double;
begin
  px := 10;
  py := 10;
  vector := TVector.New.SetPoint(px, py);
  FVector.Clone(vector);
  CheckTrue(FVector.x = px, Format('Wrong value, expected %f but was %f',[px, FVector.x]));
  CheckTrue(FVector.y = py, Format('Wrong value, expected %f but was %f',[py, FVector.y]));
end;

procedure TestTVector.TestInnerProduct;
var
  ReturnValue: Double;
  vector: IVector;
  py: Double;
  px: Double;
  InnerProductResult : Double;
begin
  px := 10;
  py := 10;
  vector := TVector.New.SetPoint(px, py);
  FVector.SetPoint(12, 12);
  ReturnValue := FVector.InnerProduct(vector);
  InnerProductResult := ((FVector.x * vector.x) + (FVector.y * vector.y));
  CheckTrue(ReturnValue = InnerProductResult, Format('Wrong value, expected %f but was %f',[ReturnValue, InnerProductResult]));
end;

procedure TestTVector.TestOuterProduct;
var
  ReturnValue: Double;
  vector: IVector;
  py: Double;
  px: Double;
  InnerProductResult : Double;
begin
  px := 10;
  py := 10;
  vector := TVector.New.SetPoint(px, py);
  FVector.SetPoint(12, 12);
  ReturnValue := FVector.OuterProduct(vector);
  InnerProductResult := ((FVector.x * vector.x) - (FVector.y * vector.y));
  CheckTrue(ReturnValue = InnerProductResult, Format('Wrong value, expected %f but was %f',[ReturnValue, InnerProductResult]));
end;

procedure TestTVector.TestAdd;
var
  ReturnValue: IVector;
  sameReference: Boolean;
  vector: IVector;
  AddResultx, AddResulty : Double;
  py: Double;
  px: Double;
begin
  px := 10;
  py := 10;
  sameReference := false;
  vector := TVector.New.SetPoint(px, py);
  FVector.SetPoint(12, 12);
  ReturnValue := FVector.Add(vector, sameReference);
  AddResultx := FVector.x + vector.x;
  AddResulty := FVector.y + vector.y;
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckFalse(FVector = ReturnValue, 'Wrong value, expected false but was true');
  sameReference := true;
  ReturnValue := nil;
  FVector.SetPoint(12, 12);
  AddResultx := FVector.x + vector.x;
  AddResulty := FVector.y + vector.y;
  ReturnValue := FVector.Add(vector, sameReference);
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckTrue(FVector = ReturnValue, 'Wrong value, expected true but was false');
end;

procedure TestTVector.TestSubstract;
var
  ReturnValue: IVector;
  sameReference: Boolean;
  vector: IVector;
  AddResultx, AddResulty : Double;
  py: Double;
  px: Double;
begin
  px := 10;
  py := 10;
  sameReference := false;
  vector := TVector.New.SetPoint(px, py);
  FVector.SetPoint(12, 12);
  ReturnValue := FVector.Substract(vector, sameReference);
  AddResultx := FVector.x - vector.x;
  AddResulty := FVector.y - vector.y;
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckFalse(FVector = ReturnValue, 'Wrong value, expected false but was true');
  sameReference := true;
  ReturnValue := nil;
  FVector.SetPoint(12, 12);
  AddResultx := FVector.x - vector.x;
  AddResulty := FVector.y - vector.y;
  ReturnValue := FVector.Substract(vector, sameReference);
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckTrue(FVector = ReturnValue, 'Wrong value, expected true but was false');
end;

procedure TestTVector.TestScalarProduct;
var
  ReturnValue: IVector;
  sameReference: Boolean;
  factor: Double;
  AddResultx, AddResulty : Double;
  py: Double;
  px: Double;
begin
  px := 12;
  py := 12;
  sameReference := false;
  factor := 15;
  FVector.SetPoint(px, py);
  ReturnValue := FVector.ScalarProduct(factor, sameReference);
  AddResultx := FVector.x * factor;
  AddResulty := FVector.y * factor;
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckFalse(FVector = ReturnValue, 'Wrong value, expected false but was true');
  sameReference := true;
  ReturnValue := nil;
  FVector.SetPoint(12, 12);
  AddResultx := FVector.x * factor;
  AddResulty := FVector.y * factor;
  ReturnValue := FVector.ScalarProduct(factor, sameReference);
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckTrue(FVector = ReturnValue, 'Wrong value, expected true but was false');
end;

procedure TestTVector.TestDivide;
var
  ReturnValue: IVector;
  factor: Double;
  AddResultx, AddResulty : Double;
  py: Double;
  px: Double;
begin
  px := 12;
  py := 12;
  factor := 15;
  FVector.SetPoint(px, py);
  AddResultx := FVector.x / factor;
  AddResulty := FVector.y / factor;
  ReturnValue := FVector.Divide(factor);
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckTrue(FVector = ReturnValue, 'Wrong value, expected true but was false');
end;

procedure TestTVector.TestDistance;
var
  ReturnValue: Double;
  vector: IVector;
  py: Double;
  px: Double;
  ReturnDistance : Double;
begin
  px := 12;
  py := 12;
  FVector.SetPoint(px, py);
  vector := TVector.New.SetPoint(px, py);
  ReturnValue := FVector.Distance(vector);
  ReturnDistance := FVector.Substract(vector).Magnitude;
  CheckTrue(ReturnValue = ReturnDistance, Format('Wrong value, expected %f but was %f',[ReturnValue, ReturnDistance]));
end;

procedure TestTVector.TestTimes;
var
  ReturnValue: IVector;
  vector: IVector;
  py: Double;
  px: Double;
  AddResultx, AddResulty : Double;
begin
  px := 12;
  py := 12;
  vector := TVector.New.SetPoint(px, py);
  ReturnValue := FVector.Times(vector);
  AddResultx := FVector.x * vector.x;
  AddResulty := FVector.y * vector.y;
  CheckTrue(ReturnValue.x = AddResultx, Format('Wrong value, expected %f but was %f',[ReturnValue.x, AddResultx]));
  CheckTrue(ReturnValue.y = AddResulty, Format('Wrong value, expected %f but was %f',[ReturnValue.y, AddResulty]));
  CheckFalse(FVector = ReturnValue, 'Wrong value, expected true but was false');
end;

procedure TestTVector.TestMagnitude;
var
  ReturnValue: Double;
  ReturnMagnitude : Double;
  py: Double;
  px: Double;
begin
  px := 12;
  py := 12;
  FVector.SetPoint(px, py);
  ReturnValue := FVector.Magnitude;
  ReturnMagnitude := sqrt(Sqr(FVector.x) + Sqr(FVector.y));
  CheckTrue(ReturnValue = ReturnMagnitude, Format('Wrong value, expected %f but was %f',[ReturnValue, ReturnMagnitude]));
end;

procedure TestTVector.TestNormalise;
var
  ReturnValue: IVector;
  ReturnNormalise : IVector;
  py: Double;
  px: Double;
  magnitude : double;
begin
  px := 12;
  py := 12;
  FVector.SetPoint(px, py);
  magnitude := (1 / sqrt(Sqr(FVector.x) + Sqr(FVector.y)));
  ReturnValue := FVector.Normalise;
  ReturnNormalise := FVector.ScalarProduct(magnitude, false);
  CheckTrue(TMathHelper.Compare(ReturnValue.x, ReturnNormalise.x, '='), Format('Wrong value, expected %f but was %f',[ReturnValue.x, ReturnNormalise.x]));
  CheckTrue(TMathHelper.Compare(ReturnValue.y, ReturnNormalise.y, '='), Format('Wrong value, expected %f but was %f',[ReturnValue.y, ReturnNormalise.y]));
end;

procedure TestTVector.TestToString;
var
  ReturnValue: string;
  value : string;
begin
  ReturnValue := FVector.ToString;
  value := 'Vector x:' + (FloatToStr(FVector.x) + ' y:' + FloatToStr(FVector.y));
  CheckTrue(ReturnValue = value, Format('Wrong value, expected %s but was %s',[ReturnValue, value]));
end;

procedure TestTVector.TestTurnAngle;
var
  angle: Double;
  py: Double;
  px: Double;
  magnitude : Double;
  AddResultx, AddResulty : Double;
  Sine, CoSine: Extended;
begin
  px := 12;
  py := 12;
  angle := 0.3;
  FVector.SetPoint(px, py);
  FVector.TurnAngle(angle);
  magnitude := sqrt(Sqr(px) + Sqr(py));
  SinCos(angle, Sine, CoSine);
  AddResultx := magnitude * CoSine * -1;
  AddResulty := magnitude * Sine * -1;
  CheckTrue(FVector.x = AddResultx, Format('Wrong value, expected %f but was %f',[FVector.x, AddResultx]));
  CheckTrue(FVector.y = AddResulty, Format('Wrong value, expected %f but was %f',[FVector.y, AddResulty]));
end;

procedure TestTVector.TestResetAngle;
var
  py: Double;
  px: Double;
  magnitude : Double;
begin
  px := 12;
  py := 12;
  FVector.SetPoint(px, py);
  FVector.ResetAngle;
  magnitude := sqrt(Sqr(px) + Sqr(py));
  CheckTrue(FVector.x = magnitude, Format('Wrong value, expected %f but was %f',[FVector.x, magnitude]));
  CheckTrue(FVector.y = 0, Format('Wrong value, expected %f but was %d',[FVector.y, 0]));
end;

procedure TestTVector.TestNew;
var
  ReturnValue: IVector;
begin
  ReturnValue := TVector.New;
  CheckTrue(ReturnValue.x = 0, Format('Wrong value, expected %f but was %d',[ReturnValue.x, 0]));
  CheckTrue(ReturnValue.y = 0, Format('Wrong value, expected %f but was %d',[ReturnValue.y, 0]));
end;

initialization
  RegisterTest(TestTVector.Suite);
end.

