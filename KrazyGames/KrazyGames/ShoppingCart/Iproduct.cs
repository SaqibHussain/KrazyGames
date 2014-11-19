using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KrazyGames
{
    interface Iproduct
    {
        int ProductID { get; set; }
        string ProductName { get; set; }
        decimal ProductUnitCost { get; set; }
        int ProductQty { get; set; }
        string ProductImageURL { get; set; }
    }
}