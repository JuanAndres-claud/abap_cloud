@AbapCatalog.sqlViewName: 'ZCDSCUTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Un managed Scenario Projection Layer'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Travel',
    typeNamePlural: 'Travels'
}
define root view ZCDS02_C_U_TRAVEL
  as select from /dmo/travel as Travel
  association [1] to ZCDS02_I_U_AGENCY2  as _agency   on $projection.AgencyId = _agency.AgencyId
  association [2] to ZCDS02_I_U_CUSTOMER as _customer on $projection.CustomerId = _customer.CustomerId
  association [3] to I_Currency          as _currency on $projection.CurrencyCode = _currency.Currency
{    @UI.facet: [{ purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE,
                    label: 'Details', position: 10 
                 }]
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Travel No'
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 100 }]
  key Travel.travel_id     as TravelId,
      @UI.selectionField: [{ position: 20 }]
      @EndUserText.label: 'Agency No'
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_agency'
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZCDS02_I_U_AGENCY2', element: 'AgencyId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7      
      Travel.agency_id     as AgencyId,
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Customer No'
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZCDS02_I_U_CUSTOMER', element: 'CustomerId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7      
      Travel.customer_id   as CustomerId,
      @UI.identification: [{ position: 30 }]
      Travel.begin_date    as BeginDate,
      @UI.identification: [{ position: 40 }]
      Travel.end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.identification: [{ position: 50 }]
      Travel.booking_fee   as BookingFee,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price   as TotalPrice,
      @UI.lineItem: [{ position: 50 }]
      Travel.currency_code as CurrencyCode,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 50 }]
      Travel.description   as Description,
      @UI.identification: [{ position: 60 }]
      Travel.status        as Status,
      @UI.identification: [{ position: 70 }]
      Travel.createdby     as Createdby,
      @UI.identification: [{ position: 80 }]
      Travel.createdat     as Createdat,
      @UI.identification: [{ position: 90 }]
      Travel.lastchangedby as Lastchangedby,
      @UI.identification: [{ position: 100 }]
      Travel.lastchangedat as Lastchangedat,
      _agency,
      _customer,
      _currency
}
