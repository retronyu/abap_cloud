@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for Equipment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZVALUEHELP_EQUIPMENT as select from zequipment_gp
{
    key equipmentid as Equipmentid,
    description as Description,
    equipmenttype as Equipmenttype,
    status as Status,
    locationid as Locationid,
    lastmaintenancedate as Lastmaintenancedate
}
