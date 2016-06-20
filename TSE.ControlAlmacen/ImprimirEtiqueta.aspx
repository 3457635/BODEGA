<%@ Page Title="ETIQUETAS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImprimirEtiqueta.aspx.cs" Inherits="TSE.ControlAlmacen.ImprimirEtiqueta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <link href="../Content/Site.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </head>
    <style>
            .auto-style10 {
        color: inherit;
        text-align: center;
        margin-bottom: 30px;
        padding-top: 48px;
        padding-bottom: 48px;
        background-color: #eee;
    }
    </style>
    <form id="form1" runat="server">
        <div class="auto-style10" runat="server" id="jmb">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            
                    <table id="TablaEjemplo" runat="server" class="jumbotron" style="font-weight: 700">
                        <tr>
                            <td style="font-size: large; width: 177px;">Sucursal</td>
                            <td class="text-left">
                                <asp:UpdatePanel ID="upCliente" runat="server">
                        <ContentTemplate>
                            
                            &nbsp;<asp:DropDownList ID="ddlSucursal" runat="server" AutoPostBack="True" CssClass="txtTamaño" DataSourceID="sdsSucursal" DataTextField="nombre_corto" DataValueField="id_sucursal" Width="200px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsSucursal" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT id_sucursal, nombre_corto FROM Sucursal order by nombre_corto"></asp:SqlDataSource>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; width: 177px;">Cliente</td>
                            <td class="text-left">
                                <asp:UpdatePanel ID="upCliente1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlCliente" runat="server" AutoPostBack="True" CssClass="txtTamaño" DataSourceID="SdsCliente" DataTextField="nombre_comercial" DataValueField="id_cliente" Width="200px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SdsCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_comercial, id_cliente FROM Cliente where id_sucursal = @suc ORDER BY nombre_comercial">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlSucursal" Name="suc" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ImageButton ID="imgAdd" runat="server" data-target="#popupNuevaAventura" data-toggle="modal" Height="22px" ImageUrl="~/Images/iconos/add.png" Width="22px" />
                                <br />
                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="sqlGrid">
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sqlGrid" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT id_Cliente FROM Cliente WHERE (nombre_comercial = @nomCom);
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCliente" Name="nomCom" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; width: 177px; height: 201px;">Ultima etiquerta</td>
                            <td style="height: 201px; " class="text-left">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView3" runat="server" DataSourceID="sqlUltimo" OnRowCommand="GridView3_RowCommand" Width="200px">
                                            <Columns>
                                                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Numero de Inicio" Text="Generar" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sqlUltimo" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT MAX(kd.consecutivo) AS Ultima FROM lg.Kardex_Detalle AS kd INNER JOIN lg.Kardex AS k ON k.id_kardex = kd.id_kardex AND k.id_cliente = (SELECT id_cliente FROM Cliente WHERE (nombre_comercial = @nomComercial))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlCliente" Name="nomComercial" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; width: 177px;">Número de inicio</td>
                            <td class="text-left">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblValor" runat="server" Style="font-size: large; text-align: center;"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large; width: 177px; height: 62px;">Cantidad</td>
                            <td style="height: 62px" class="text-left">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtCantidad" runat="server" Style="font-size: large" Width="200px"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 177px; height: 62px">
                                <asp:Button ID="btnImprimir" runat="server" class="btn btn-success" Height="40px" OnClick="btnImprimir_Click" Style="font-size: large" Text="Imprimir" Width="129px" />
                            </td>
                            <td style="height: 62px;" class="text-left">
                                <asp:Button ID="btnCerrar" runat="server" class="btn btn-success" Height="40px" OnClick="btnCerrar_Click" Style="font-size: large" Text="Cerrar" Width="129px" />
                            </td>
                        </tr>
                    </table>
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
                                <asp:Label ID="lblClienteM" runat="server" Text="NOMBRE DEL CLIENTE:" Style="font-weight: bold"></asp:Label>
                                <asp:Label ID="lblFecha" Visible="false" runat="server" Text=""></asp:Label>
                                <asp:TextBox ID="txtClienteNM" runat="server" Width="520px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblComercial" runat="server" Text="NOMBRE COMERCIAL" Style="font-weight: bold"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtComerical" runat="server" Width="520px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblRfc" runat="server" Text="RFC" Style="font-weight: bold"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtRfc" runat="server" Width="520px"></asp:TextBox>
                                <div class="form-group">
                                    <br />
                                    <asp:Label ID="lblSucursal" runat="server" Text="SUCURSAL" Style="font-weight: bold"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddlSucursal1" runat="server" Width="520px" DataSourceID="sqlSucursal2" DataTextField="Nombre" DataValueField="id_sucursal"></asp:DropDownList>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" class="btn btn-default" data-dismiss="modal" Text="Cerrar" />
                        <asp:Button ID="btnCrear" runat="server" class="btn btn-success" Text="Guardar" OnClick="btnCrear_Click" />

                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="sqlSucursal2" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_corto AS Nombre, id_sucursal FROM Sucursal" InsertCommand="lg.Guarda_Cliente" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtClienteNM" Name="cNombreCliente" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtComerical" Name="cNombreComercial" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtRfc" Name="cRFC" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblFecha" Name="dFechaRegistro" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlSucursal1" Name="sucursal" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
