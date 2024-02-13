<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test.Default" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to emulate ASPxGridView command button functionality</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:AccessDataSource ID="dataSource" runat="server" DataFile="~\App_Data\nwind.mdb"
                OnDeleting="dataSource_Modifying" OnInserting="dataSource_Modifying" OnUpdating="dataSource_Modifying"
                SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?"
                InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [City] = ?, [Region] = ?, [Country] = ? WHERE [CustomerID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Region" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <dx:ASPxComboBox ID="cmbxEditForm" runat="server" ValueType="System.String" OnSelectedIndexChanged="cmbxEditForm_SelectedIndexChanged" AutoPostBack="true"
                SelectedIndex="0">
                <Items>
                    <dx:ListEditItem Value="Inline" />
                    <dx:ListEditItem Value="EditForm" />
                    <dx:ListEditItem Value="EditFormAndDisplayRow" />
                    <dx:ListEditItem Value="PopupEditForm" />
                </Items>
            </dx:ASPxComboBox>
            <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dataSource" KeyFieldName="CustomerID" ClientInstanceName="grid" Width="700px" Theme="Office365">
                <Columns>
                    <dx:GridViewCommandColumn>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Commands">
                        <DataItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnNew" runat="server" Text="New" AutoPostBack="false">
                                            <ClientSideEvents Click="function() { grid.AddNewRow(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnEdit" runat="server" Text="Edit" AutoPostBack="false" OnInit="btnEdit_Init">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDelete" runat="server" Text="Delete" AutoPostBack="false" OnInit="btnDelete_Init">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" AutoPostBack="false">
                                            <ClientSideEvents Click="function() { grid.UpdateEdit(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="false">
                                            <ClientSideEvents Click="function() { grid.CancelEdit(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EditFormSettings Visible="false" />
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="ContactName" />
                    <dx:GridViewDataColumn FieldName="CompanyName" />
                    <dx:GridViewDataColumn FieldName="City" />
                    <dx:GridViewDataColumn FieldName="Region"/>
                    <dx:GridViewDataColumn FieldName="Country" />
                </Columns>
                <SettingsPopup>
                    <EditForm Width="666px" />
                </SettingsPopup>
                <Templates>
                    <EditForm>
                        <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server" />
                        <table>
                            <tr>
                                <td style="width: 100%" />
                                <td>
                                    <dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" AutoPostBack="false">
                                        <ClientSideEvents Click="function() { grid.UpdateEdit(); }" />
                                    </dx:ASPxButton>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="false">
                                        <ClientSideEvents Click="function() { grid.CancelEdit(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </EditForm>
                </Templates>
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
