unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TickerBTCE, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;

    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Pair:string;
implementation

{$R *.dfm}




procedure TForm1.Timer1Timer(Sender: TObject);
begin
Label2.Caption:=Pair;
Label1.Caption:=floattostr(TickerBTCE.AnswerLast(pair))+' usd';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
pair:='btc_usd';
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Label1DblClick(Sender: TObject);
begin
form1.Close;
end;

end.
