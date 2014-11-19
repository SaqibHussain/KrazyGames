using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KrazyGames
{
    public class CartItems : Iproduct, IEquatable<CartItems>
    {
        private int _productID;
        private string _productName;
        private int _productQty;
        private decimal _productCost;
        private string _productImageURL;

        private Product _product = null;
        public CartItems(int productId)
        {
            this.ProductID = productId;
        }
        public Product product
        {
            get
            {
                // Lazy initialization - the object won't be created until it is needed
                if (_product == null)
                {
                    _product = new Product(ProductID);

                }
                return _product;
            }
        }


        public int ProductID
        {
            get
            {
                return _productID;
            }
            set
            {
                // To ensure that the Prod object will be re-created
                _product = null;
                _productID = value;
            }
        }

        public string ProductName
        {
            get
            {
                return product.ProductName;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public decimal ProductUnitCost
        {
            get
            {
                return product.ProductUnitCost;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int ProductQty { get; set; }

        public string ProductImageURL
        {
            get
            {
                return product.ProductImageURL;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public decimal TotalPrice
        {
            get { return ProductUnitCost * ProductQty; }
        }

        /**
        * Equals() - Needed to implement the IEquatable interface
        *    Tests whether or not this item is equal to the parameter
        *    This method is called by the Contains() method in the List class
        *    We used this Contains() method in the ShoppingCart AddItem() method
        */
        public bool Equals(CartItems item)
        {
            return item.ProductID == this.ProductID;
        }
    }
}