using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSE.ControlAlmacen
{
    public partial class NuevaEntrada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fecha = DateTime.Now;
            lblFecha.Text = Convert.ToString(fecha);
            if (!IsPostBack)
            {
                llenar();
            }
        }
        string constr = @"Data Source=rtbygfdtxb.database.windows.net;Initial Catalog=ERP;User ID=omarifr;Password=Ifrramo2.";
        protected void llenar()
        {
            SqlConnection sc = new SqlConnection("Data Source=rtbygfdtxb.database.windows.net;Initial Catalog=ERP;User ID=omarifr;Password=Ifrramo2.");
            SqlCommand sm = new SqlCommand("Select id, alto, largo, ancho, ubicacion from tmpKardexDetalle", sc);
            SqlDataAdapter sa = new SqlDataAdapter(sm);
            DataTable dt = new DataTable();
            sa.Fill(dt);
            this.GridView4.DataSource = dt;
            this.GridView4.DataBind();
            this.DataGrid1.DataSource = dt;
            this.DataGrid1.DataBind();
        }
        protected void liberaEspacio(Int32 id)
        {
            string constr2 = @"Data Source=rtbygfdtxb.database.windows.net;Initial Catalog=ERP;User ID=omarifr;Password=Ifrramo2.";
            string query2 = "UPDATE LG.UBICACION SET DISPONIBLE = 0 WHERE NOMBRE_CELDA = (SELECT UBICACION FROM TMPKARDEXDETALLE WHERE ID= @ID)";
            SqlConnection con2 = new SqlConnection(constr2);
            SqlCommand com2 = new SqlCommand(query2, con2);
            com2.Parameters.Add("@ID", SqlDbType.Int).Value = id;
            con2.Open();
            com2.ExecuteNonQuery();
            con2.Close();
            llenar();
        }
        protected void GridView4_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView4.Rows[e.RowIndex];
            TextBox txtLargo = (TextBox)row.FindControl("txtLargo");
            TextBox txtAncho = (TextBox)row.FindControl("txtAncho");
            TextBox txtAlto = (TextBox)row.FindControl("txtAlto");
            DropDownList ddlUbica = (DropDownList)row.FindControl("ddlUbica");
            int id = Int32.Parse(GridView4.DataKeys[e.RowIndex].Value.ToString());
            string largo = txtLargo.Text;
            string alto = txtAlto.Text;
            string ancho = txtAncho.Text;
            string ubica = ddlUbica.SelectedValue;
            Updatetable(id, alto, largo, ancho, ubica);
        }
        protected void GridView4_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView4.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;

            //Edicion y actualizacion de un solo dato segun el ID de la tabla
            GridViewRow row = GridView4.Rows[e.NewEditIndex];
            int id2 = Int32.Parse(GridView4.DataKeys[e.NewEditIndex].Value.ToString());
            liberaEspacio(id2);
            llenar();
        }

        protected void GridView4_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            GridView4.EditIndex = -1;
            llenar();
        }

        private void ReposicionUbicacion(string ubicacion)
        {
            string query2 = "UPDATE lg.Ubicacion SET disponible = 1 where nombre_celda=@ubicacion";
            SqlConnection con2 = new SqlConnection(constr);
            SqlCommand com2 = new SqlCommand(query2, con2);
            com2.Parameters.Add("@ubicacion", SqlDbType.VarChar).Value = ubicacion;
            con2.Open();
            com2.ExecuteNonQuery();
            con2.Close();
        }



        private void Updatetable(int id, string alto, string largo, string ancho, string ubicacion)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr);
                SqlConnection con2 = new SqlConnection(constr);
                string query = "UPDATE tmpKardexDetalle SET alto = @alto, ancho = @ancho, largo= @largo, ubicacion=@ubicacion WHERE id = @id";
                string query2 = "UPDATE lg.Ubicacion SET Disponible = 1 where nombre_celda=@ubicacion";


                SqlCommand com = new SqlCommand(query, con);
                SqlCommand com2 = new SqlCommand(query2, con2);

                com.Parameters.Add("@alto", SqlDbType.Decimal).Value = alto;
                com.Parameters.Add("@largo", SqlDbType.Decimal).Value = largo;
                com.Parameters.Add("@ancho", SqlDbType.Decimal).Value = ancho;
                com.Parameters.Add("@ubicacion", SqlDbType.VarChar).Value = ubicacion;
                com.Parameters.Add("@id", SqlDbType.Int).Value = id;
                com2.Parameters.Add("@ubicacion", SqlDbType.VarChar).Value = ubicacion;
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                con2.Open();
                com2.ExecuteNonQuery();
                con2.Close();
                GridView4.EditIndex = -1;
                llenar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void guardarTodo(int id_temp, string alto, string largo, string ancho)
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand sqlcomm;
            con.Open();
            sqlcomm = new SqlCommand();
            sqlcomm.Connection = con;
            //Se indica que sera un SP 
            sqlcomm.CommandType = CommandType.StoredProcedure;
            //Nombre del SP
            sqlcomm.CommandText = "[lg].[Guarda_datos_prueba2]";
            //Parametros del SP
            sqlcomm.Parameters.Add(new SqlParameter("@id_temp", SqlDbType.Int)).Value = id_temp;
            sqlcomm.Parameters.Add(new SqlParameter("@alto", SqlDbType.Decimal)).Value = alto;
            sqlcomm.Parameters.Add(new SqlParameter("@largo", SqlDbType.Decimal)).Value = largo;
            sqlcomm.Parameters.Add(new SqlParameter("@ancho", SqlDbType.Decimal)).Value = ancho;
            sqlcomm.ExecuteNonQuery();
            sqlcomm.Dispose();
            con.Close();
        }


        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView4.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection sc = new SqlConnection("Data Source=rtbygfdtxb.database.windows.net;Initial Catalog=ERP;User ID=omarifr;Password=Ifrramo2.");
            sc.Open();
            GridViewRow row = GridView4.Rows[e.RowIndex];
            Label val = (Label)row.FindControl("id");
            string id2 = val.Text;
            //Int32 valor = Convert.ToInt32(val);
            SqlCommand cmd = new SqlCommand("Delete From tmpKardexDetalle WHERE id=@id", sc);
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id2;
            cmd.ExecuteNonQuery();
            sc.Close();
            llenar();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_temp;
            string ubicacion, largo, alto, ancho;
            foreach (DataGridItem dgItem in DataGrid1.Items)
            {
                ubicacion = dgItem.Cells[4].Text;

                if (ubicacion != "" && ubicacion != "&nbsp;")
                {
                    ReposicionUbicacion(ubicacion);
                }
            }
            foreach (DataGridItem dgItem2 in DataGrid1.Items)
            {
                id_temp = Convert.ToInt32(dgItem2.Cells[0].Text);
                ubicacion = dgItem2.Cells[4].Text;
                largo = dgItem2.Cells[3].Text;
                alto = dgItem2.Cells[1].Text;
                ancho = dgItem2.Cells[2].Text;
                guardarTodo(id_temp, alto, largo, ancho);
            }
            //Response.Write("<script>alert('DATOS GUARDADOS CORRECTAMENTE.')</script>");
            //limpiarCampos();
            Response.Redirect("~/NuevaEntrada.aspx");
        }

        protected void btnGenerar_Click1(object sender, EventArgs e)
        {
            GridView4.Visible = true;
            int valor = Convert.ToInt32(txtNTar.Text);
            sdsTemp.Delete();
            sdsKardex.Insert();
            for (int i = 0; i < valor; i++)
            {
                sdsTemp.Insert();
            }
            llenar();
            Validar();
        }
        protected void Validar()
        {
            txtNTar.Enabled = false;
            btnGuardar.Visible = true;
            btnCancelar.Visible = true;
            btnGenerar.Visible = false;
            ddlCliente.Enabled = false;
            ddlSucursal.Enabled = false;
            txtFReg.Enabled = false;
            txtCaja.Enabled = false;
            txtPCaja.Enabled = false;
            txtTracto.Enabled = false;
            txtPTracto.Enabled = false;
            txtChofer.Enabled = false;
            txtTranspor.Enabled = false;
            txtComent.Enabled = false;
            txtNTar.Enabled = false;

        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            int valor = 0;
            valor = Convert.ToInt32(txtNTar.Text);
            string ubicacion;

            foreach (DataGridItem dg in DataGrid1.Items)
            {
                ubicacion = dg.Cells[4].Text;
                cancelar(ubicacion);
            }
            Response.Redirect("~/NuevaEntrada.aspx");
        }
        protected void limpiarCampos()
        {
            ddlCliente.SelectedIndex = 0;
            ddlSucursal.SelectedIndex = 0;
            txtFReg.Text = "";
            txtCaja.Text = "";
            txtPCaja.Text = "";
            txtTracto.Text = "";
            txtPTracto.Text = "";
            txtChofer.Text = "";
            txtTranspor.Text = "";

        }
        protected void cancelar(string ubicacion)
        {
            SqlConnection con = new SqlConnection(constr);
            SqlCommand sqlcomm;
            con.Open();
            sqlcomm = new SqlCommand();
            sqlcomm.Connection = con;
            //Se indica que sera un SP 
            sqlcomm.CommandType = CommandType.StoredProcedure;
            //Nombre del SP
            sqlcomm.CommandText = "[lg].[borra_datos_prueba]";
            //Parametros del SP
            sqlcomm.Parameters.Add(new SqlParameter("@ubicacion", SqlDbType.VarChar)).Value = ubicacion;
            sqlcomm.ExecuteNonQuery();
            sqlcomm.Dispose();
            con.Close();
        }



        protected void GridView4_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                foreach (GridViewRow fila in GridView4.Rows)
                {
                    string ubicacion = GridView4.Rows[id].Cells[3].Text;
                }




            }

        }

    }
}