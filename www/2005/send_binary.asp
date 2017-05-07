<%
	Response.Expires = 0
	
	' create instance of AspJpeg
	Set jpg = Server.CreateObject("Persits.Jpeg")
	
	' Open source file
	jpg.Open( Request("path") )

	' Set resizing algorithm
	jpg.Interpolation = Request("Interpolation")

	' Set new height and width
	jpg.Width = Request("Width")
	jpg.Height = Request("Height")
	
	' Sharpen resultant image
	If Request("Sharpen") <> "0" Then 
		jpg.Sharpen 1, Request("SharpenValue")
	End If

	' Rotate if necessary. Only available in version 1.2
	If Request("Rotate") = 1 Then jpg.RotateL
	If Request("Rotate") = 2 Then jpg.RotateR

	' Perform resizing and 
	' send resultant image to client browser
	jpg.SendBinary
%>
