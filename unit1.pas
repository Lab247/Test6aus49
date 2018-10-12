unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TfrmTest }

  TfrmTest = class(TForm)
    btnClose: TButton;
    btnDo: TButton;
    btnReset: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnDoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdatePanels;
  private

  public

  end;

var
  frmTest: TfrmTest;
  my_array : array[1..7] of integer;
  run, attempt, i, j, unsorted : integer;
  valid : boolean;

implementation

{$R *.lfm}

{ TfrmTest }
procedure TfrmTest.FormCreate(Sender: TObject);
begin
   run := 0;
end;

procedure TfrmTest.btnDoClick(Sender: TObject);
begin
     if run < 7 then
        begin
          run := run + 1;
          randomize;

          repeat
                attempt := random(49)+1;
                valid := true;
                for i := 1 to run-1 do
                  begin
                       if attempt = my_array[i] then
                          valid := false;
                  end;

          until valid = true;

          my_array[run] := attempt;

          if (run > 1) and (run < 7) then
             begin
                unsorted := my_array[run];
                j := run;
                while (j > 1) and (my_array[j-1] > unsorted) do
                      begin
                           my_array[j] := my_array[j-1];
                           j := j-1;
                      end;
                my_array[j] := unsorted;
             end;
        end;

     UpdatePanels;
end;

procedure TfrmTest.btnResetClick(Sender: TObject);
var i : integer;
begin
  for i:=1 to 7 do
    my_array[i] := 0;

    UpdatePanels;

  run := 0;

end;

procedure TfrmTest.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTest.UpdatePanels;
begin
     pnl1.Caption := IntToStr(my_array[1]);
     pnl2.Caption := IntToStr(my_array[2]);
     pnl3.Caption := IntToStr(my_array[3]);
     pnl4.Caption := IntToStr(my_array[4]);
     pnl5.Caption := IntToStr(my_array[5]);
     pnl6.Caption := IntToStr(my_array[6]);
     pnl7.Caption := IntToStr(my_array[7]);
end;

end.

