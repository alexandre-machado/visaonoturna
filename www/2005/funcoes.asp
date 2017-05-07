<%
Session.LCID = 1046

session("ok")="1"
dim dia_sem
	dia_sem=Array("Domingo", "Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Sexta Feira", "Sábado")

Function data_inv(x)

	dim y,z,w
	y=day(x)
	z=month(x)
	w=Year(x)
	data_inv=z&"/"&y&"/"&w

End function

Function data_1(x) '28/09/1983
	dim y,z,w
	y=day(x)
	z=month(x)
	w=Year(x)
	IF y<10 THEN
		y="0"&y
	END IF
	IF z<10 THEN
		z="0"&z
	END IF
	data_1=y&"/"&z&"/"&w
End Function

Function data_2(x) '28/09
	dim y,z,w
	y=day(x)
	z=month(x)
	IF y<10 THEN
		y="0"&y
	END IF
	IF z<10 THEN
		z="0"&z
	END IF
	data_2=y&"/"&z
End Function

Function data_3(x) '1983_9_28
	dim y,z,w
	y=day(x)
	z=month(x)
	w=Year(x)
	data_3=w&"_"&z&"_"&y
End Function

Function data_4(x) '28/09/83
	dim y,z,w
	y=day(x)
	z=month(x)
	w=Year(x)
	IF y<10 THEN
		y="0"&y
	END IF
	IF z<10 THEN
		z="0"&z
	END IF
	data_4=y&"/"&z&"/"&mid(w,3,2)
End Function

Function link_end_(end_link,local,data) ' testa os enderecos das casas no banco de dados
	dim y
	IF IsNull(end_link)=true THEN              'aqui deu bolo
		y=local & "/" & Year(data) & "_" & month(data) & "_" & day(data)
	ELSE
		y=end_link
	END IF
	link_end_=y
End Function

Function link_pop_(id)
	dim x1,x2
	x1="javascript:MM_openBrWindow('pop_up_index.asp?id="
	x2="','pop_fotos','status=yes,scrollbars=yes,width=700,height=356')"',356,700,20,20)"
	link_pop_=x1 & id & x2
End Function

Function nome_(x,y) 'corta o texto "x" em "y" letras
	IF len(x)>y THEN
	nome_=rtrim(mid(x,1,y-3)) & "..."
	ELSE
	nome_=x
	END IF
End Function

Function por_(x) 'lista os nomes dos fotografos
	por_=""
	dim mysqlx
	mysqlx="SELECT tb_cobertura.COB_data, tb_fotografo.FOT_nick, tb_cobertura.COB_por, tb_cobertura.COB_nome_festa, tb_local.LOC_nome FROM tb_local RIGHT JOIN (tb_fotografo INNER JOIN (tb_cobertura INNER JOIN tb_relacao_fot_cob ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_id)="&x&"));"
	Set RT=Conn.Execute(mysqlx)
	IF NOT RT.EOF THEN 
		Do While Not RT.EOF
			por_=por_ & RT("FOT_nick")
			RT.MoveNext
			IF RT.EOF THEN
				por_=por_ & "."
			ELSE
				por_=por_ & ", "
			END IF
		Loop
	ELSE
		Set RT=Conn.Execute("SELECT tb_cobertura.COB_por FROM tb_cobertura WHERE (((tb_cobertura.COB_id)="&x&"));")
		por_=RT("COB_por")
	END IF
End Function

Function secure_(x,y)
	Select case y
		case 0 'tem que ser numero
			IF IsNumeric(x) THEN
			Response.Write("erro")
			END IF
	End select
End Function

Function rnd_(x)
	Randomize
	rnd_=Int(x * Rnd )+1
End Function

function testefoto_()
	Set RF=Conn.Execute("SELECT tb_id_foto.IDF_id, tb_id_foto.IDF_id_cob, tb_id_foto.IDF_n_foto FROM tb_id_foto WHERE (((tb_id_foto.IDF_id_cob)="&Request("id")&") AND ((tb_id_foto.IDF_n_foto)="&n_foto&"));")
	IF RF.EOF THEN
		Set RF=Conn.Execute("INSERT INTO tb_id_foto (IDF_id_cob, IDF_n_foto) VALUES('"&Request("id")&"','"&n_foto&"')")
		Set RF=Conn.Execute("SELECT tb_id_foto.IDF_id, tb_id_foto.IDF_id_cob, tb_id_foto.IDF_n_foto FROM tb_id_foto WHERE (((tb_id_foto.IDF_id_cob)="&Request("id")&") AND ((tb_id_foto.IDF_n_foto)="&n_foto&"));")
	END IF
End Function

%>