<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<script language="JavaScript">
<!--
 function valida(form) {
  var emailOK = isEmailValid(form,'Email'); 
  
  if (form.CEP.value != "") 
  {
	if (isNaN(form.CEP.value)){
		alert("Favor entrar com um valor válido no campo \"CEP\".");
		form.CEP.focus();
		return (false);
	}
  }
  if (form.Email.value == "") 
	{
		window.alert('Favor entrar o email.');
		form.Email.focus();
		 return (false);
	 }
  if (!(isEmail(form.Email.value))) 
	 {
		alert("Favor entrar com um e-mail válido no campo \"Email\".");
		form.Email.focus();
		 return (false);
	 }
	
  if (form.DataNascimento.value.length > 10) 
	 {
		alert("Favor entrar com uma data válida no campo \"Data de nascimento\".");
		form.Email.focus();
		 return (false);
	 }
	 
  if (form.Nome.value == "") {
    alert("Favor entrar com um valor no campo \"Nome\".");
    form.Nome.focus();
    return (false);
  } else
  if (form.Apelido.value == "") {
    alert("Favor entrar com um valor no campo \"Apelido\".");
    form.Apelido.focus();
    return (false);
  } else
  if (form.Cidade.value == "") {
    alert("Favor entrar com um valor no campo \"Cidade\".");
    form.Cidade.focus();
    return (false);
  } else
  if (form.UF.options[form.UF.selectedIndex].value == "0") {
    alert("Favor entrar com um valor válido no campo \"Estado\".");
    form.UF.focus();
    return (false);
  } else
  if (form.DataNascimento.value == "") {
    alert("Favor entrar com um valor no campo \"Data de Nascimento\".");
    form.DataNascimento.focus();

    return (false);
  } else
  
  if (checkdate(form1.DataNascimento) == false)
	{
		alert("Favor entrar com uma data válida no campo \"Data de Nascimento\".");
		form.DataNascimento.focus();
		return (false);
	} else
  if (form.Sexo.options[form.Sexo.selectedIndex].value == "0") {
    alert("Favor entrar com um valor válido no campo \"Sexo\".");
    form.Sexo.focus();
    return (false);
  } else
  if (form.EstadoCivil.options[form.EstadoCivil.selectedIndex].value == "0") {

    alert("Favor entrar com um valor válido no campo \"Estado Civil\".");
    form.EstadoCivil.focus();
    return (false);
  } else
  if (form.Telefone.value == "") {
    alert("Favor entrar com um valor no campo \"Telefone\".");
    form.Telefone.focus();
    return (false);
  } else
  if(!emailOK) {
    window.alert('Por favor, entre com um endereço válido no campo "e-mail".'); 
    return(false); 
  } else
  return(true);
 }
//-->
</script>
<script language="JavaScript">
<!-- 

function isEmail(strValue)
{
	var objRegExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	return objRegExp.test(strValue);
}

function checkdate(objName) {
var datefield = objName;
if (chkdate(objName) == false) {
datefield.select();
alert("Data inválida.");
datefield.focus();
return false;
}
else {
return true;
   }
}
function chkdate(objName) {
var strDatestyle = "EU";  //Europa
var strDate;
var strDateArray;
var strDay;
var strMonth;
var strYear;
var intday;
var intMonth;
var intYear;
var booFound = false;
var datefield = objName;
var strSeparatorArray = new Array("-"," ","/",".");
var intElementNr;
var err = 0;
var strMonthArray = new Array(12);
strMonthArray[0] = "01";
strMonthArray[1] = "02";
strMonthArray[2] = "03";
strMonthArray[3] = "04";
strMonthArray[4] = "05";
strMonthArray[5] = "06";
strMonthArray[6] = "07";
strMonthArray[7] = "08";
strMonthArray[8] = "09";
strMonthArray[9] = "10";
strMonthArray[10] = "11";
strMonthArray[11] = "12";
strDate = datefield.value;
if (strDate.length < 1) {
return true;
}
for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) {
strDateArray = strDate.split(strSeparatorArray[intElementNr]);
if (strDateArray.length != 3) {
err = 1;
return false;
}
else {
strDay = strDateArray[0];
strMonth = strDateArray[1];
strYear = strDateArray[2];
}
booFound = true;
   }
}
if (booFound == false) {
if (strDate.length>5) {
strDay = strDate.substr(0, 2);
strMonth = strDate.substr(2, 2);
strYear = strDate.substr(4);
   }
}
if (strYear.length == 2) {
strYear = '20' + strYear;
}
// US style
if (strDatestyle == "US") {
strTemp = strDay;
strDay = strMonth;
strMonth = strTemp;
}
intday = parseInt(strDay, 10);
if (isNaN(intday)) {
err = 2;
return false;
}
intMonth = parseInt(strMonth, 10);
if (isNaN(intMonth)) {
for (i = 0;i<12;i++) {
if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
intMonth = i+1;
strMonth = strMonthArray[i];
i = 12;
   }
}
if (isNaN(intMonth)) {
err = 3;
return false;
   }
}
intYear = parseInt(strYear, 10);
if (isNaN(intYear)) {
err = 4;
return false;
}
if (parseInt(intYear) < 1900 ) {
err = 4;
return false;
}
if (intMonth>12 || intMonth<1) {
err = 5;
return false;
}
if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
err = 6;
return false;
}
if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
err = 7;
return false;
}
if (intMonth == 2) {
if (intday < 1) {
err = 8;
return false;
}
if (LeapYear(intYear) == true) {
if (intday > 29) {
err = 9;
return false;
}
}
else {
if (intday > 28) {
err = 10;
return false;
}
}
}
if (strDatestyle == "US") {
datefield.value = strMonthArray[intMonth-1] + " " + intday+" " + strYear;
}
else {
datefield.value = intday + "/" + strMonthArray[intMonth-1] + "/" + strYear;
	
}


return true;
	

}



function LeapYear(intYear) {
if (intYear % 100 == 0) {
if (intYear % 400 == 0) { return true; }
}
else {
if ((intYear % 4) == 0) { return true; }
}
return false;
}
function doDateCheck(from, to) {
if (Date.parse(from.value) <= Date.parse(to.value)) 
{
alert("Data inválida.");
}
else 
{
	if (from.value == "" || to.value == "") 
		alert("Entre com a data de nascimento.");
	else 
		alert("Data inválida.");
}
}
//  End -->
</script>
<body>

</body>
</html>
