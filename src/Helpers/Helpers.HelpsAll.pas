unit Helpers.HelpsAll;

interface

uses
  System.SysUtils, System.Classes, FMX.Forms, FMX.Objects, System.UIConsts,
  FMX.Types, FMX.InertialMovement, System.UITypes, FMX.Layouts, System.IOUtils;

type
  THelpsAll = class
  private
  public
   class function GenerateSalt: string;
   class procedure OpenForm(AClasseForm: TComponentClass; var AForm);
   class procedure SoftScroll(AScroll: TFmxObject);
   class function GetAssetsPath: string;
  end;

implementation

{ THelpsAll }

class procedure THelpsAll.SoftScroll(AScroll: TFmxObject);
var
  AniCalculations: TAnicalculations;
begin
  AniCalculations := TAnicalculations.Create(nil);
  try
    AniCalculations.Animation := True;
    AniCalculations.BoundsAnimation := True;
    AniCalculations.Averaging := True;
    AniCalculations.AutoShowing := True;
    AniCalculations.DecelerationRate := 0.5;
    AniCalculations.Elasticity := 50;

    if AScroll is TVertScrollBox then
      TVertScrollBox(AScroll).AniCalculations.Assign(AniCalculations)
    else if AScroll is THorzScrollBox then
      THorzScrollBox(AScroll).AniCalculations.Assign(AniCalculations);
  finally
    AniCalculations.DisposeOf;
  end;
end;

class function THelpsAll.GetAssetsPath: string;
begin
  Result := System.SysUtils.GetCurrentDir+'\Assets\';
end;

class procedure THelpsAll.OpenForm(AClasseForm: TComponentClass; var AForm);
begin
  try
    if Not Assigned(TForm(AForm)) then
    begin
     Application.CreateForm(AClasseForm, AForm);
    end;
  finally
    TForm(AForm).Show;
  end;
end;

class function THelpsAll.GenerateSalt: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := GUID.ToString().Replace('{', '').Replace('}', '').Replace('-', '');
end;

end.
