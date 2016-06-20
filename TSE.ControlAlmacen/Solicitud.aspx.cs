using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TSE.ControlAlmacen.Entrada
{
    public partial class Solicitud : System.Web.UI.Page
    {
        bool bandera = false;   
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fecha = DateTime.Now;
            lblFecha.Text = fecha.ToString();
            

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SolicitudValidacion();
            limpiarCampos();
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            validacionCliente();
            Response.Redirect("Solicitud.aspx");
        }

        void limpiarCampos() { 
            DateTime fechaN = DateTime.Now;
            lblFecha.Text = fechaN.ToString();
            txtMaterial.Text = "";
            txtEmail.Text = "";
            txtFecha.Text = "";
            ddlTransporte.Text = "-SELECCIONE-";
            ddlTipo.Text = "-SELECCIONE-";
            ddlStatus.Text = "-SELECCIONE-";

        }
        public void SolicitudValidacion()
        {
            
            if (ddlTransporte.SelectedItem.Text == "-SELECCIONE-")
            {
                Response.Write("<script>alert('Debes selecionar un tipo de transporte')</script>");
            }
            else
            {
                if (ddlTipo.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('Debes selecionar un tipo de transporte')</script>");
                }
                else
                {
                    if (String.IsNullOrEmpty(txtMaterial.Text))
                    {
                        Response.Write("<script>alert('Coloca una descripcion del material')</script>");
                        txtMaterial.Focus();
                    }
                    else
                    {
                        if (String.IsNullOrEmpty(txtContacto.Text))
                        {
                            Response.Write("<script>alert('Coloca un telefono de contacto')</script>");
                            txtContacto.Focus();
                        }
                        else
                        {
                            if (String.IsNullOrEmpty(txtEmail.Text))
                            {
                                Response.Write("<script>alert('Coloca una direccion de correo electronico')</script>");
                                txtEmail.Focus();
                            }
                            else
                            {
                                if (String.IsNullOrEmpty(txtFecha.Text))
                                {
                                    Response.Write("<script>alert('Es necesario establecer una fecha tentativa')</script>");
                                    txtFecha.Focus();
                                }
                                else
                                {
                                    if (ddlStatus.SelectedIndex == 0)
                                    {
                                        Response.Write("<script>alert('Coloca un status de solicitud')</script>");
                                    }
                                    else
                                    {

                                        bandera = true;

                                    }
                                }
                            }
                        }
                    }
                    
                }
                if (bandera == true)
                {
                    sqlClientes.Insert();
                    Response.Write("<script>alert('El registro se realizó correctamente')</script>");
                }
            }
            
        }
        public void validacionCliente() {
            bool bandera = false;

            if (string.IsNullOrEmpty(txtClienteNM.Text))
            {
                Response.Write("<script>alert('Escribe el nombre del cliente')</Script>");
            }
            else
                if (string.IsNullOrEmpty(txtComerical.Text))
                {
                    Response.Write("<script>alert('Escribe el nombre comercial del cliente')</Script>");
                }
                else
                    if (string.IsNullOrEmpty(txtRfc.Text))
                    {
                        Response.Write("<script>alert('Escribe el nombre comercial del cliente')</Script>");
                    }
                    else
                        bandera = true;
            if (bandera = true){
                sqlSucursal.Insert();
                Response.Write("<script>alert('Cliente guardado')</Script>");
                txtClienteNM.Text = "";
                txtComerical.Text = "";
                txtRfc.Text = "";
                ddlStatus.Text = "";
            }

        }

         
              }
        
    }


   