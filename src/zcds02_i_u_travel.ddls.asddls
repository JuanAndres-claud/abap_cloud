@AbapCatalog.sqlViewName: 'ZCDSIUTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel base CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS02_I_U_TRAVEL
  as select from /dmo/travel
  association [1] to ZCDS02_I_U_AGENCY2  as _agency   on $projection.AgencyId = _agency.AgencyId
  association [2] to ZCDS02_I_U_CUSTOMER as _customer on $projection.CustomerId = _customer.CustomerId
  association [3] to I_Currency          as _currency on $projection.CurrencyCode = _currency.Currency

{
  key /dmo/travel.travel_id     as TravelId,
      /dmo/travel.agency_id     as AgencyId,
      /dmo/travel.customer_id   as CustomerId,
      /dmo/travel.begin_date    as BeginDate,
      /dmo/travel.end_date      as EndDate,
      /dmo/travel.booking_fee   as BookingFee,
      /dmo/travel.total_price   as TotalPrice,
      /dmo/travel.currency_code as CurrencyCode,
      /dmo/travel.description   as Description,
      /dmo/travel.status        as Status,
      /dmo/travel.createdby     as Createdby,
      /dmo/travel.createdat     as Createdat,
      /dmo/travel.lastchangedby as Lastchangedby,
      /dmo/travel.lastchangedat as Lastchangedat,
      _agency,
      _customer,
      _currency

}
