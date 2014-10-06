
{ TickerBTCE
���� ������ ������� ��� ��������� BTC-Ealarm, ���  ��������� ������ � ����� BTC-e.
 ��� ������ ������ ��������� ���������� Synapse � ������ uLkJSON.pas ������� ������ ����� �� � ���� ������� blog.kolja153.com.
���� ������ ������� ��� ������� �������������. ����������� ������������, ������ ������ ��� ������ �� ������.
 ����� Kolja153. ������ ������ �� ������ �� ������ https://bitcointalk.org . http://blog.kolja153.com/. https://forum.btcsec.com/index.php?/blog/90-kolja153s-blog/
 
������       : BTC = 1F3BtisPs8dtKLSATLWqe1SH44P4VQuX6o���������������������
               LTC = LdGP4AqWD4N3Fnffm7jgMmvW1U3TQ9KExN


}
unit TickerBTCE;

interface

uses
  Classes, httpsend,synacode,ssl_openssl,SysUtils,
  uLkJSON, URLMon,DateUtils;

{���������� �������� last,buy,sell,date,time,high,low,avg,vol,vol_cur,update,uptime (������) ��� ��������� Link (�������� https://btc-e.com/api/2/btc_usd/ticker)}
function AnswerLink(link:string; var last,buy,sell,date,time,high,low,avg,vol,vol_cur,update,uptime:string):string;

{���������� ���� �������� last,buy,sell,date,time,high,low,avg,vol,vol_cur,update,uptime (������) ��� ��������� Pair (�������� btc_usd, buy)}
function AnswerPair(Pair,parametr:string; var value:real):real;

{���������� 5 �������� last,buy,sell,date,time (������) ��� ��������� Pair (�������� btc_usd, last,buy,sell,date,time)}
function AnswerPair1(Pair:string; var last,buy,sell,date,time:string):string;

{���������� 7 �������� high,low,avg,vol,vol_cur,update,uptime (������) ��� ��������� Pair (�������� btc_usd, high,low,avg,vol,vol_cur,update,uptime)}
function AnswerPair2(Pair:string; var high,low,avg,vol,vol_cur,update,uptime:string):string;

{����������  �������� last (real) ��� ��������� Pair (�������� btc_usd, last)}
function AnswerLast(Pair:string):real;

{����������  �������� buy (real) ��� ��������� Pair (�������� btc_usd, buy)}
function AnswerBuy(Pair:string):real;

{����������  �������� shell (real) ��� ��������� Pair (�������� btc_usd, shell)}
function AnswerSell(Pair:string):real;

{����������  �������� Err  (boolean) ��� ��������� Pair (�������� btc_usd, last) ��������� �� ����� ����}
function AnswerErr(Pair:string;var err:boolean):string;

implementation

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AnswerLink(link:string; var last,buy,sell,date,time,high,low,avg,vol,vol_cur,update,uptime:string):string;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET',Link) then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;
last:= (js.Field['last'].Value);
result :=last;
buy:= (js.Field['buy'].Value);
result :=buy; ;

sell:= (js.Field['sell'].Value);
result :=sell;

date := DateToStr( UnixToDateTime(strtoint(js.Field['server_time'].Value)));
result :=date;

time := TimeToStr( UnixToDateTime(strtoint(js.Field['server_time'].Value)));
result :=uptime;


high:= (js.Field['high'].Value);
result :=high;

avg:= (js.Field['avg'].Value);
result :=avg;

vol:= (js.Field['vol'].Value);
result :=vol;

vol_cur:= (js.Field['vol_cur'].Value);
result :=vol_cur;

update:= DateToStr( UnixToDateTime(strtoint(js.Field['updated'].Value)));
result :=update;

uptime:= timeToStr( UnixToDateTime(strtoint(js.Field['updated'].Value)));
result :=uptime;

ts.Free;

end;
end;

////////////////////////////////////////////////////////////////////////////////////////


function AnswerPair(Pair,parametr:string; var value:real):real;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;

value:= strtofloat(js.Field[parametr].Value);
result :=value;
ts.Free;
 end;
end;


//////////////////////////////////////////////////////////////////////////////////

function AnswerPair1(Pair:string; var last,buy,sell,date,time:string):string;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;

 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;
last:= (js.Field['last'].Value);
result :=last;
buy:= (js.Field['buy'].Value);
result :=buy; ;

sell:= (js.Field['sell'].Value);
result :=sell;

date := DateToStr( UnixToDateTime(strtoint(js.Field['server_time'].Value)));
result :=sell;

time := TimeToStr( UnixToDateTime(strtoint(js.Field['server_time'].Value)));
result :=sell;

ts.Free;

end;

end;

//////////////////////////////////////////////////////////////////////////////////////////////

function AnswerPair2(Pair:string; var high,low,avg,vol,vol_cur,update,uptime:string):string;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;

high:= (js.Field['high'].Value);
result :=high;

avg:= (js.Field['avg'].Value);
result :=avg;

vol:= (js.Field['vol'].Value);
result :=vol;

vol_cur:= (js.Field['vol_cur'].Value);
result :=vol_cur;

update:= DateToStr( UnixToDateTime(strtoint(js.Field['updated'].Value)));
result :=update;

uptime:= timeToStr( UnixToDateTime(strtoint(js.Field['updated'].Value)));
result :=uptime;

ts.Free;

end;

end;

///////////////////////////////////////////////////////////////////////////

function AnswerLast(Pair:string):real;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;

result:=strtofloat( (js.Field['last'].Value));


ts.Free;

end;

end;

///////////////////////////////////////////////////////////////////////////

function AnswerBuy(Pair:string):real;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

 js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
 js := js.Field['ticker'] as TlkJSONobject;

result:=strtofloat( (js.Field['buy'].Value));


ts.Free;

end;

end;

///////////////////////////////////////////////////////////////////////////

function AnswerSell(Pair:string):real;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;

 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);      //   �������� ����  � �����

  js := TlkJSON.ParseText(ts.Text ) as TlkJSONobject;
  js := js.Field['ticker'] as TlkJSONobject;
result:= (js.Field['sell'].Value);

ts.Free;


end;

end;

//////////////////////////////////////////////////////////////////////////////////////
function AnswerErr(Pair:string;var err:boolean):string;
var Http:THttpsend;
    ts : TStringList;
    var js:TlkJSONobject;
begin
 Http:= Thttpsend.Create;
 if Http.HTTPMethod('GET','https://btc-e.com/api/2/'+Pair+'/ticker') then
  Begin
  ts:= TStringList.Create;               //
  ts.LoadFromStream(Http.Document);        //   �������� ����  � �����
 if copy(ts.Text,3,5)='error' then
  begin
  err:=true;
  result:='Error: invalid pair'
  end
  else
  begin
  err:=false;
  result:='good';

 end;
end;
end;

end.

