using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for Properties
/// </summary>
namespace Mapoline
{
    public class Properties
    {
        private int id;
        private double latitude;
        private double longitude;
        private string title;
        private string link;
        private string body;
        private string coordinate;
        private string category;
        private string address;

        public int ID
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }
        public string Link
        {
            get
            {
                return link;
            }
            set
            {
                link = value;
            }
        }
        public string Body
        {
            get
            {
                return body;
            }
            set
            {
                body = value;
            }
        }
        public double Latitude
        {
            get
            {
                return Math.Round(latitude, 2);
            }
            set
            {
                latitude = value;
            }

        }
        public double Longitude
        {
            get
            {
                return Math.Round(longitude, 2);
            }
            set
            {
                longitude = value;
            }

        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public string Coordinate
        {
            get { return coordinate; }
            set { coordinate = value; }
        }
        public string Category
        {
            get { return category; }
            set { category = value; }
        }
    }
}