Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Namespace Test
	Partial Public Class [Default]
		Inherits Page

		Private ReadOnly Property ModificationErrorText() As String
			Get
				Return "Data modifications are not supplied by this demo."
			End Get
		End Property

		Protected Sub dataSource_Modifying(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
			e.Cancel = True
			Throw New NotSupportedException(ModificationErrorText)
		End Sub

		Protected Sub btnEdit_Init(ByVal sender As Object, ByVal e As EventArgs)
			Dim btn = (TryCast(sender, ASPxButton))
			Dim nc = TryCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
			btn.ClientSideEvents.Click = String.Format("function() {{ grid.StartEditRow({0}); }}", nc.VisibleIndex)
		End Sub

		Protected Sub btnDelete_Init(ByVal sender As Object, ByVal e As EventArgs)
			Dim btn = (TryCast(sender, ASPxButton))
			Dim nc = TryCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
			btn.ClientSideEvents.Click = String.Format("function() {{ grid.DeleteRow({0}); }}", nc.VisibleIndex)
		End Sub

		Protected Sub cmbxEditForm_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
			Dim editMode = DirectCast(System.Enum.Parse(GetType(GridViewEditingMode), cmbxEditForm.Value.ToString()), GridViewEditingMode)
			grid.SettingsEditing.Mode = editMode
		End Sub
	End Class
End Namespace