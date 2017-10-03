unit componentes1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType, LCLProc, LCLIntf, ActnList, LazUTF8, Menus, ComCtrls,
  FileUtil, ExtCtrls, Buttons, DbCtrls;

{   Classes, SysUtils, types, LCLStrConsts, LCLType, LCLProc, LMessages, Graphics,
  ExtendedStrings, LCLIntf, ActnList, Controls, TextStrings, LazUTF8,
  Forms, Menus, LResources;}
type
  TSDK3Button = class(TCustomButton)
  private

  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Enabled;
    property Visible;
  end;

type
  TSDK3ColorComboBox = class(TCustomComboBox)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Enabled;
    property Field: String read FField write FField;
    property Visible;
  end;

type
  TSDK3ComboBox = class(TCustomComboBox)
  private
    FField, FValues, FValue, FItems: String;
  protected

  public

  published
    property Align;
    property Enabled;
    property Field: String read FField write FField;
    property Font;
    property Items: String read FItems write FItems;
    property Text;
    property Value: String read FValue write FValue;
    property Values: String read FValues write FValues;
    property Visible;
  end;

type
  TSDK3CheckBox = class(TCustomCheckBox)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Checked;
    property Field: String read FField write FField;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Edit = class(TCustomEdit)
  private
    FField, FTextP: String;
    FTransp, FPass: Boolean;
    FMin, FMax, FNumber: Double;
    FDecP: Integer;
  protected

  public

  published
    property Align;
    property Transparent: Boolean read FTransp write FTransp;
    property IsPasswordEdit: Boolean read FPass write FPass;
    property TextPrompt: String read FTextP write FTextP;
    property Font;
   // property Typee: String read FType write FType;
   //keyboardType
   // enterKeyType
    property Min: Double read FMin write FMin;
    property Max: Double read FMax write FMax;
    property DecimalPlaces: Integer read FDecP write FDecP;
    property Field: String read FField write FField;
    property Enabled;
    property AsNumber: Double read FNumber write FNumber;
    property Text;
    property Visible;
  end;

type
  TSDK3FlowLayout = class(TCustomFlowPanel)
  private
    autoH: Boolean;
    maxCon, maxCol: Integer;
    lineS, contentW, contentH: Double;
    frameS, frameR: String;
  protected

  public

  published
    property Align;
    property AutoHeight: Boolean read autoH write autoH;
    //horzAlign
    //orientation
    property MaxControlsPerLine: Integer read maxCon write maxCon;
    property MaxColumns: Integer read maxCol write maxCol;
    property LineSpacing: Double read lineS write lineS;
    property ContentWidth: Double read contentW write contentW;
    property ContentHeight: Double read contentH write contentH;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Image = class(TCustomImage)
  private
    FSrc, FField, FURLWhileLoading: String;
    FCenter, FOptimize, FShowP, Feditable: Boolean;
    FnaturalWidth, FnaturalHeight: Double;
  protected

  public

  published
    property Align;
    property Src: String read FSrc write FSrc;
    property URLWhileLoading: String read FURLWhileLoading write FURLWhileLoading;
    property Field: String read FField write FField;
    //showStyle
    property Center: Boolean read FCenter write FCenter;
    property Optimize: Boolean read FOptimize write FOptimize;
    property ShowProgress: Boolean read FShowP write FShowP;
    property Editable: Boolean read Feditable write Feditable;
    property NaturalWidth: Double read FnaturalWidth write FnaturalWidth;
    property NaturalHeight: Double read FnaturalHeight write FnaturalHeight;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Layout = class(TCustomPanel)
  private
    frameS, frameR: String;
  protected

  public

  published
    property Align;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
  end;

type
  TSDK3FlowPart = class(TCustomPanel)
  private
    FminWidth, FMaxWidth, FminScaledWidth, FMaxScaledWidth: Double;
    FAvoid, FadjustHeightToLine: Boolean;
    FstepSizes: String;
    frameS, frameR: String;
  protected

  public

  published
    property Align;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
    property MinWidth: Double read FminWidth write FminWidth;
    property MaxWidth: Double read FMaxWidth write FMaxWidth;
    property MinScaledWidth: Double read FminScaledWidth write FminScaledWidth;
    property MaxScaledWidth: Double read FMaxScaledWidth write FMaxScaledWidth;
    property AvoidScale: Boolean read FAvoid write FAvoid;
    property adjustHeightToLine: Boolean read FadjustHeightToLine write FadjustHeightToLine;
    //vertAlign
    property StepSizes: String read FstepSizes write FstepSizes;

end;

type
  TSDK3ImageCheckBox = class(TCustomImage)
  private
         FField, FcheckedImage, FUncheckedImage: String;
         FautoChange, FCheck, FOptimize: Boolean;
  protected

  public

  published
    property Align;
    property Field: String read FField write FField;
    property Checked: Boolean read FCheck write FCheck;
    property Optimize: Boolean read FOptimize write FOptimize;
    property Enabled;
    property Visible;
    property Caption;
    property CheckedImage: String read FcheckedImage write FcheckedImage;
    property UncheckedImage: String read FUncheckedImage write FUncheckedImage;
    property AutoChange: Boolean read FautoChange write FautoChange;
  end;

type
  TSDK3Label = class(TCustomLabel)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Font;
    property Field: String read FField write FField;
    property Enabled;
    property Text;
    property Visible;
    property AutoSize;
  end;

type
  TSDK3ProgressBar = class(TCustomProgressBar)
  private
    FField: String;
    FmouseGlow: Boolean;
    FMin, FMax, FPosition: Double;
  protected

  public

  published
    property Align;
    property Color;
    property Position: Double read FPosition write FPosition;
    property Field: String read FField write FField;
    property Enabled;
    property Min: Double read FMin write FMin;
    property Max: Double read FMax write FMax;
    //fieldMin
    //fieldMax
    // colorMode
    property mouseGlow: Boolean read FmouseGlow write FmouseGlow;
    property Visible;
  end;

type
  TSDK3RadioButton = class(TCustomCheckBox)
  private
    FField, FGroupName, FFieldValue: String;
  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Checked;
    property GroupName: String read FGroupName write FGroupName;
    property FieldValue: String read FFieldValue write FFieldValue;
    property Field: String read FField write FField;
    property Enabled;
    property Visible;
  end;

type
  TSDK3TabControl = class(TCustomTabControl)
  private
         FTab: Integer;
  protected

  public

  published
    property Align;
    property Enabled;
    property TabIndex: Integer read FTab write FTab;
    property Visible;
  end;
{
type
  TSDK3Rectangle = class(TShape)
  private

  protected

  public

  published

  end;
}

type
  TSDK3RichEdit = class(TCustomMemo)
  private
    FROnly, FshowToolbar, FhideSelection: Boolean;
    FField: String;
    FBackColor, fdefaultFontColor: TColor;
    FdefaultFontSize: Double;
  protected

  public

  published
    property Align;
    property BackgroundColor: TColor read FBackColor write FBackColor;
    property DefaultFontColor: Tcolor read FdefaultFontColor write FdefaultFontColor;
    property DefaultFontSize: Double read FdefaultFontSize write FdefaultFontSize;
    property Enabled;
    property Field: String read FField write FField;
    property ReadyOnly: Boolean read FROnly write FROnly;
    property ShowToolbar: Boolean read FshowToolbar write FshowToolbar;
    property HideSelection: Boolean read FhideSelection write FhideSelection;
    property Visible;
  end;

type
  TSDK3ScrollBox = class(TScrollBox)
  private

  protected

  public

  published

  end;

procedure Register;

implementation

procedure Register;
begin
  {$I componentes1_icon.lrs}
  RegisterComponents('RRPGSDK3',[TSDK3Button, TSDK3ColorComboBox, TSDK3ComboBox,
  TSDK3CheckBox, TSDK3Edit, TSDK3FlowLayout, TSDK3Image, TSDK3Layout, TSDK3FlowPart,
  TSDK3ImageCheckBox, TSDK3Label, TSDK3ProgressBar, TSDK3RadioButton, TSDK3TabControl,
  TCustomPage, TSDK3RichEdit, TSDK3ScrollBox]);
end;

end.
