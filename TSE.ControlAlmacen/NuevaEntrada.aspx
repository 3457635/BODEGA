<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaEntrada.aspx.cs" Inherits="TSE.ControlAlmacen.NuevaEntrada" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
     <link href="../Content/Site.css" rel="stylesheet" type="text/css" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
 </head>
<style>
    .txtTamaño {
        width: 80%;
    }
       .tabla {
        height:37px;
    }
    .auto-style2 {
        height: 18px;
        width: 440px;
    }
    .auto-style4 {
        height: 18px;
        width: 184px;
        font-weight: bold;
        text-align: justify;
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
        color: inherit;
        text-align: center;
        margin-bottom: 30px;
        padding-top: 48px;
        padding-bottom: 48px;
        background-color: #eee;
    }
    .auto-style11 {
        width: 184px;
        text-align: justify;
    }
    .auto-style14 {
        width: 184px;
        height: 37px;
        font-weight: bold;
        text-align: justify;
    }
    .auto-style16 {
        width: 624px;
        border-collapse: collapse;
    }
    .auto-style17 {
        width: 440px;
    }
    .auto-style18 {
        font-size: xx-large;
    }
    .auto-style19 {
        width: 184px;
        font-weight: bold;
        text-align: justify;
    }
    </style>

    <form id="form1" runat="server">
         
    <div class="auto-style10" runat="server" id="jmb">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h1 class="text-center"><strong class="auto-style18"> NUEVA ENTRADA</strong></h1>
        <br />
        <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label></p>
        <table align="center" class="auto-style16" >
            <tr class="tabla">
                <td class="auto-style19">SUCURSAL</td>
                <td class="auto-style17">
                    <asp:UpdatePanel ID="upCliente" runat="server">
                        <ContentTemplate>
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <asp:DropDownList ID="ddlSucursal" runat="server" AutoPostBack="True" CssClass="txtTamaño" DataSourceID="sdsSucursal" DataTextField="nombre_corto" DataValueField="id_sucursal">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsSucursal" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT id_sucursal, nombre_corto FROM Sucursal order by nombre_corto"></asp:SqlDataSource>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">CLIENTE&nbsp;&nbsp;</td>
                <td class="auto-style17">
                    <asp:UpdatePanel ID="upCliente1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCliente" runat="server" AutoPostBack="True" CssClass="txtTamaño" DataSourceID="SdsCliente" DataTextField="nombre_comercial" DataValueField="id_cliente">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SdsCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT nombre_comercial, id_cliente FROM Cliente where id_sucursal = @suc ORDER BY nombre_comercial">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSucursal" Name="suc" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCliente" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">FECHA DE RECEPCION</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtFReg" runat="server" CssClass="txtTamaño" TextMode="Date"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFReg" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style14">CAJA</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtCaja" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCaja" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">PLACAS CAJA</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtPCaja" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">TRACTO</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtTracto" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTracto" CssClass="auto-style9" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">PLACAS TRACTO</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtPTracto" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">CHOFER</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtChofer" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style4">TRANSPORTISTA</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTranspor" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style19">COMENTARIO</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtComent" runat="server" CssClass="txtTamaño" Height="57px" TextMode="MultiLine"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr class="tabla">
                <td class="auto-style19">NUMERO DE TARIMAS<br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style17">
                    <br />
                    
                    <asp:TextBox ID="txtNTar" runat="server" CssClass="txtTamaño"></asp:TextBox>
                    
                    <br />
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
            <tr class="tabla">
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />

        
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="2" CellSpacing="4" DataKeyNames="id" ForeColor="#569D7F" HorizontalAlign="Center" OnRowCancelingEdit="GridView4_RowCancelingEdit" OnRowDeleting="GridView4_RowDeleting" OnRowEditing="GridView4_RowEditing" OnRowUpdating="GridView4_RowUpdating">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                            <EditItemTemplate>
                                <asp:Label ID="id" runat="server" Enabled="false" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="id0" runat="server" Enabled="false" Text='<%# Bind("id") %>'></asp:Label>
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
                    <FooterStyle BackColor="White" Font-Bold="True" ForeColor="#569D7F" HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <HeaderStyle BackColor="#42916A" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <PagerStyle BackColor="#569D7F" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <br />
                <asp:DataGrid ID="DataGrid1" runat="server" Visible="False">
                </asp:DataGrid>
                <asp:SqlDataSource ID="sdsUbicacion" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" DeleteCommand="delete from tmpKardexDetalle" SelectCommand="SELECT [nombre_celda] FROM [lg].[Ubicacion] where disponible=0 and id_sucursal=1" UpdateCommand="update lg.Ubicacion set disponible = 0 where nombre_celda = @ubicacion">
                    <UpdateParameters>
                        <asp:Parameter Name="ubicacion" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <table class="nav-justified">
                    <tr>
                        <td>
                            <asp:Button ID="btnGuardar" runat="server" class="btn btn-success" CssClass="btn active" Height="32px" OnClick="btnGuardar_Click" TabIndex="1" Text="GUARDAR" Visible="False" Width="98px" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancelar" runat="server" class="btn btn-success" Height="32px" OnClick="btnCancelar_Click" Text="CANCELAR" Visible="False" Width="101px" />
                        </td>
                    </tr>
                </table>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>

        
        <br />
        <br />
        
            <ContentTemplate>
                <table class="auto-style6">
                    <tr>
                        <td class="auto-style7">
                            <asp:SqlDataSource ID="sdsFolio0" runat="server" ConnectionString="<%$ ConnectionStrings:ERPConnectionString %>" SelectCommand="SELECT top 1 id_kardex as FOLIO FROM LG.KARDEX order by id_kardex desc" InsertCommand="lg.Guarda_datos_prueba2" InsertCommandType="StoredProcedure">
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
