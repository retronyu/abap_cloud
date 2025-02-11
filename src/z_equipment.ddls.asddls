@AbapCatalog.sqlViewName: 'ZEQUIPMENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tabla de equipos'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_Equipment as select from zequipment_gp
{
    key equipmentid as Equipmentid,
    description as Description,
    equipmenttype as Equipmenttype,
    status as Status,
     locationid as LocationId,
    lastmaintenancedate as Lastmaintenancedate
}
