<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <title>Panel de Juego RdP</title>

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Añado para Bootstrap-->
        <link rel="stylesheet" href="./../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./../bootstrap/css/bootstrap-theme.min.css">
        <script src="./../bootstrap/js/bootstrap.min.js"></script>
        <link href="../Content/Site.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<script src="menuPrincipal.js"></script>  
</head>
<body>
    <form id="form1" runat="server">

        <asp:gridview autogeneratecolumns="False" id="grvPrueba" runat="server">
<columns>
 <asp:templatefield headertext="Prueba de Combo">
   <headertemplate> Prueba de Combo </headertemplate>
   <itemtemplate>                                                         
     <asp:dropdownlist id="cboComboPrueba" runat="server" width="40px"></asp:dropdownlist>
   </itemtemplate>                                                             
  </asp:templatefield>
 </columns>
 </asp:gridview>
    </form>
</body>
</html>