@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista de Viajes'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TRAVEL_03 as select from ztravel_03

{
    key travelid as Travelid,
    customerid as Customerid,
    begindate as Begindate,
    enddate as Enddate,
    lastchangedat as Lastchangedat

}
