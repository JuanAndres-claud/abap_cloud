@AbapCatalog.sqlViewName: 'Z02SAL2JAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales composition'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDSJAS02_I_SALES2
  as select from ztljas02_so_i
  association [1] to ZCDSJAS02_I_SALES as _Sales on $projection.OrderId = _Sales.OrderId
{
  key item_id  as itemid,
      order_id as OrderId,
      product  as Product,
      qty      as Qty,
      uom      as Uom,
      amount   as Amount,
      currency as Currency,
      _Sales
}
