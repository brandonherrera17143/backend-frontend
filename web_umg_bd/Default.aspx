<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_umg_bd._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbl_nombre" runat="server" CssClass="badge" Text="Nombre"></asp:Label>
    <asp:TextBox ID="txt_nombre" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_apellido" runat="server" CssClass="badge" Text="Apellido"></asp:Label>
    <asp:TextBox ID="txt_apellido" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_direccion" runat="server" CssClass="badge" Text="Direccion"></asp:Label>
    <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_telefono" runat="server" CssClass="badge" Text="Telefono"></asp:Label>
    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    <asp:Label ID="lbl_DPI" runat="server" CssClass="badge" Text="DPI"></asp:Label>
    <asp:TextBox ID="TextDPI" runat="server" CssClass="form-control" Text="DPI"></asp:TextBox>
    <asp:Label ID="lbl_fechaNacimiento" runat="server" CssClass="badge" Text="Fecha Nacimiento"></asp:Label>
    <asp:TextBox ID="txt_fechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:Label ID="lblfechaIngresoRegistro" runat="server" CssClass="badge" Text="Fecha Nacimiento"></asp:Label>
    <asp:TextBox ID="TextfechaIngresoRegistro" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:Label ID="lbl_puesto" runat="server" CssClass="badge" Text="Puesto"></asp:Label>
    <asp:DropDownList ID="drop_puesto" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-info btn-lg" OnClick="btn_agregar_Click" />
    <asp:Button ID="btn_modificar" runat="server" OnClick="btn_modificar_Click" Text="Modificar" CssClass="btn btn-success btn-lg" Visible="False" />
    <asp:Label ID="lbl_mensaje" runat="server" CssClass="alert-info"></asp:Label>
    <asp:GridView ID="grid_empleados" runat="server" AutoGenerateColumns="False" CssClass="table-condensed" DataKeyNames="id,id_puesto" OnRowDeleting="grid_empleados_RowDeleting" OnSelectedIndexChanged="grid_empleados_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Ver" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-info"  />
                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClientClick="javascript:if(!confirm('¿Desea Eliminar?'))return false" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-danger" />
            </asp:TemplateField>
            <asp:BoundField DataField="nombre" HeaderText="Nombres" />
            <asp:BoundField DataField="apellido" HeaderText="Apellidos" />
            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="DPI" HeaderText="DPI" />
            <asp:BoundField DataField="fechaNacimiento" DataFormatString="{0:d}" HeaderText="Nacimiento" />
            <asp:BoundField DataField="fechaIngresoRegistro" DataFormatString="{0:d}" HeaderText="fecha registro" />
            <asp:BoundField DataField="puesto" HeaderText="Puesto" />
        </Columns>
    </asp:GridView>
</asp:Content>
