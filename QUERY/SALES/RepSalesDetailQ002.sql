
    SELECT 
    TrnSales.SalesDate, 
    TrnSales.SalesNumber, 
    MstCustomer.Customer, 
    TrnSales.Remarks, 
    MstUser_1.UserName AS [User], 
    MstUser.UserName AS Sales, 
    MstItem.BarCode, 
    MstItem.ItemDescription, 
    TrnSalesLine.Preparation, 
    MstItem.Category, 
    IIf([Iscancelled]=True,0,[trnSalesLine].[Price]) AS Price, 
    TrnSalesLine.DiscountRate, 
    IIf([Iscancelled]=True,0,[trnSalesLine].[DiscountAmount]*[TrnSalesLine].[Quantity]) AS DiscountAmount, 
    IIf([Iscancelled]=True,0,[trnSalesLine].[NetPrice]) AS NetPrice, 
    TrnSalesLine.Quantity, 
    MstUnit.Unit, 
    [MstItem].[Cost]*[TrnSalesLine].[Quantity] AS ItemCost, 
    IIf([Iscancelled]=True,0,[trnSalesLine].[Amount]) AS Amount, 
    IIf([Forms]![RepSales]![FilterMem]=True,"Filtered","") AS FilterStatus
    FROM (((((((TrnSales 
    INNER JOIN TrnSalesLine ON TrnSales.Id = TrnSalesLine.SalesId) 
    INNER JOIN MstItem ON TrnSalesLine.ItemId = MstItem.Id) 
    INNER JOIN MstCustomer ON TrnSales.CustomerId = MstCustomer.Id) 
    INNER JOIN MstTax ON TrnSalesLine.TaxId = MstTax.Id) 
    INNER JOIN MstDiscount ON TrnSalesLine.DiscountId = MstDiscount.Id) 
    INNER JOIN MstUser ON TrnSales.SalesAgent = MstUser.Id) 
    INNER JOIN MstUser AS MstUser_1 ON TrnSales.PreparedBy = MstUser_1.Id) 
    INNER JOIN MstUnit ON MstItem.UnitId = MstUnit.Id
    WHERE (((TrnSales.SalesDate) Between [Forms]![RepSales]![DateStart] 
    And [Forms]![RepSales]![DateEnd]) 
    AND ((Trim(Str([TrnSalesLine].[ItemId]))) Like Nz([Forms]![RepSales]![T2_ItemIdMem],"*"))
    AND ((Nz([MstItem].[Category],"")) Like Nz([Forms]![RepSales]![T2_CategoryMem],"*")) 
    AND ((Trim(Str([TrnSales].[CustomerId]))) Like Nz([Forms]![RepSales]![T2_CustomerIdMem],"*")) 
    AND ((Trim(Str([TrnSales].[PreparedBy]))) Like Nz([Forms]![RepSales]![T2_UserIdMem],"*")) 
    AND ((Trim(Str([TrnSales].[SalesAgent]))) Like Nz([Forms]![RepSales]![T2_SalesAgentMem],"*")) 
    AND ((TrnSales.IsLocked)=True) 
    AND ((TrnSales.IsCancelled)=False)
    AND ((Nz(TrnSales.IsReturn,0))=0));


/*ORIGIN*/
SELECT TrnSales.SalesDate, TrnSales.SalesNumber, MstCustomer.Customer, TrnSales.Remarks, MstUser_1.UserName AS [User], MstUser.UserName AS Sales, MstItem.BarCode, MstItem.ItemDescription, TrnSalesLine.Preparation, MstItem.Category, IIf([Iscancelled]=True,0,[trnSalesLine].[Price]) AS Price, TrnSalesLine.DiscountRate, IIf([Iscancelled]=True,0,[trnSalesLine].[DiscountAmount]*[TrnSalesLine].[Quantity]) AS DiscountAmount, IIf([Iscancelled]=True,0,[trnSalesLine].[NetPrice]) AS NetPrice, TrnSalesLine.Quantity, MstUnit.Unit, [MstItem].[Cost]*[TrnSalesLine].[Quantity] AS ItemCost, IIf([Iscancelled]=True,0,[trnSalesLine].[Amount]) AS Amount, IIf([Forms]![RepSales]![FilterMem]=True,"Filtered","") AS FilterStatus
FROM (((((((TrnSales INNER JOIN TrnSalesLine ON TrnSales.Id = TrnSalesLine.SalesId) INNER JOIN MstItem ON TrnSalesLine.ItemId = MstItem.Id) INNER JOIN MstCustomer ON TrnSales.CustomerId = MstCustomer.Id) INNER JOIN MstTax ON TrnSalesLine.TaxId = MstTax.Id) INNER JOIN MstDiscount ON TrnSalesLine.DiscountId = MstDiscount.Id) INNER JOIN MstUser ON TrnSales.SalesAgent = MstUser.Id) INNER JOIN MstUser AS MstUser_1 ON TrnSales.PreparedBy = MstUser_1.Id) INNER JOIN MstUnit ON MstItem.UnitId = MstUnit.Id
WHERE (((TrnSales.SalesDate) Between [Forms]![RepSales]![DateStart] And [Forms]![RepSales]![DateEnd]) AND ((Trim(Str([TrnSalesLine].[ItemId]))) Like Nz([Forms]![RepSales]![T2_ItemIdMem],"*")) AND ((Nz([MstItem].[Category],"")) Like Nz([Forms]![RepSales]![T2_CategoryMem],"*")) AND ((Trim(Str([TrnSales].[CustomerId]))) Like Nz([Forms]![RepSales]![T2_CustomerIdMem],"*")) AND ((Trim(Str([TrnSales].[PreparedBy]))) Like Nz([Forms]![RepSales]![T2_UserIdMem],"*")) AND ((Trim(Str([TrnSales].[SalesAgent]))) Like Nz([Forms]![RepSales]![T2_SalesAgentMem],"*")) AND ((TrnSales.IsLocked)=True) AND ((TrnSales.IsCancelled)=False));
