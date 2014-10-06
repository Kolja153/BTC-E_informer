unit BtcE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TickerBTCE;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var buy:real;
begin
memo1.Lines.Add(floattostr(TickerBTCE.AnswerSell('btc_usd')));
end;

end.
