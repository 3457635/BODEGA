<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaEntrada.aspx.cs" Inherits="TSE.ControlAlmacen.NuevaEntrada" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
     <link href="../Content/Site.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
 </head>
<style>
    .txtTamaño {
        width: 250px;
       
    }
       .tabla {
        height: 37px;
    }
    .auto-style1 {
        width: 252px;
    }
    .auto-style2 {
        height: 18px;
        width: 252px;
    }
    .auto-style3 {
        width: 1223px;
        height: 37px;
        font-weight: bold;
    }
    .auto-style4 {
        height: 18px;
        width: 252px;
        font-weight: bold;
    }
    .auto-style5 {
        width: 252px;
        font-weight: bold;
    }
    .auto-style6 {
        width: 100%;
    }
    .auto-style7 {
        width: 426px;
    }
    .auto-style8 {
        width: 442px;
    }
    .auto-style9 {
        color: #FF0000;
    }
    .auto-style10 {
        font-weight: bold;
    }
    </style>

    <form id="form1" runat="server">
         
    <div class="jumbotron" runat="server" id="jmb">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label></p>
        <table >
            <tr class="tabla">
                <td><b>CLIENTE&nbsp;</b></td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="upCliente" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCliente" runat="server" AutoPostBack="True" CssClass="txtTamaño" DataSourceID="SdsCliente" DataTextField="nombre_comercial" DataValueField="id_cliente">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SdsCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_comercial, id_cliente FROM Cliente where id_sucursal = @suc ORDER BY nombre_comercial">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSucursal" Name="suc" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCliente" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">SUCURSAL</td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="upCliente1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlSucursal" runat="server" CssClass="txtTamaño" DataSourceID="sdsSucursal" DataTextField="nombre_corto" DataValueField="id_sucursal" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsSucursal" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT id_sucursal, nombre_corto FROM Sucursal order by nombre_corto"></asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">FECHA DE RECEPCION</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtFReg" runat="server" CssClass="txtTamaño" TextMode="Date"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFReg" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style3">CAJA</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCaja" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCaja" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">PLACAS CAJA</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPCaja" runat="server" CssClass="txtTamaño"></asp:TextBox>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">TRACTO</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtTracto" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTracto" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">PLACAS TRACTO</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPTracto" runat="server" CssClass="txtTamaño"></asp:TextBox>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style5">CHOFER</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtChofer" runat="server" CssClass="txtTamaño"></asp:TextBox>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style4">TRANSPORTISTA</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTranspor" runat="server" CssClass="txtTamaño"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">COMENTARIO</td>
                <td class="tabla">
                    <asp:TextBox ID="txtComent" runat="server" CssClass="txtTamaño"></asp:TextBox>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style1"><b>NUMERO DE TARIMAS<br />
                    <br />
                    <br />
                    </b>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtNTar" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNTar" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnGenerar" class="btn btn-success" runat="server" Text="Detalle" Height="40px" Width="129px" OnClick="btnGenerar_Click1" Font-Bold="True" Font-Size="Large" />
                            <asp:SqlDataSource ID="sdsKardex" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" InsertCommand="lg.Guarda_Kardex_Net" InsertCommandType="StoredProcedure" SelectCommand="select * from lg.tarimas">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="ddlCliente" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlSucursal" Name="idSucursal" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtFReg" Name="fechaEntrada" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="lblFecha" Name="fechaRegistro" PropertyName="Text" Type="DateTime" />
                                    <asp:Parameter DefaultValue="1" Name="idTipoMov" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtNTar" DefaultValue="" Name="numeroTarimas" PropertyName="Text" Type="Int32" />
                                    <asp:Parameter DefaultValue="1" Name="idUsuario" Type="Int32" />
                                    <asp:Parameter DefaultValue="1" Name="destino" Type="String" />
                                    <asp:ControlParameter ControlID="txtComent" DefaultValue="" Name="comentarios" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtCaja" DefaultValue="" Name="contenedor" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTracto" Name="tracto" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtChofer" Name="chofer" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTranspor" Name="transportista" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtPTracto" Name="placaTracto" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtPCaja" Name="placaCaja" PropertyName="Text" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" InsertCommand="lg.Guarda_Entrada_Net_Tmp" SelectCommand="SELECT Tarima.* FROM lg.Tarima" InsertCommandType="StoredProcedure" DeleteCommand="delete from tmpKardexDetalle">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="ddlCliente" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlSucursal" Name="idSucursal" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtFReg" Name="fechaEntrada" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="lblFecha" Name="fechaRegistro" PropertyName="Text" Type="DateTime" />
                                    <asp:Parameter Name="idTipoMov" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtNTar" Name="numeroTarimas" PropertyName="Text" Type="Int32" />
                                    <asp:Parameter DefaultValue="1" Name="idUsuario" Type="Int32" />
                                    <asp:Parameter Name="destino" Type="String" />
                                    <asp:ControlParameter ControlID="txtComent" DefaultValue="" Name="comentarios" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtCaja" Name="contenedor" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTracto" Name="tracto" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtChofer" Name="chofer" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTranspor" Name="transportista" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtPTracto" Name="placaTracto" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtPCaja" Name="placaCaja" PropertyName="Text" Type="String" />
                                    <asp:Parameter DefaultValue="0.0" Name="alto" Type="Decimal" />
                                    <asp:Parameter DefaultValue="0.0" Name="ancho" Type="Decimal" />
                                    <asp:Parameter DefaultValue="0.0" Name="largo" Type="Decimal" />
                                    <asp:Parameter Name="ubicacion" Type="String" DefaultValue="" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" GridLines="Horizontal" OnRowCancelingEdit="GridView4_RowCancelingEdit" OnRowEditing="GridView4_RowEditing" OnRowUpdating="GridView4_RowUpdating" OnRowDeleting="GridView4_RowDeleting">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                            <EditItemTemplate>
                                <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>' Enabled="false"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id" runat="server" Text='<%# Bind("id") %>' Enabled="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="alto" SortExpression="alto">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAlto" runat="server" Text='<%# Bind("alto") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("alto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ancho" SortExpression="ancho">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAncho" runat="server" Text='<%# Bind("ancho") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ancho") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="largo" SortExpression="largo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLargo" runat="server" Text='<%# Bind("largo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("largo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ubicacion" SortExpression="ubicacion">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlUbica" runat="server" AppendDataBoundItems="true" DataSourceID="sdsUbicacion" DataTextField="nombre_celda" DataValueField="nombre_celda" Height="22px" SelectedValue='<%# Bind("ubicacion") %>' Width="159px">
                                    <asp:ListItem Text="Select" Value="" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ubicacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsUbicacion" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT [nombre_celda] FROM [lg].[Ubicacion] where disponible=0 and id_sucursal=1" DeleteCommand="delete from tmpKardexDetalle" UpdateCommand="update lg.Ubicacion set disponible = 0 where nombre_celda = @ubicacion">
                    <UpdateParameters>
                        <asp:Parameter Name="ubicacion" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnGuardar" class="btn btn-success" runat="server" Text="GUARDAR" TabIndex="1" Visible="False" OnClick="btnGuardar_Click" CssClass="auto-style10" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        
            <ContentTemplate>
                <table class="auto-style6">
                    <tr>
                        <td class="auto-style7">
                            <asp:SqlDataSource ID="sdsFolio0" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT top 1 id_kardex as FOLIO FROM LG.KARDEX order by id_kardex desc" InsertCommand="lg.Guarda_datos_prueba" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Name="id_cliente" Type="Int32" />
                                    <asp:Parameter Name="id_sucursal" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="fecha" />
                                    <asp:Parameter DbType="Date" Name="fecha_registro" />
                                    <asp:Parameter Name="numero_tarimas" Type="Int32" />
                                    <asp:Parameter Name="id_usuario" Type="Int32" />
                                    <asp:Parameter Name="comentarios" Type="String" />
                                    <asp:Parameter Name="contenedor" Type="String" />
                                    <asp:Parameter Name="tracto" Type="String" />
                                    <asp:Parameter Name="chofer" Type="String" />
                                    <asp:Parameter Name="transportista" Type="String" />
                                    <asp:Parameter Name="placa_tracto" Type="String" />
                                    <asp:Parameter Name="placa_caja" Type="String" />
                                    <asp:Parameter Name="alto" Type="Decimal" />
                                    <asp:Parameter Name="ancho" Type="Decimal" />
                                    <asp:Parameter Name="largo" Type="Decimal" />
                                    <asp:Parameter Name="ubicacion" Type="String" />
                                    <asp:Parameter Name="vueltas" Type="Int32" />
                                    <asp:Parameter Name="inicio" Type="Int32" />
                                    <asp:Parameter Name="idTemp" Type="Int32" />
                                    <asp:Parameter Name="consecutivo" Type="Int32" />
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="auto-style8">
                           
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
       </div>
    </form>
</asp:Content>
