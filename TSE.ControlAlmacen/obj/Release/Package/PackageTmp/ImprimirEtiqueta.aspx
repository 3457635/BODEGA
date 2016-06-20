<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImprimirEtiqueta.aspx.cs" Inherits="TSE.ControlAlmacen.ImprimirEtiqueta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
     <link href="../Content/Site.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
 </head>
    <form id="form1" runat="server">

    <div class="jumbotron">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <br />
        <div align="center">
        <table runat="server" id="TablaEjemplo" class="jumbotron" style="font-weight: 700">
            <tr>
                <td style="font-size: large; width: 177px;">Cliente</td>
                <td>
                    <asp:UpdatePanel ID="upId" runat="server">
                        <ContentTemplate>
                            <div class="text-left">
                                <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="True" DataSourceID="sqlClientes" DataTextField="Nombre" DataValueField="Nombre" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged" style="font-size: large" Width="200px">
                                </asp:DropDownList>
                                <asp:ImageButton ID="imgAdd" runat="server" data-target="#popupNuevaAventura" data-toggle="modal" Height="22px" ImageUrl="~/Images/iconos/add.png" Width="22px" />
                                <br />
                            </div>
                            <asp:SqlDataSource ID="sqlClientes" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_comercial AS Nombre, id_cliente FROM Cliente ORDER BY nombre"></asp:SqlDataSource>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sqlGrid" Visible="False">
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlGrid" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT id_Cliente FROM Cliente WHERE (nombre_comercial = @nomCom);
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlClientes" Name="nomCom" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    
                    <br style="font-size: large" />
                </td>
            </tr>
            <tr>
                <td style="font-size: large; width: 177px; height: 201px;">Ultima etiquerta</td>
                <td style="height: 201px; text-align: justify;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView3" runat="server" DataSourceID="sqlUltimo" Width="200px" OnRowCommand="GridView3_RowCommand">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Numero de Inicio" Text="Generar" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlUltimo" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT MAX(kd.consecutivo) AS Ultima FROM lg.Kardex_Detalle AS kd INNER JOIN lg.Kardex AS k ON k.id_kardex = kd.id_kardex AND k.id_cliente = (SELECT id_cliente FROM Cliente WHERE (nombre_comercial = @nomComercial))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlClientes" Name="nomComercial" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                            
                </td>
            </tr>
            <tr>
                <td style="font-size: large; width: 177px;">Número de inicio</td>
                <td>
                            
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <br />
                                            <asp:Label ID="lblValor" runat="server" style="font-size: large; text-align: center;"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                            
                                    <br />
                                
                </td>
            </tr>
            <tr>
                <td style="font-size: large; width: 177px; height: 62px;">Cantidad</td>
                <td style="height: 62px">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtCantidad" runat="server" style="font-size: large" Width="200px"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="width: 177px; height: 62px">
                    <asp:Button ID="btnImprimir" runat="server" class="btn btn-success" Height="40px" OnClick="btnImprimir_Click" Text="Imprimir" Width="129px" style="font-size: large" />
                </td>
                <td style="text-align: center; height: 62px;">
                    <asp:Button ID="btnCerrar" runat="server" class="btn btn-success" Height="40px" OnClick="btnCerrar_Click" Text="Cerrar" Width="129px" style="font-size: large" />
                </td>
            </tr>
        </table>

        </div>
            
    </div>

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
                  <asp:Label ID="lblFecha" Visible="false" runat="server" Text=""></asp:Label>
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
         <asp:Button ID="Button1" runat="server" class="btn btn-default" data-dismiss="modal" Text="Cerrar" />
          <asp:Button ID="btnCrear" runat="server" class="btn btn-success" Text="Guardar" OnClick="btnCrear_Click" />
          
      </div>
    </div>
  </div>
</div>
        <asp:SqlDataSource ID="sqlSucursal" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_corto AS Nombre FROM Sucursal" InsertCommand="lg.Guarda_Cliente" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtClienteNM" Name="cNombreCliente" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtComerical" Name="cNombreComercial" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtRfc" Name="cRFC" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblFecha" Name="dFechaRegistro" Type="DateTime" />
            </InsertParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
