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
   key equipment_id as Equipmentid,
    description as Description,
    equipmenttype as Equipmenttype,
    status as Status,
    location_id as Locationid,
    lastmaintenancedate as Lastmaintenancedate
}
