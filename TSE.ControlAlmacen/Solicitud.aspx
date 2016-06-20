<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="TSE.ControlAlmacen.Entrada.Solicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
     <link href="../Content/Site.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
 </head>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <h1 class="Defaulth3">SOLICITUD DE ENVIO DE MATERIAL A BODEGA</h1>
        <br />
        <br />
        <table class="auto-style1" align="center">
        <tr>
            <td style="width: 436px; text-align: right; height: 38px">
                <asp:Label ID="Label2" runat="server" style="font-weight: bold; font-size: medium;" Text="FECHA DE SOLICITUD"></asp:Label>
            </td>
            <td style="height: 38px">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblFecha" runat="server" style="font-weight: bold"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; height: 32px; text-align: right">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCliente" runat="server" style="font-weight: bold; font-size: medium;" Text="CLIENTE"></asp:Label>
            </td>
            <td style="height: 32px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCliente" runat="server" Height="22px" Width="295px" DataSourceID="sqlClientes" DataTextField="nombre_comercial" DataValueField="nombre_comercial" style="font-weight: bold">
                        <asp:ListItem>-SELECCIONE-</asp:ListItem>
                </asp:DropDownList>
                    &nbsp;<asp:ImageButton ID="imgAdd" runat="server" data-toggle="modal" data-target="#popupNuevaAventura" ImageUrl="~/Images/iconos/add.png" Height="22px" Width="22px" />
                    <asp:SqlDataSource ID="sqlClientes" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_comercial FROM Clientes WHERE (nombre_comercial &lt;&gt; '') ORDER BY nombre_comercial" InsertCommand="INSERT INTO lg.Solicitud_Entrada(Cliente, Transporte, Tipo_transporte, Material, Email, Telefono, Fecha_Tentativa, Status, Fecha_Solicitud) VALUES (@cliente,@tran,@tipo,@materi,@email,@tele,@fechaten,@status,@fechaSoli)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="ddlCliente" Name="cliente" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlTransporte" Name="tran" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlTipo" Name="tipo" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txtMaterial" Name="materi" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtContacto" Name="tele" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtFecha" Name="fechaten" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddlStatus" Name="status" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="lblFecha" Name="fechaSoli" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    &nbsp;
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnCrear" EventName="Click" />

                    </Triggers>
                </asp:UpdatePanel>
                
                
               
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 41px">
                <asp:Label ID="lblTransporte" runat="server" style="font-weight: bold; font-size: medium;" Text="TRANSPORTE"></asp:Label>
            </td>
            <td style="height: 41px">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTransporte" runat="server" Height="22px" Width="295px" style="font-weight: bold">
                    <asp:ListItem>-SELECCIONE-</asp:ListItem>
                    <asp:ListItem>EXTERNO</asp:ListItem>
                    <asp:ListItem>INTERNO</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 40px">
                <asp:Label ID="lblTipo" runat="server" style="font-weight: bold; font-size: medium;" Text="TIPO DE TRANSPORTE"></asp:Label>
            </td>
            <td style="height: 40px">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlTipo" runat="server" Height="22px" Width="295px" style="font-weight: bold">
                    <asp:ListItem>-SELECCIONE-</asp:ListItem>
                    <asp:ListItem>AUTO</asp:ListItem>
                    <asp:ListItem>PICK UP</asp:ListItem>
                    <asp:ListItem>RABON</asp:ListItem>
                    <asp:ListItem>TRACTO</asp:ListItem>
                    <asp:ListItem>OTRO</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 102px">
                <asp:Label ID="lblMaterial" runat="server" style="font-weight: bold; font-size: medium;" Text="MATERIAL"></asp:Label>
            </td>
            <td style="height: 102px">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtMaterial" runat="server" TextMode="MultiLine" Height="75px" Width="295px" style="font-weight: bold"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 33px;">
                <asp:Label ID="lblContacto" runat="server" style="font-weight: bold; font-size: medium;" Text="TELEFONO"></asp:Label>
            </td>
            <td style="height: 33px">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtContacto" runat="server" AutoCompleteType="BusinessPhone" TextMode="Phone" Width="295px" style="font-weight: bold"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 52px;">
                <asp:Label ID="lblEmail" runat="server" style="font-weight: bold" Text="EMAIL"></asp:Label>
            </td>
            <td style="height: 52px">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="295px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 52px;">
                <asp:Label ID="Label1" runat="server" style="font-weight: bold; font-size: medium;" Text="FECHA TENTATIVA"></asp:Label>
            </td>
            <td style="height: 52px">
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFecha" runat="server" TextMode="Date" Width="295px" style="font-weight: bold"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right">
                <asp:Label ID="lblStatus" runat="server" style="font-weight: bold" Text="STATUS"></asp:Label>
            </td>
            <td>
              &nbsp;&nbsp;&nbsp;&nbsp;  <asp:DropDownList ID="ddlStatus" runat="server" Height="22px" Width="295px" style="font-weight: bold">
                    <asp:ListItem>-SELECCIONE-</asp:ListItem>
                    <asp:ListItem>APROBADO</asp:ListItem>
                    <asp:ListItem>PENDIENTE</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 436px; text-align: right; height: 142px;"></td>
            <td style="height: 142px">
                 &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnGuardar" runat="server" class="btn btn-success" Text="Guardar" OnClick="btnGuardar_Click" />
            </td>
        </tr>
    </table>
        <div class="modal fade" id="popupNuevaAventura" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Cerrar</span></button>
        <h4 class="modal-title" id="myModalLabel">Registrar nuevo cliente</h4>
      </div>
      <div id="nuevaAventura" class="modal-body">
            <form role="form">
              <div class="form-group">
                  <asp:Label ID="lblClienteM" runat="server" Text="NOMBRE DEL CLIENTE:" style="font-weight: bold"></asp:Label>
                  <br />
                  <asp:TextBox ID="txtClienteNM" runat="server" Width="520px"></asp:TextBox>
              </div>
              <div class="form-group">
                  <asp:Label ID="lblComercial" runat="server" Text="NOMBRE COMERCIAL" style="font-weight: bold"></asp:Label>
                  <br />
                  <asp:TextBox ID="txtComerical" runat="server" Width="520px"></asp:TextBox>
              </div>
              <div class="form-group">
                  <asp:Label ID="lblRfc" runat="server" Text="RFC" style="font-weight: bold"></asp:Label>
                  <br />
                  <asp:TextBox ID="txtRfc" runat="server" Width="520px"></asp:TextBox>
           <div class="form-group">
                  <br />
                  <asp:Label ID="lblSucursal" runat="server" Text="SUCURSAL" style="font-weight: bold"></asp:Label>
                  <br />
               <asp:DropDownList ID="ddlSucursal" runat="server" Width="520px" DataSourceID="sqlSucursal" DataTextField="Nombre" DataValueField="Nombre"></asp:DropDownList>        
                  </form>      
      </div>
      <div class="modal-footer">
         <asp:Button ID="btnCerrar" runat="server" class="btn btn-default" data-dismiss="modal" Text="Cerrar" />
          <asp:Button ID="btnCrear" runat="server" class="btn btn-success" Text="Guardar" OnClick="btnCrear_Click" />
          
      </div>
    </div>
  </div>
</div>
        <asp:SqlDataSource ID="sqlSucursal" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_corto AS Nombre FROM Sucursal" InsertCommand="INSERT INTO Clientes(id_sucursal, nombre, nombre_comercial, rfc, bloqueado, inactivo, fecha_registro, es_prospecto) VALUES (@suc, @nom, @nomcom, @rfc, @bloq, @ina, @fecha, @pros)">
            <InsertParameters>
                <asp:Parameter DefaultValue="1" Name="suc" />
                <asp:ControlParameter ControlID="txtClienteNM" DefaultValue="" Name="nom" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtComerical" Name="nomcom" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtRfc" Name="rfc" PropertyName="Text" />
                <asp:Parameter DefaultValue="0" Name="bloq" />
                <asp:Parameter DefaultValue="0" Name="ina" />
                <asp:ControlParameter ControlID="lblFecha" DefaultValue="" Name="fecha" PropertyName="Text" />
                <asp:Parameter DefaultValue="0" Name="pros" />
            </InsertParameters>
    </asp:SqlDataSource>
        </form>
</asp:Content>
