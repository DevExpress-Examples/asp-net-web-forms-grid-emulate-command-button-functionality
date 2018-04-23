using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

namespace Test {
    public partial class Default : Page {

        String ModificationErrorText {
            get {
                return
                    "Data modifications are not supplied by this demo.";
            }
        }

        protected void dataSource_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
            e.Cancel = true;
            throw new NotSupportedException(ModificationErrorText);
        }

        protected void btnEdit_Init(object sender, EventArgs e) {
            var btn = (sender as ASPxButton);
            var nc = btn.NamingContainer as GridViewDataItemTemplateContainer;
            btn.ClientSideEvents.Click = String.Format("function() {{ grid.StartEditRow({0}); }}", nc.VisibleIndex);
        }

        protected void btnDelete_Init(object sender, EventArgs e) {
            var btn = (sender as ASPxButton);
            var nc = btn.NamingContainer as GridViewDataItemTemplateContainer;
            btn.ClientSideEvents.Click = String.Format("function() {{ grid.DeleteRow({0}); }}", nc.VisibleIndex);
        }

        protected void cmbxEditForm_SelectedIndexChanged(object sender, EventArgs e) {
            var editMode = (GridViewEditingMode)Enum.Parse(typeof(GridViewEditingMode), cmbxEditForm.Value.ToString());
            grid.SettingsEditing.Mode = editMode;
        }
    }
}