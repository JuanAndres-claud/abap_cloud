@AbapCatalog.sqlViewName: 'Z02SALH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface  Basic view Sales Order With BP'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDSJAS02_I_SALES
  as select from ztljas02_so
  association [1] to ztljas02_bp as _bp on $projection.Buyer = _bp.bp_id
{
  key ztljas02_so.order_id     as OrderId,
      ztljas02_so.order_no     as OrderNo,
      ztljas02_so.buyer        as Buyer,
      ztljas02_so.gross_amount as GrossAmount,
      ztljas02_so.currency     as Currency,
      _bp
}
