using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLogicLayer.UsersLogic;
using System.Data;
using Model;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for CalculatorWebService
/// </summary>
[WebService(Namespace = "http://hb4u.org/webServices")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class CalculatorWebService : System.Web.Services.WebService
{

    public CalculatorWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string get_UserName()
    {
        UserLogic UserBLL = new UserLogic();
        return UserBLL.get_UserInfo().UserName;
    }

    [WebMethod]
    public string get_UserObject()
    {
        UserLogic UserBLL = new UserLogic();
        Users usuario = UserBLL.get_UserInfo();
        var jsonUsuario = new JavaScriptSerializer().Serialize(usuario);
        return jsonUsuario;
    }

    private DataTable ToDataTable<T>(T entity) where T : class
    {
        var properties = typeof(T).GetProperties();
        var table = new DataTable();

        foreach (var property in properties)
        {
            table.Columns.Add(property.Name, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType);
        }

        table.Rows.Add(properties.Select(p => p.GetValue(entity, null)).ToArray());
        return table;

    }

}
