@Metadata.allowExtensions: true
@Search: { searchable: true }
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_JAS_GROCERY
  provider contract transactional_query
  as projection on ZR_JAS_GROCERY
{
  key Id,
      
      Product,
      
      Category,
      @Search.defaultSearchElement: true
      Brand,
      Price,
      @Semantics.currencyCode: true
      Currency,
      Quantity,
      Purchasedate,

      Expirationdate,

      Expired,
      @Search.defaultSearchElement: true 
      Rating,
      Note,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      Locallastchanged

}
