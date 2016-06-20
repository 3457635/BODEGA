using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Data;
				





namespace TSE.ControlAlmacen
{
    public partial class ImprimirEtiqueta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime Now = DateTime.Now;
            lblFecha.Text = Now.ToString();
            
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            int valor;
            if (string.IsNullOrEmpty(txtCantidad.Text))
            {
                Response.Write("<script>alert('debes especificar la cantidad de etiquetas</script>");
            }else
            {
                valor= Convert.ToInt32(txtCantidad.Text);
                generarPDF(valor);

            }
                       
        }

        private void generarPDF(int valor)
        {
            
            
            Document pdfDoc = new Document(PageSize.LETTER.Rotate(), 10, 10, 10, 10);

            try
           {
                PdfWriter.GetInstance(pdfDoc, System.Web.HttpContext.Current.Response.OutputStream);

                //Open PDF Document to write data 
                pdfDoc.Open();
                for (int i = 1; i <= valor; i++) { 
                string cadenaFinal = "";
                string valor2 = ddlClientes.Text;
                string path = Server.MapPath("/Images/MarcaAguaPdf.png");
                cadenaFinal += "<br /><p style='font-size: 60pt; text-align: center''><img src='" + path + "' width='100px'/>";
                cadenaFinal += "&nbsp;&nbsp;&nbsp;&nbsp;" + valor2 + "</p><br /><br /><br /><br /><br />";
                cadenaFinal += "<br /><br /><br /><br /><br /><br /><p style='font-size: 160pt; text-align: center''>" + i + "</p><br /><br /><br /><br /><br />";
                cadenaFinal += "<p style='font-size: x-large; text-align: center''>FECHA DE ENTRADA:" + DateTime.Now + "</p>";
                //Assign Html content in a string to write in PDF 
                string strContent = cadenaFinal;

                //Read string contents using stream reader and convert html to parsed conent 
                var parsedHtmlElements = HTMLWorker.ParseToList(new StringReader(strContent), null);

                //Get each array values from parsed elements and add to the PDF document 
                foreach (var htmlElement in parsedHtmlElements)
                    pdfDoc.Add(htmlElement as IElement);
                pdfDoc.NewPage();
                }
                //Close your PDF 
                pdfDoc.Close();

                Response.ContentType = "application/pdf";

                //Set default file Name as current datetime 
                Response.AddHeader("content-disposition", "attachment; filename=Etiqueta.pdf");
                System.Web.HttpContext.Current.Response.Write(pdfDoc);

                Response.Flush();
                Response.End();

            }
           catch (Exception ex)
            {
            Response.Write(ex.ToString());
           }
            
        }
             
        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int res = 0;
            string valor = null;
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                valor = GridView3.Rows[index].Cells[1].Text;
                if (valor == "")
                {
                    valor = "0";
                }
                else
                {
                    if (valor == "&nbsp;")
                    {
                        valor = "0";
                        res = Convert.ToInt32(valor) + 1;
                        lblValor.Text = Convert.ToString(res);
                        txtCantidad.Text = "1";
                        txtCantidad.Focus();
                    }
                    else
                    {
                        res = Convert.ToInt32(valor) + 1;
                        lblValor.Text = Convert.ToString(res);
                        txtCantidad.Text = "1";
                        txtCantidad.Focus();

                    }



                }
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            sqlSucursal.Insert();
        }

   

       
        //public void buscarDatos(string nombreComercial){
            
        //    SqlConnection cn = new SqlConnection("Data Source=rtbygfdtxb.database.windows.net;Initial Catalog=ERP;User ID=omarifr;Password=Ifrramo2.");
        //    string sql;
        //    try{
           
        //        cn.Open();
        //        SqlDataReader myReader = null;
        //        sql ="select max(kd.consecutivo) from lg.kardex_detalle as kd " + 
        //                                            "join	lg.kardex as k on k.id_kardex = kd.id_kardex and id_cliente=(select id_cliente"+
        //                                            " from dbo.cliente where nombre_comercial ='"+nombreComercial+"')";
        //        SqlCommand comand = new SqlCommand(sql,cn);

        //        myReader = comand.ExecuteReader();
        //        DataGrid1.DataSource=myReader;
        //        DataGrid1.DataBind();
        //    }catch(Exception e){
            
        //    }
            
        //    //SqlDataReader reader = null;
        //    //SqlCommand com
        //    //SqlDataAdapter da = new SqlDataAdapter("select	max(kd.consecutivo) from	lg.kardex_detalle as kd " + 
        //    //                                        "join	lg.kardex as k on k.id_kardex = kd.id_kardex and id_cliente=(select id_cliente"+
        //    //                                        " from dbo.cliente where nombre_comercial ='"+ddlClientes.Text+"' )", cn);
        //    //reader = da.executeReader();
        //    //DataSet ds = new System.Data.DataSet();
        //    //da.Fill(ds);
        //    //cn.Close();
        //    //DataGrid1.DataSource = ds;
        //    //DataGrid1.DataBind();
        //    cn.Close();
            
            
        //}




        
    }

}

        
    