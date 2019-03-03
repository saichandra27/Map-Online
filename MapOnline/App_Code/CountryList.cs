using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for CityList
/// </summary>
public class CityList
{
	public CityList()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public CityList(string city, string coordinate)
    {
        City = city;
        Coordinates = coordinate;
    }
    public string City
    {
        get;
        set;
    }
    public string Coordinates
    {
        get;
        set;
    }
}
