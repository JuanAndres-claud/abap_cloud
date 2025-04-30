@AbapCatalog.sqlViewName: 'ZPPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Private  Basic view for Product'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDSJAS02_P_PROD
  as select from ztljas02_product
{
  key product_id as ProductId,
      name       as Name,
      category   as Category,
      price      as Price,
      currency   as Currency,
      discount   as Discount
}
