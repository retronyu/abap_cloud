@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección de Viajes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define root  view entity ZC_TRAVEL_03
  provider contract transactional_query as projection on ZI_TRAVEL_03
{
   key Travelid as Travelid,
   Customerid as Customerid,
   Begindate as Begindate,
   Enddate as Enddate,
   Lastchangedat as Lastchangedat
}
