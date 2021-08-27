<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128539910/12.2.8%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4664)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to emulate ASPxGridView command button functionality
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4664/)**
<!-- run online end -->


<p>This example shows how to use different controls instead of built-in ASPxGridView command buttons with the same functionality. It is prohibited to modify data to preserve the example integrity. You can download this sample and run it locally.<br /><br /><strong>ASP.NET MVC Version</strong>: <a href="https://www.devexpress.com/Support/Center/p/E4058">How to emulate the Command Column with a data column DataItemTemplate</a></p>


<h3>Description</h3>

<p>It is necessary to modify the project to support CRUD operations.</p>
<p>Remove the following code block from the Default.aspx file:</p>
<code lang="aspx">OnDeleting="dataSource_Modifying" OnInserting="dataSource_Modifying" OnUpdating="dataSource_Modifying"

</code>
<p>and remove the following code fragment from the Default.aspx.cs file:</p>
<code lang="cs">String ModificationErrorText {
	get {
        	return
                "Data modifications are not supplied by this demo.";
            }
}

protected void dataSource_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
	e.Cancel = true;
        throw new NotSupportedException(ModificationErrorText);
}

</code>
<p>or the Default.aspx.vb file:</p>
&lt;para&gt;&lt;code lang="vb"&gt;Private ReadOnly Property ModificationErrorText() As String &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Get &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Return "Data modifications are not supplied by this demo." &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End Get <br /> End Property
<p>Protected Sub dataSource_Modifying(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Cancel = True &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Throw New NotSupportedException(ModificationErrorText) <br /> End Sub</p>

<br/>


