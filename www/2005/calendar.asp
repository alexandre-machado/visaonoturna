<%
'*******************************************************
'*     ASP 101 Sample Code - http://www.asp101.com     *
'*                                                     *
'*   This code is made available as a service to our   *
'*      visitors and is provided strictly for the      *
'*               purpose of illustration.              *
'*                                                     *
'* Please direct all inquiries to webmaster@asp101.com *
'*******************************************************
%>

<%
' ***Begin Function Declaration***
' New and improved GetDaysInMonth implementation.
' Thanks to Florent Renucci for pointing out that I
' could easily use the same method I used for the
' revised GetWeekdayMonthStartsOn function.
Function GetDaysInMonth(iMonth, iYear)
	Dim dTemp
	dTemp = DateAdd("d", -1, DateSerial(iYear, iMonth + 1, 1))
	GetDaysInMonth = Day(dTemp)
End Function

' Previous implementation on GetDaysInMonth
'Function GetDaysInMonth(iMonth, iYear)
'	Select Case iMonth
'		Case 1, 3, 5, 7, 8, 10, 12
'			GetDaysInMonth = 31
'		Case 4, 6, 9, 11
'			GetDaysInMonth = 30
'		Case 2
'			If IsDate("February 29, " & iYear) Then
'				GetDaysInMonth = 29
'			Else
'				GetDaysInMonth = 28
'			End If
'	End Select
'End Function

Function GetWeekdayMonthStartsOn(dAnyDayInTheMonth)
	Dim dTemp
	dTemp = DateAdd("d", -(Day(dAnyDayInTheMonth) - 1), dAnyDayInTheMonth)
	GetWeekdayMonthStartsOn = WeekDay(dTemp)
End Function

Function SubtractOneMonth(dDate)
	SubtractOneMonth = DateAdd("m", -1, dDate)
End Function

Function AddOneMonth(dDate)
	AddOneMonth = DateAdd("m", 1, dDate)
End Function
' ***End Function Declaration***


Dim dDate     ' Date we're displaying calendar for
Dim iDIM      ' Days In Month
Dim iDOW      ' Day Of Week that month starts on
Dim iCurrent  ' Variable we use to hold current day of month as we write table
Dim iPosition ' Variable we use to hold current position in table


' Get selected date.  There are two ways to do this.
' First check if we were passed a full date in RQS("date").
' If so use it, if not look for seperate variables, putting them togeter into a date.
' Lastly check if the date is valid...if not use today
If IsDate(Request.QueryString("date")) Then
	dDate = CDate(Request.QueryString("date"))
Else
	If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
		dDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
	Else
		dDate = Date()
		' The annoyingly bad solution for those of you running IIS3
		If Len(Request.QueryString("month")) <> 0 Or Len(Request.QueryString("day")) <> 0 Or Len(Request.QueryString("year")) <> 0 Or Len(Request.QueryString("date")) <> 0 Then
			Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
		End If
		' The elegant solution for those of you running IIS4
		'If Request.QueryString.Count <> 0 Then Response.Write "The date you picked was not a valid date.  The calendar was set to today's date.<BR><BR>"
	End If
End If

'Now we've got the date.  Now get Days in the choosen month and the day of the week it starts on.
iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
iDOW = GetWeekdayMonthStartsOn(dDate)

%>
<!-- Outer Table is simply to get the pretty border-->
<TABLE class="a" width="140" BORDER=0 CELLPADDING=1 CELLSPACING=1 BGCOLOR=#FFC891>
	<TR>
		<TD BGCOLOR=#8482FF ALIGN="center" COLSPAN=7>
			<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
				<TR>
					<TD ALIGN="right"><A class="a" HREF="pag_festas.asp?date=<%= SubtractOneMonth(dDate) %>"><FONT COLOR=#FFFFFF SIZE="2" face="Verdana, Arial, Helvetica, sans-serif">&lt;&lt;</FONT></A></TD>
					<TD ALIGN="center"><FONT COLOR=#FFFFFF size="2" face="Verdana, Arial, Helvetica, sans-serif"><B><%= MonthName(Month(dDate)) & "  " & Year(dDate) %></B></FONT></TD>
					<TD ALIGN="left"><A class="a" HREF="pag_festas.asp?date=<%= AddOneMonth(dDate) %>"><FONT COLOR=#FFFFFF SIZE="2" face="Verdana, Arial, Helvetica, sans-serif">&gt;&gt;</FONT></A></TD>
				</TR>
	  </TABLE>		</TD>
	</TR>
	<TR bgcolor="#FF9900">
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>D</B></FONT></TD>
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>S</B></FONT></TD>
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>T</B></FONT></TD>
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>Q</B></FONT></TD>
	  <TD ALIGN="center" bgcolor="#ff9900"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>Q</B></FONT></TD>
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>S</B></FONT></TD>
	  <TD ALIGN="center"><FONT COLOR=#FFFFFF face="Verdana, Arial, Helvetica, sans-serif"><B>S</B></FONT></TD>
  </TR>
<%
' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
If iDOW <> 1 Then
	Response.Write vbTab & "<TR bgcolor=""#FF9900"">" & vbCrLf
	iPosition = 1
	Do While iPosition < iDOW
		Response.Write vbTab & vbTab & "<TD bgcolor=""#FF9900"">&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
End If

' Write days of month in proper day slots
iCurrent = 1
iPosition = iDOW
Do While iCurrent <= iDIM
	' If we're at the begginning of a row then write TR
	If iPosition = 1 Then
		Response.Write vbTab & "<TR bgcolor=""#FF9900"">" & vbCrLf
	End If
	
	' If the day we're writing is the selected day then highlight it somehow.
	If iCurrent = Day(dDate) Then
		Response.Write vbTab & vbTab & "<TD align=""center"" bgcolor=""#FFC891""><FONT SIZE=""-1""><B>" & iCurrent & "</B></FONT><BR></TD>" & vbCrLf
	Else
		Response.Write vbTab & vbTab & "<TD align=""center""><A HREF=""pag_festas.asp?date=" & iCurrent & "/" & Month(dDate) & "/" & Year(dDate) & """><FONT SIZE=""-1"">" & iCurrent & "</FONT></A><BR></TD>" & vbCrLf
	End If
	
	' If we're at the endof a row then write /TR
	If iPosition = 7 Then
		Response.Write vbTab & "</TR>" & vbCrLf
		iPosition = 0
	End If
	
	' Increment variables
	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
Loop

' Write spacer cells at end of last row if month doesn't end on a Saturday.
If iPosition <> 1 Then
	Do While iPosition <= 7
		Response.Write vbTab & vbTab & "<TD>&nbsp;</TD>" & vbCrLf
		iPosition = iPosition + 1
	Loop
	Response.Write vbTab & "</TR>" & vbCrLf
End If
%>
</TABLE>

