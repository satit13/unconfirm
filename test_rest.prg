#Define clAsync .F.
#Define ccAPIKey '{your API key}'
loRequest = Createobject('MsXml2.XmlHttp')
*loRequest.SetRequestHeader('X-CustomerToken',ccAPIKey)
loRequest.Open("GET","http://localhost:9000", clAsync)
loRequest.Send()
? loRequest.Status
*? loRequest.ResponseText 


 SET PROCEDURE TO qdfoxjson.prg
 
 jsonstart()
a = loRequest.responseText
 *json.parseCursor(loRequest.ResponseText,'CursorTest')

*BROWSE

o = JSON.Parse(loRequest.ResponseText)

FOR i = 1 TO o.count
	r = o.item(i)
	?'id : ' + ALLTRIM(STR(INT(r.id)))
	?'code : ' + r.code
	?'name : '+ r.Name
	?' price : '+ALLTRIM(STR(r.Price))
	?"--------------------------"
ENDFOR 
*!*	? "Json encode"

*!*	?json_encode(loRequest.ResponseText )


*set proc to json additive

* test table customer
*!*	create cursor customers (id n(5), name c(50), lastname c(50), phone c(30))
*!*	insert into customers values (1,'Ignacio','Gutierrez','(653)534-8800')
*!*	insert into customers values (2,'Antonio','Esparza','(81)8347-1411')
*!*	insert into customers values (3,'David','Flores','(653)534-2755')

*!*	* parse first record
*!*	? 'Json Representing for each customer'
*!*	select customers
*!*	scan
*!*		? recordToJson()
*!*	endscan

*!*	?
*!*	? 
*!*	? 'Now json represent of a whole table'
*!*	go top
*!*	? tableToJson()