using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DataAccessLayer;

namespace KrazyGames
{
    public class Product : Iproduct
    {
        private int _productID;
        private string _productName;
        private int _productQty;
        private decimal _productCost;
        private string _productImageURL;

        public int ProductID
        {
            get { return _productID; }
            set { _productID = value; }
        }

        public string ProductName
        {
            get { return _productName; }
            set { _productName = value; }
        }

        public decimal ProductUnitCost
        {
            get { return _productCost; }
            set { _productCost = value; }
        }

        public int ProductQty
        {
            get { return _productQty; }
            set { _productQty = value; }
        }

        public string ProductImageURL
        {
            get { return _productImageURL; }
            set { _productImageURL = value; }
        }

        public Product(int id)
        {

            // reterive from database
            this.ProductID = id;
            DataAccess pInfo = new DataAccess();
            DataView dv = pInfo.pGetInfo(id.ToString());

            this.ProductUnitCost = Convert.ToDecimal(dv.Table.Rows[0]["UnitPrice"]);
            this.ProductName = dv.Table.Rows[0]["Name"].ToString();
            //switch (id)
            //{
            //    case 1:

            //        this.ProductUnitCost = 8.20m;
            //        this.ProductName = "Product1";
            //        break;
            //    case 2:
            //        this.ProductUnitCost = 88.50m;
            //        this.ProductName = "Product2";
            //        break;
            //    case 3:
            //        this.ProductUnitCost = 28.99m;
            //        this.ProductName = "Product3";
            //        break;
            //}
        }
    }
}